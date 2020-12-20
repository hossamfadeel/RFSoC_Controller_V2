// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Dec 19 15:01:27 2020
// Host        : JAMES-LENOVO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/repos/RFSoC_Controller_V2/vivado_project/RFSoC_Controller_V2.srcs/sources_1/bd/top_level/ip/top_level_axis_tlast_slice_0_0/top_level_axis_tlast_slice_0_0_stub.v
// Design      : top_level_axis_tlast_slice_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_tlast_slice,Vivado 2020.2" *)
module top_level_axis_tlast_slice_0_0(ps_clk, rst, s_axis_tdata, s_axis_tvalid, 
  s_axis_tready, m_axis_tdata, m_axis_tkeep, m_axis_tlast, m_axis_tready, m_axis_tvalid)
/* synthesis syn_black_box black_box_pad_pin="ps_clk,rst,s_axis_tdata[31:0],s_axis_tvalid,s_axis_tready,m_axis_tdata[31:0],m_axis_tkeep[3:0],m_axis_tlast,m_axis_tready,m_axis_tvalid" */;
  input ps_clk;
  input rst;
  input [31:0]s_axis_tdata;
  input s_axis_tvalid;
  output s_axis_tready;
  output [31:0]m_axis_tdata;
  output [3:0]m_axis_tkeep;
  output m_axis_tlast;
  input m_axis_tready;
  output m_axis_tvalid;
endmodule
