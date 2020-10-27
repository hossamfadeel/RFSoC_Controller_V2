// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1.1 (win64) Build 2960000 Wed Aug  5 22:57:20 MDT 2020
// Date        : Thu Oct 22 18:53:12 2020
// Host        : JAMES-LENOVO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_rfsoc_pl_ctrl_verilo_0_0_stub.v
// Design      : top_level_rfsoc_pl_ctrl_verilo_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rfsoc_pl_ctrl_verilog_wrapper,Vivado 2020.1.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, rst, gpio_ctrl, s_axis_tdata, s_axis_tvalid, 
  s_axis_tready, m16_axis_tdata, m16_axis_tvalid, m16_axis_tready, m0_axis_tdata, 
  m0_axis_tvalid, m0_axis_tready, m1_axis_tdata, m1_axis_tvalid, m1_axis_tready, 
  m2_axis_tdata, m2_axis_tvalid, m2_axis_tready, m3_axis_tdata, m3_axis_tvalid, 
  m3_axis_tready, m4_axis_tdata, m4_axis_tvalid, m4_axis_tready, m5_axis_tdata, 
  m5_axis_tvalid, m5_axis_tready, m6_axis_tdata, m6_axis_tvalid, m6_axis_tready, 
  m7_axis_tdata, m7_axis_tvalid, m7_axis_tready, m8_axis_tdata, m8_axis_tvalid, 
  m8_axis_tready, m9_axis_tdata, m9_axis_tvalid, m9_axis_tready, m10_axis_tdata, 
  m10_axis_tvalid, m10_axis_tready, m11_axis_tdata, m11_axis_tvalid, m11_axis_tready, 
  m12_axis_tdata, m12_axis_tvalid, m12_axis_tready, m13_axis_tdata, m13_axis_tvalid, 
  m13_axis_tready, m14_axis_tdata, m14_axis_tvalid, m14_axis_tready, m15_axis_tdata, 
  m15_axis_tvalid, m15_axis_tready, s0_axis_tdata, s0_axis_tvalid, s0_axis_tready, 
  s1_axis_tdata, s1_axis_tvalid, s1_axis_tready, s2_axis_tdata, s2_axis_tvalid, 
  s2_axis_tready, s3_axis_tdata, s3_axis_tvalid, s3_axis_tready, s4_axis_tdata, 
  s4_axis_tvalid, s4_axis_tready, s5_axis_tdata, s5_axis_tvalid, s5_axis_tready, 
  s6_axis_tdata, s6_axis_tvalid, s6_axis_tready, s7_axis_tdata, s7_axis_tvalid, 
  s7_axis_tready, s8_axis_tdata, s8_axis_tvalid, s8_axis_tready, s9_axis_tdata, 
  s9_axis_tvalid, s9_axis_tready, s10_axis_tdata, s10_axis_tvalid, s10_axis_tready, 
  s11_axis_tdata, s11_axis_tvalid, s11_axis_tready, s12_axis_tdata, s12_axis_tvalid, 
  s12_axis_tready, s13_axis_tdata, s13_axis_tvalid, s13_axis_tready, s14_axis_tdata, 
  s14_axis_tvalid, s14_axis_tready, s15_axis_tdata, s15_axis_tvalid, s15_axis_tready)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,gpio_ctrl[15:0],s_axis_tdata[31:0],s_axis_tvalid,s_axis_tready,m16_axis_tdata[31:0],m16_axis_tvalid,m16_axis_tready,m0_axis_tdata[255:0],m0_axis_tvalid,m0_axis_tready,m1_axis_tdata[255:0],m1_axis_tvalid,m1_axis_tready,m2_axis_tdata[255:0],m2_axis_tvalid,m2_axis_tready,m3_axis_tdata[255:0],m3_axis_tvalid,m3_axis_tready,m4_axis_tdata[255:0],m4_axis_tvalid,m4_axis_tready,m5_axis_tdata[255:0],m5_axis_tvalid,m5_axis_tready,m6_axis_tdata[255:0],m6_axis_tvalid,m6_axis_tready,m7_axis_tdata[255:0],m7_axis_tvalid,m7_axis_tready,m8_axis_tdata[255:0],m8_axis_tvalid,m8_axis_tready,m9_axis_tdata[255:0],m9_axis_tvalid,m9_axis_tready,m10_axis_tdata[255:0],m10_axis_tvalid,m10_axis_tready,m11_axis_tdata[255:0],m11_axis_tvalid,m11_axis_tready,m12_axis_tdata[255:0],m12_axis_tvalid,m12_axis_tready,m13_axis_tdata[255:0],m13_axis_tvalid,m13_axis_tready,m14_axis_tdata[255:0],m14_axis_tvalid,m14_axis_tready,m15_axis_tdata[255:0],m15_axis_tvalid,m15_axis_tready,s0_axis_tdata[127:0],s0_axis_tvalid,s0_axis_tready,s1_axis_tdata[127:0],s1_axis_tvalid,s1_axis_tready,s2_axis_tdata[127:0],s2_axis_tvalid,s2_axis_tready,s3_axis_tdata[127:0],s3_axis_tvalid,s3_axis_tready,s4_axis_tdata[127:0],s4_axis_tvalid,s4_axis_tready,s5_axis_tdata[127:0],s5_axis_tvalid,s5_axis_tready,s6_axis_tdata[127:0],s6_axis_tvalid,s6_axis_tready,s7_axis_tdata[127:0],s7_axis_tvalid,s7_axis_tready,s8_axis_tdata[127:0],s8_axis_tvalid,s8_axis_tready,s9_axis_tdata[127:0],s9_axis_tvalid,s9_axis_tready,s10_axis_tdata[127:0],s10_axis_tvalid,s10_axis_tready,s11_axis_tdata[127:0],s11_axis_tvalid,s11_axis_tready,s12_axis_tdata[127:0],s12_axis_tvalid,s12_axis_tready,s13_axis_tdata[127:0],s13_axis_tvalid,s13_axis_tready,s14_axis_tdata[127:0],s14_axis_tvalid,s14_axis_tready,s15_axis_tdata[127:0],s15_axis_tvalid,s15_axis_tready" */;
  input clk;
  input rst;
  input [15:0]gpio_ctrl;
  input [31:0]s_axis_tdata;
  input s_axis_tvalid;
  output s_axis_tready;
  output [31:0]m16_axis_tdata;
  output m16_axis_tvalid;
  input m16_axis_tready;
  output [255:0]m0_axis_tdata;
  output m0_axis_tvalid;
  input m0_axis_tready;
  output [255:0]m1_axis_tdata;
  output m1_axis_tvalid;
  input m1_axis_tready;
  output [255:0]m2_axis_tdata;
  output m2_axis_tvalid;
  input m2_axis_tready;
  output [255:0]m3_axis_tdata;
  output m3_axis_tvalid;
  input m3_axis_tready;
  output [255:0]m4_axis_tdata;
  output m4_axis_tvalid;
  input m4_axis_tready;
  output [255:0]m5_axis_tdata;
  output m5_axis_tvalid;
  input m5_axis_tready;
  output [255:0]m6_axis_tdata;
  output m6_axis_tvalid;
  input m6_axis_tready;
  output [255:0]m7_axis_tdata;
  output m7_axis_tvalid;
  input m7_axis_tready;
  output [255:0]m8_axis_tdata;
  output m8_axis_tvalid;
  input m8_axis_tready;
  output [255:0]m9_axis_tdata;
  output m9_axis_tvalid;
  input m9_axis_tready;
  output [255:0]m10_axis_tdata;
  output m10_axis_tvalid;
  input m10_axis_tready;
  output [255:0]m11_axis_tdata;
  output m11_axis_tvalid;
  input m11_axis_tready;
  output [255:0]m12_axis_tdata;
  output m12_axis_tvalid;
  input m12_axis_tready;
  output [255:0]m13_axis_tdata;
  output m13_axis_tvalid;
  input m13_axis_tready;
  output [255:0]m14_axis_tdata;
  output m14_axis_tvalid;
  input m14_axis_tready;
  output [255:0]m15_axis_tdata;
  output m15_axis_tvalid;
  input m15_axis_tready;
  input [127:0]s0_axis_tdata;
  input s0_axis_tvalid;
  output s0_axis_tready;
  input [127:0]s1_axis_tdata;
  input s1_axis_tvalid;
  output s1_axis_tready;
  input [127:0]s2_axis_tdata;
  input s2_axis_tvalid;
  output s2_axis_tready;
  input [127:0]s3_axis_tdata;
  input s3_axis_tvalid;
  output s3_axis_tready;
  input [127:0]s4_axis_tdata;
  input s4_axis_tvalid;
  output s4_axis_tready;
  input [127:0]s5_axis_tdata;
  input s5_axis_tvalid;
  output s5_axis_tready;
  input [127:0]s6_axis_tdata;
  input s6_axis_tvalid;
  output s6_axis_tready;
  input [127:0]s7_axis_tdata;
  input s7_axis_tvalid;
  output s7_axis_tready;
  input [127:0]s8_axis_tdata;
  input s8_axis_tvalid;
  output s8_axis_tready;
  input [127:0]s9_axis_tdata;
  input s9_axis_tvalid;
  output s9_axis_tready;
  input [127:0]s10_axis_tdata;
  input s10_axis_tvalid;
  output s10_axis_tready;
  input [127:0]s11_axis_tdata;
  input s11_axis_tvalid;
  output s11_axis_tready;
  input [127:0]s12_axis_tdata;
  input s12_axis_tvalid;
  output s12_axis_tready;
  input [127:0]s13_axis_tdata;
  input s13_axis_tvalid;
  output s13_axis_tready;
  input [127:0]s14_axis_tdata;
  input s14_axis_tvalid;
  output s14_axis_tready;
  input [127:0]s15_axis_tdata;
  input s15_axis_tvalid;
  output s15_axis_tready;
endmodule
