

import rfsoc_config::*;
module axis_n_mux
(
	input wire clk,
	input wire [15:0] select_in,
	
	//Inputs from 16 adc drivers
	input wire [(ps_axis_width*16)-1:0] s_axis_tdata,
	input wire [15:0] s_axis_tvalid,
	output reg [15:0] s_axis_tready,
	
	output reg [ps_axis_width-1:0] m_axis_tdata,
	output reg m_axis_tvalid,
	input wire m_axis_tready
	
);

reg [15:0] select_int;
always @ (posedge clk) begin
	select_int <= select_in;
end
integer i;
//integer found;
always @ (*) begin

	//Default assignments
	//m_axis_tvalid <= 0;
	//m_axis_tdata <= 0;
	if(select_int == 0) begin
		m_axis_tvalid <= 0;
		m_axis_tdata <= 0;
	end
	else begin
		
		//found <= 0;
		for(i = 0; i < 16; i = i + 1) begin
			if(select_int[i]) begin
				//found <= 1;
				s_axis_tready[i] <= m_axis_tready;
				m_axis_tvalid <= s_axis_tvalid[i];
				m_axis_tdata <= s_axis_tdata[(i * ps_axis_width) +: ps_axis_width];
			end
			else begin
				s_axis_tready[i] <= 0;
			end
		
		end
	end

end




endmodule