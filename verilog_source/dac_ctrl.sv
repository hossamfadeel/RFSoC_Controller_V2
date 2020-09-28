


//Sits between the waveform fifo and the RFSoC Data Converter DAC
//Controlls triggering for waveform playback
//Mask buffer is used in its origional form to mask out the first cycle
//Used in its inverted form at end of playback

import rfsoc_config::*;

module dac_ctrl
(

	input wire clk,//250MHz clock from RFSoC IP
	input wire rst,

	//Output to RFSoC IP
	output reg [255:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready,
	
	//Input from waveform fifo
    input wire [255:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output reg s_axis_tready,
	
	
	//Input from gpio_ctrl bus
	input wire [15:0] gpio_ctrl,
	
	//Special synchronization trigger
	input wire trigger_in,
	
	input wire select_in, //If 1, then PS is writing to this channel
	
	output wire mux_sel,
	
	output reg loopback_valid//If 1, fifo is reading back in data
);

//Data going to RFSoC IP is always valid
assign m_axis_tvalid = 1'b1;

//mask register
wire [255:0] mask_out;
shift_register #(256) mask_reg
(
    clk & select_in,
    gpio_ctrl[mask_clk],
    rst,
    gpio_ctrl[sdata],
    mask_out
);

//run cycle count register
wire [config_reg_width-1:0] cycle_count_out;
shift_register #(config_reg_width) cycle_count_reg
(
    clk & select_in,
    gpio_ctrl[cycle_count_clk],
    rst,
    gpio_ctrl[sdata],
    cycle_count_out
);

//mux select register
//0 is load, 1 is loop-back
wire [7:0] mux_sel_int;
shift_register #(8) mux_sel_reg
(
	clk & select_in,
	gpio_ctrl[mux_set_clk],
	rst,
	gpio_ctrl[sdata],
	mux_sel_int
);

//Mask enable register
wire [7:0] mask_enable;
shift_register #(8) mask_enable_reg
(
	clk & select_in,
	gpio_ctrl[mask_enable_clk],
	rst,
	gpio_ctrl[sdata],
	mask_enable
);

//pre_delay cycles register
wire [config_reg_width-1:0] pre_delay_cycles;
reg [config_reg_width:0] pre_delay_cycle_counter;
shift_register #(config_reg_width) pre_delay_cycles_reg
(
	clk & select_in,
	gpio_ctrl[pre_delay_cycle_clk],
	rst,
	gpio_ctrl[sdata],
	pre_delay_cycles
);

//pre_delay cycles register
wire [config_reg_width-1:0] post_delay_cycles;
reg [config_reg_width:0] post_delay_cycle_counter;
shift_register #(config_reg_width) post_delay_cycles_reg
(
	clk & select_in,
	gpio_ctrl[post_delay_cycle_clk],
	rst,
	gpio_ctrl[sdata],
	post_delay_cycles
);

//Locking waveform register
wire [255:0] locking_waveform;
shift_register #(256) locking_waveform_reg
(
	clk & select_in,
	gpio_ctrl[locking_waveform_clk],
	rst,
	gpio_ctrl[sdata],
	locking_waveform
);


assign mux_sel = mux_sel_int[0];

//Main counter
reg [255:0] cycle_count;
//state reg
reg [3:0] state;
//Used to control when mask is used
reg mask_on, mask_inv;
reg locking_cycle;//Used to control when locking waveform is being output

localparam [3:0] state_idle = 0, 
				 state_pre_run = 1,
			     state_run = 2, 
				 state_cleanup = 3;

//Mask mux for output
reg output_on;
//assign m_axis_tdata = output_on ? (mask_on ? (s_axis_tdata & mask_out) : mask_inv ? (s_axis_tdata & (~mask_out)) : s_axis_tdata) : (state == state_idle ? locking_waveform : 0);

//Assignment for output to m_axis_tdata
always @ * begin

	if(output_on) begin
		//If the mask is on
		if(mask_on && mask_enable[0]) begin
			m_axis_tdata <= s_axis_tdata & mask_out;
		end
		else if(mask_inv && mask_enable[0]) begin
			m_axis_tdata <= s_axis_tdata & (~mask_out);
		end
		else begin
			m_axis_tdata <= s_axis_tdata;
		end
	end
	else begin
		//If we're in the idle state
		if(locking_cycle) begin
			//output the locking waveform
			m_axis_tdata <= locking_waveform;
		end
		else begin
			//Otherwise just output 0
			m_axis_tdata <= 0;
		end
	end
end

task reset_task();
begin

	state <= state_idle;
	cycle_count <= 0;
	s_axis_tready <= 0;
	mask_on <= 0;
	mask_inv <= 0;
	loopback_valid <= 0;
	output_on <= 0;
	pre_delay_cycle_counter <= 0;
	post_delay_cycle_counter <= 0;
	locking_cycle <= 0;
end
endtask

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
		reset_task();
	end
	else begin
		case(state)
		
			state_idle: begin
			
				locking_cycle <= 1;
				
				if(trigger_in) begin
					cycle_count <= cycle_count_out;
					
					//turn the mask on
					mask_on <= 1;
					
					//Set the pre_delay
					pre_delay_cycle_counter <= pre_delay_cycles;
					
					if(pre_delay_cycles == 0) begin
						s_axis_tready <= 1'b1;//Start reading out data
					end

					state <= state_pre_run;
				end
			end
			
			state_pre_run: begin
				
				locking_cycle <= 0;
				
				if(pre_delay_cycle_counter == 0) begin
					output_on <= 1;//Turn on the output to the RFSoC
					loopback_valid <= 1;//Start writing back into waveform fifo
					state <= state_run;
				end
				else begin
					//If we're about to start the experiment cycle
					if(pre_delay_cycle_counter == 1) begin
						s_axis_tready <= 1'b1;//Start reading out data
					end
					pre_delay_cycle_counter <= pre_delay_cycle_counter - 1;
				end
			end
			
			state_run: begin
				
				//turn the mask off
				mask_on <= 0;

				if(cycle_count) begin
					cycle_count <= cycle_count - 1;
					if(cycle_count == 2) begin
						mask_inv <= 1;//Invert mask for second to last cycle
						s_axis_tready <= 1'b0;//Stop reading out the waveform
					end
					else if(cycle_count == 1) begin//If we're on the last cycle
						loopback_valid <= 0;//Stop writing back into fifo
						output_on <= 0;//Stop outputting things to RFSoC
						
						//Set the post delay cycles
						if(post_delay_cycles == 0) begin
							locking_cycle <= 1;
							post_delay_cycle_counter <= 0;
						end
						else begin
							post_delay_cycle_counter <= post_delay_cycles - 1;
						end
						
						state <= state_cleanup;
						mask_inv <= 0;
						
					end
				end
				else begin
					
					state <= state_cleanup;
					mask_inv <= 0;
				end
			end
			
			state_cleanup: begin
				//Count down post delay cycles
				if(post_delay_cycle_counter) begin
					post_delay_cycle_counter <= post_delay_cycle_counter - 1;
				end
				else begin
					locking_cycle <= 1;
					state <= state_idle;
				end
				
			end
		
		endcase

	end

end




endmodule