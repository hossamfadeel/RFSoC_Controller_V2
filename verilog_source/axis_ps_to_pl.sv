


module axis_ps_to_pl
#(parameter ps_axis_width = 32)
(
	input wire ps_clk,
	input wire pl_clk,
	
	input wire rst,
	
	//AXIS input from PS
	input wire [ps_axis_width-1:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output reg s_axis_tready
	
	
	//AXIS output to PL
	output wire [255:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready,
);







endmodule