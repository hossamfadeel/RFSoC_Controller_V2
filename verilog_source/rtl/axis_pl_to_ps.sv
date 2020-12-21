

import rfsoc_config::*;


module axis_pl_to_ps
(
	input wire clk,
	
	input wire rst,
	
	//Input from adc_ctrl
    input wire [127:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output reg s_axis_tready,
	
	//Output to PS
	output reg [ps_axis_width-1:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready,
	
	input wire [15:0] gpio_ctrl

);

parameter fifo_words_to_write = 128 / ps_axis_width;

//Clock crossing fifo (32)
reg [31:0] fifo_tdata;
reg fifo_tvalid;
wire fifo_tready;
axis_sync_fifo #(4, 32) pl_to_ps_fifo
(
	rst,
	clk,
	
	fifo_tvalid,
    fifo_tready,
    fifo_tdata,
    

    m_axis_tdata,
    m_axis_tvalid,
    m_axis_tready 
);

reg [127:0] word_buff;
reg [15:0] ps_word_counter;
reg [2:0] state;
localparam [2:0] state_idle = 0, 
				 state_write_1 = 1, 
				 state_write_2 = 2, 
				 state_write_3 = 3;
				 
				 
task reset_regs();
begin
	state <= state_idle;
	fifo_tdata <= 0;
	fifo_tvalid <= 0;
	word_buff <= 0;
	ps_word_counter <= 0;
	s_axis_tready <= 0;
end
endtask
				 
initial begin
	reset_regs();
end

always @ (posedge clk or negedge rst) begin

	if(!rst) begin
		reset_regs();
	end
	else begin
	
		case(state) 
	
			state_idle: begin
			
				//Default to not valid
				fifo_tvalid <= 0;
			
				//If we're flushing the buffer
				if(gpio_ctrl[adc_buffer_flush]) begin
					reset_regs();
				end
			
				
				//If there is an incomming word from pl side
				//and the crossing fifo is ready to receive it
				//And readout is enabled
				else if(s_axis_tvalid && fifo_tready && gpio_ctrl[adc_readout_enable])begin
				
					//Store it in the word buffer and write the first word into the fifo
					word_buff <= s_axis_tdata;
					fifo_tdata <= s_axis_tdata[ps_axis_width-1:0];
					fifo_tvalid <= 1;
					
					state <= state_write_1;
					ps_word_counter <= 1;
					s_axis_tready <= 1;//Start reading from input fifo
				
				end
			
			end
			
			state_write_1: begin
			
				//Stop reading from input fifo
				s_axis_tready <= 0;
			
				//Data going to fifo is always valid in this state
				fifo_tvalid <= 1;
				
				//If the fifo was actually ready to receive that data
				if(fifo_tready) begin
				
					//Put the next word out to the fifo
					fifo_tdata <= word_buff[(ps_word_counter * ps_axis_width)+:ps_axis_width];
				
					//If that was the last bit of data
					if(ps_word_counter == fifo_words_to_write - 1) begin
						ps_word_counter <= 0;
						state <= state_write_2;
					end
					else begin
						ps_word_counter <= ps_word_counter + 1;
					end
				end
			
			end
			
			//Make sure that last write went through
			state_write_2: begin
				if(fifo_tready) begin
					fifo_tvalid <= 0;
					state <= state_idle;
				end
			end
	
			default begin
				reset_regs();
			end
	
		endcase
	end

end



endmodule