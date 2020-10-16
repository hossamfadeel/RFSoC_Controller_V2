

//Routes axis output from PS to one of 16 channels using channel selector


module axis_selector
(
	input wire clk,
	input wire [15:0] channel_select,
	
	//From ps_to_pl module
	input wire [255:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output reg s_axis_tready,
	
	//Wide output to all channels
	output reg [((256*16)-1):0] m_axis_tdata,
    output reg [15:0] m_axis_tvalid,
    input wire [15:0] m_axis_tready

);

reg [15:0] channel_select_int;
always @ (posedge clk) begin
	channel_select_int <= channel_select;
end

integer i;
always @ (*) begin

	//Default assignment
	if(channel_select_int == 0) begin
		s_axis_tready <= 0;
		m_axis_tdata <= 0;
		m_axis_tvalid <= 0;
	end
	else begin
		for(i = 0; i < 16; i = i + 1) begin
			//If this is the bus of the target channel
			if(channel_select_int[i])begin
				m_axis_tdata[(i*256)+:256] <= s_axis_tdata;
				m_axis_tvalid[i] <= s_axis_tvalid;
				s_axis_tready <= m_axis_tready[i];
			end
			else begin
				m_axis_tdata[(i*256)+:256] <= 0;
				m_axis_tvalid[i] <= 0;
			end
		end
	end
end



endmodule