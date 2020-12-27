



module rfsoc_pl_ctrl_verilog_wrapper
#(parameter ps_axis_width = 32)
(
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire clk, 

	input wire rst,
	
	input wire [15:0] gpio_ctrl,
	
	//AXIS input from PS
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [ps_axis_width-1:0] s_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*)input wire s_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*)output wire s_axis_tready,
	
	
	//AXIS output to PS
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*)output wire [ps_axis_width-1:0] m16_axis_tdata,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*)output wire m16_axis_tvalid,
	(* X_INTERFACE_PARAMETER = " FREQ_HZ 250000000"*)input wire m16_axis_tready,
	
	
	//AXIS outputs to RFSoC IP
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m0_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m0_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m0_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m1_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m1_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m1_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m2_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m2_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m2_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m3_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m3_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m3_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m4_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m4_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m4_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m5_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m5_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m5_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m6_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m6_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m6_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m7_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m7_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m7_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m8_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m8_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m8_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m9_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m9_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m9_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m10_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m10_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m10_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m11_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m11_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m11_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m12_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m12_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m12_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m13_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m13_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m13_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m14_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m14_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m14_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m15_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m15_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m15_axis_tready,
	
	
	
	//AXIS inputs from ADC
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s0_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s0_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s0_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s1_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s1_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s1_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s2_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s2_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s2_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s3_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s3_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s3_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s4_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s4_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s4_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s5_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s5_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s5_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s6_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s6_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s6_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s7_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s7_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s7_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s8_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s8_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s8_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s9_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s9_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s9_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s10_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s10_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s10_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s11_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s11_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s11_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s12_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s12_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s12_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s13_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s13_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s13_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s14_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s14_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s14_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire [127:0] s15_axis_tdata,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire s15_axis_tvalid,
    (* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire s15_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m17_axis_tdata,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m17_axis_tvalid,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m17_axis_tready,//not connected to anything
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire [255:0] m18_axis_tdata,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) output wire m18_axis_tvalid,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 250000000"*) input wire m18_axis_tready//not connected to anything
	
);


rfsoc_pl_ctrl rfsoc_pl_ctrl_inst
(
	clk,
	rst,
	
	gpio_ctrl,
	
	//AXIS input from PS
	s_axis_tdata,
    s_axis_tvalid,
    s_axis_tready,
	
	
	//AXIS output to PS
	m16_axis_tdata,
	m16_axis_tvalid,
	m16_axis_tready,
	
	
	//AXIS outputs to RFSoC IP
	m0_axis_tdata,
    m0_axis_tvalid,
    m0_axis_tready,
	
	m1_axis_tdata,
    m1_axis_tvalid,
    m1_axis_tready,
	
	m2_axis_tdata,
    m2_axis_tvalid,
    m2_axis_tready,
	
	m3_axis_tdata,
    m3_axis_tvalid,
    m3_axis_tready,
	
	m4_axis_tdata,
    m4_axis_tvalid,
    m4_axis_tready,
	
	m5_axis_tdata,
    m5_axis_tvalid,
    m5_axis_tready,
	
	m6_axis_tdata,
    m6_axis_tvalid,
    m6_axis_tready,
	
	m7_axis_tdata,
    m7_axis_tvalid,
    m7_axis_tready,
	
	m8_axis_tdata,
    m8_axis_tvalid,
    m8_axis_tready,
	
	m9_axis_tdata,
    m9_axis_tvalid,
    m9_axis_tready,
	
	m10_axis_tdata,
    m10_axis_tvalid,
    m10_axis_tready,
	
	m11_axis_tdata,
    m11_axis_tvalid,
    m11_axis_tready,
	
	m12_axis_tdata,
    m12_axis_tvalid,
    m12_axis_tready,
	
	m13_axis_tdata,
    m13_axis_tvalid,
    m13_axis_tready,
	
	m14_axis_tdata,
    m14_axis_tvalid,
    m14_axis_tready,
	
	m15_axis_tdata,
    m15_axis_tvalid,
    m15_axis_tready,
	
	
	
	//AXIS inputs from ADC
	s0_axis_tdata,
    s0_axis_tvalid,
    s0_axis_tready,
	
	s1_axis_tdata,
    s1_axis_tvalid,
    s1_axis_tready,
	
	s2_axis_tdata,
    s2_axis_tvalid,
    s2_axis_tready,
	
	s3_axis_tdata,
    s3_axis_tvalid,
    s3_axis_tready,
	
	s4_axis_tdata,
    s4_axis_tvalid,
    s4_axis_tready,
	
	s5_axis_tdata,
    s5_axis_tvalid,
    s5_axis_tready,
	
	s6_axis_tdata,
    s6_axis_tvalid,
    s6_axis_tready,
	
	s7_axis_tdata,
    s7_axis_tvalid,
    s7_axis_tready,
	
	s8_axis_tdata,
    s8_axis_tvalid,
    s8_axis_tready,
	
	s9_axis_tdata,
    s9_axis_tvalid,
    s9_axis_tready,
	
	s10_axis_tdata,
    s10_axis_tvalid,
    s10_axis_tready,
	
	s11_axis_tdata,
    s11_axis_tvalid,
    s11_axis_tready,
	
	s12_axis_tdata,
    s12_axis_tvalid,
    s12_axis_tready,
	
	s13_axis_tdata,
    s13_axis_tvalid,
    s13_axis_tready,
	
	s14_axis_tdata,
    s14_axis_tvalid,
    s14_axis_tready,
	
	s15_axis_tdata,
    s15_axis_tvalid,
    s15_axis_tready,
	
	m17_axis_tdata,
	m17_axis_tvalid,
	m17_axis_tready,//not connected to anything
	
	m18_axis_tdata,
	m18_axis_tvalid,
	m18_axis_tready//not connected to anything
	
);





endmodule