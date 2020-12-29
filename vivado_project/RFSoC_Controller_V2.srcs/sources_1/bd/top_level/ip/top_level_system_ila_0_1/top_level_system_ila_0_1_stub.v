// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon Dec 28 22:30:56 2020
// Host        : JAMES-LENOVO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/repos/RFSoC_Controller_V2/vivado_project/RFSoC_Controller_V2.srcs/sources_1/bd/top_level/ip/top_level_system_ila_0_1/top_level_system_ila_0_1_stub.v
// Design      : top_level_system_ila_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_5b7c,Vivado 2020.2" *)
module top_level_system_ila_0_1(clk, probe0, SLOT_0_AXIS_tdata, 
  SLOT_0_AXIS_tkeep, SLOT_0_AXIS_tlast, SLOT_0_AXIS_tvalid, SLOT_0_AXIS_tready, 
  SLOT_1_AXIS_tdata, SLOT_1_AXIS_tkeep, SLOT_1_AXIS_tlast, SLOT_1_AXIS_tvalid, 
  SLOT_1_AXIS_tready, SLOT_2_GPIO_tri_o, resetn)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[15:0],SLOT_0_AXIS_tdata[31:0],SLOT_0_AXIS_tkeep[3:0],SLOT_0_AXIS_tlast,SLOT_0_AXIS_tvalid,SLOT_0_AXIS_tready,SLOT_1_AXIS_tdata[31:0],SLOT_1_AXIS_tkeep[3:0],SLOT_1_AXIS_tlast,SLOT_1_AXIS_tvalid,SLOT_1_AXIS_tready,SLOT_2_GPIO_tri_o[7:0],resetn" */;
  input clk;
  input [15:0]probe0;
  input [31:0]SLOT_0_AXIS_tdata;
  input [3:0]SLOT_0_AXIS_tkeep;
  input SLOT_0_AXIS_tlast;
  input SLOT_0_AXIS_tvalid;
  input SLOT_0_AXIS_tready;
  input [31:0]SLOT_1_AXIS_tdata;
  input [3:0]SLOT_1_AXIS_tkeep;
  input SLOT_1_AXIS_tlast;
  input SLOT_1_AXIS_tvalid;
  input SLOT_1_AXIS_tready;
  input [7:0]SLOT_2_GPIO_tri_o;
  input resetn;
endmodule
