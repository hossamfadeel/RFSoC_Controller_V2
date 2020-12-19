

module axis_tlast_slice
(
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) input wire [31:0] s_axis_tdata,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) input wire s_axis_tvalid,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) output s_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) output wire [31:0] m_axis_tdata,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) output wire [3:0] m_axis_tkeep,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) output wire m_axis_tlast,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) input wire m_axis_tready,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) output wire m_axis_tvalid
	
);

assign s_axis_tready = m_axis_tready;
assign m_axis_tdata = s_axis_tdata;
assign m_axis_tvalid = s_axis_tvalid;
assign m_axis_tkeep = 4'b1111;
assign m_axis_tlast = 1'b1;


endmodule