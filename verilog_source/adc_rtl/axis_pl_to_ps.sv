

import rfsoc_config::*;


module axis_pl_to_ps
(
	input wire pl_clk, ps_clk,
	
	input wire rst,
	
	//Input from adc_ctrl
    input wire [127:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output reg s_axis_tready,
	
	//Output to PS
	output reg [ps_axis_width-1:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready
	
);


//Clock crossing fifo (32)
reg [31:0] fifo_tdata;
reg fifo_tvalid;
wire fifo_tready;
axis_async_fifo pl_to_ps_fifo
(
	rst,

	pl_clk,
	fifo_tvalid,
    fifo_tready,
    fifo_tdata,
    
	ps_clk,
    m_axis_tdata,
    m_axis_tvalid,
    m_axis_tready 
);

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
end
endtask
				 
initial begin
	reset_regs();
end

always @ (posedge pl_clk or negedge rst) begin

	if(!rst) begin
	
	
	end
	else begin
	
		case(state) 
	
			state_idle: begin
			
			
			end
			
			state_write_1: begin
			
			
			
			end
			
			state_write_2: begin
			
			
			end
			
			state_write_3: begin
			
			
			end
	
			default begin
				reset_regs();
			end
	
		endcase
	end




end



endmodule