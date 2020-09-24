


//Sits between the waveform fifo and the RFSoC Data Converter
//Controlls triggering for waveform playback
//Mask buffer is used in its origional form to mask out the first cycle
//Used in its inverted form at end of playback

import rfsoc_config::*;

module channel_ctrl
(

	input wire clk,//250MHz clock from RFSoC IP
	input wire rst,

	//Output to RFSoC IP
	output wire [255:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready,
	
	//Input from waveform fifo
    input wire [255:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output reg s_axis_tready
	
	
	//Input from gpio_ctrl bus
	input wire [15:0] gpio_ctrl,
	
	//Special synchronization trigger
	input wire trigger_in,
	
	input wire select_in, //If 1, then PS is writing to this channel
	
	output wire mux_sel
	

);

//Data going to RFSoC IP is always valid
assign m_axis_tvalid = 1'b1;
assign m_axis_tdata = mask_on ? (s_axis_tdata & mask_out) : mask_inv ? (s_axis_tdata & (~mask_out)) : s_axis_tdata;


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

//cycle count register
wire [255:0] cycle_count_out;
shift_register #(256) mask_reg
(
    clk & select_in,
    gpio_ctrl[cycle_count_clk],
    rst,
    gpio_ctrl[sdata],
    cycle_count_out
);

//mux select register
shift_register #(1) mux_sel_reg
(
	clk & select_in,
	gpio_ctrl[mux_set_clk],
	rst,
	gpio_ctrl[sdata],
	mux_sel
);

//Main counter
reg [255:0] cycle_count;
//state reg
reg [3:0] state;
//Used to control when mask is used
reg mask_on, mask_inv;

localparam [3:0] state_idle = 0, state_run = 1, state_cleanup = 2;

task reset_task();
begin

	state <= state_idle;
	cycle_count <= 0;
	s_axis_tready <= 0;
	mask_on <= 0;
	mask_inv <= 0;

end
endtask

always @ (posedge clk or negedge rst) begin

	if(!rst) begin
	
		reset_task();
	
	end
	else begin
	
	
		case(state)
		
		
			state_idle: begin
			
				if(trigger_in) begin
					cycle_count <= cycle_count_out;
					waveform_data_read <= 1'b1;
					
					//turn the mask on
					mask_on <= 1;
					
					state <= state_run;
				end
			end
			
			state_run: begin
				
				//turn the mask off
				mask_on <= 0;
			
			
				if(cycle_count) begin
					cycle_count <= cycle_count - 1;
				end
				else begin
				
					//Invert mask for last cycle
					mask_inv <= 1;
				
					waveform_data_read <= 0;
					waveform_data_write <= 0
					state <= state_cleanup;
				end
			
			
			end
			
			state_cleanup: begin
			
				mask_inv <= 0;
				state <= state_idle;
			
			end
		
		endcase

	end

end




endmodule