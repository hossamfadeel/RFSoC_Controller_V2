// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Dec 29 18:21:15 2020
// Host        : JAMES-LENOVO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_system_ila_0_0_stub.v
// Design      : top_level_system_ila_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_9bbd,Vivado 2020.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, probe0, SLOT_0_AXIS_tdata, 
  SLOT_0_AXIS_tlast, SLOT_0_AXIS_tvalid, SLOT_0_AXIS_tready, SLOT_1_AXIS_tdata, 
  SLOT_1_AXIS_tlast, SLOT_1_AXIS_tvalid, SLOT_1_AXIS_tready, SLOT_2_AXIS_tdata, 
  SLOT_2_AXIS_tlast, SLOT_2_AXIS_tvalid, SLOT_2_AXIS_tready, SLOT_3_AXIS_tdata, 
  SLOT_3_AXIS_tlast, SLOT_3_AXIS_tvalid, SLOT_3_AXIS_tready, SLOT_4_AXIS_tdata, 
  SLOT_4_AXIS_tlast, SLOT_4_AXIS_tvalid, SLOT_4_AXIS_tready, SLOT_5_AXIS_tdata, 
  SLOT_5_AXIS_tlast, SLOT_5_AXIS_tvalid, SLOT_5_AXIS_tready, SLOT_6_AXIS_tdata, 
  SLOT_6_AXIS_tlast, SLOT_6_AXIS_tvalid, SLOT_6_AXIS_tready, SLOT_7_AXIS_tdata, 
  SLOT_7_AXIS_tlast, SLOT_7_AXIS_tvalid, SLOT_7_AXIS_tready, SLOT_8_AXIS_tdata, 
  SLOT_8_AXIS_tlast, SLOT_8_AXIS_tvalid, SLOT_8_AXIS_tready, SLOT_9_AXIS_tdata, 
  SLOT_9_AXIS_tlast, SLOT_9_AXIS_tvalid, SLOT_9_AXIS_tready, SLOT_10_AXIS_tdata, 
  SLOT_10_AXIS_tlast, SLOT_10_AXIS_tvalid, SLOT_10_AXIS_tready, SLOT_11_AXIS_tdata, 
  SLOT_11_AXIS_tlast, SLOT_11_AXIS_tvalid, SLOT_11_AXIS_tready, SLOT_12_AXIS_tdata, 
  SLOT_12_AXIS_tlast, SLOT_12_AXIS_tvalid, SLOT_12_AXIS_tready, resetn)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[15:0],SLOT_0_AXIS_tdata[31:0],SLOT_0_AXIS_tlast,SLOT_0_AXIS_tvalid,SLOT_0_AXIS_tready,SLOT_1_AXIS_tdata[255:0],SLOT_1_AXIS_tlast,SLOT_1_AXIS_tvalid,SLOT_1_AXIS_tready,SLOT_2_AXIS_tdata[31:0],SLOT_2_AXIS_tlast,SLOT_2_AXIS_tvalid,SLOT_2_AXIS_tready,SLOT_3_AXIS_tdata[255:0],SLOT_3_AXIS_tlast,SLOT_3_AXIS_tvalid,SLOT_3_AXIS_tready,SLOT_4_AXIS_tdata[255:0],SLOT_4_AXIS_tlast,SLOT_4_AXIS_tvalid,SLOT_4_AXIS_tready,SLOT_5_AXIS_tdata[255:0],SLOT_5_AXIS_tlast,SLOT_5_AXIS_tvalid,SLOT_5_AXIS_tready,SLOT_6_AXIS_tdata[255:0],SLOT_6_AXIS_tlast,SLOT_6_AXIS_tvalid,SLOT_6_AXIS_tready,SLOT_7_AXIS_tdata[255:0],SLOT_7_AXIS_tlast,SLOT_7_AXIS_tvalid,SLOT_7_AXIS_tready,SLOT_8_AXIS_tdata[255:0],SLOT_8_AXIS_tlast,SLOT_8_AXIS_tvalid,SLOT_8_AXIS_tready,SLOT_9_AXIS_tdata[255:0],SLOT_9_AXIS_tlast,SLOT_9_AXIS_tvalid,SLOT_9_AXIS_tready,SLOT_10_AXIS_tdata[255:0],SLOT_10_AXIS_tlast,SLOT_10_AXIS_tvalid,SLOT_10_AXIS_tready,SLOT_11_AXIS_tdata[255:0],SLOT_11_AXIS_tlast,SLOT_11_AXIS_tvalid,SLOT_11_AXIS_tready,SLOT_12_AXIS_tdata[255:0],SLOT_12_AXIS_tlast,SLOT_12_AXIS_tvalid,SLOT_12_AXIS_tready,resetn" */;
  input clk;
  input [15:0]probe0;
  input [31:0]SLOT_0_AXIS_tdata;
  input SLOT_0_AXIS_tlast;
  input SLOT_0_AXIS_tvalid;
  input SLOT_0_AXIS_tready;
  input [255:0]SLOT_1_AXIS_tdata;
  input SLOT_1_AXIS_tlast;
  input SLOT_1_AXIS_tvalid;
  input SLOT_1_AXIS_tready;
  input [31:0]SLOT_2_AXIS_tdata;
  input SLOT_2_AXIS_tlast;
  input SLOT_2_AXIS_tvalid;
  input SLOT_2_AXIS_tready;
  input [255:0]SLOT_3_AXIS_tdata;
  input SLOT_3_AXIS_tlast;
  input SLOT_3_AXIS_tvalid;
  input SLOT_3_AXIS_tready;
  input [255:0]SLOT_4_AXIS_tdata;
  input SLOT_4_AXIS_tlast;
  input SLOT_4_AXIS_tvalid;
  input SLOT_4_AXIS_tready;
  input [255:0]SLOT_5_AXIS_tdata;
  input SLOT_5_AXIS_tlast;
  input SLOT_5_AXIS_tvalid;
  input SLOT_5_AXIS_tready;
  input [255:0]SLOT_6_AXIS_tdata;
  input SLOT_6_AXIS_tlast;
  input SLOT_6_AXIS_tvalid;
  input SLOT_6_AXIS_tready;
  input [255:0]SLOT_7_AXIS_tdata;
  input SLOT_7_AXIS_tlast;
  input SLOT_7_AXIS_tvalid;
  input SLOT_7_AXIS_tready;
  input [255:0]SLOT_8_AXIS_tdata;
  input SLOT_8_AXIS_tlast;
  input SLOT_8_AXIS_tvalid;
  input SLOT_8_AXIS_tready;
  input [255:0]SLOT_9_AXIS_tdata;
  input SLOT_9_AXIS_tlast;
  input SLOT_9_AXIS_tvalid;
  input SLOT_9_AXIS_tready;
  input [255:0]SLOT_10_AXIS_tdata;
  input SLOT_10_AXIS_tlast;
  input SLOT_10_AXIS_tvalid;
  input SLOT_10_AXIS_tready;
  input [255:0]SLOT_11_AXIS_tdata;
  input SLOT_11_AXIS_tlast;
  input SLOT_11_AXIS_tvalid;
  input SLOT_11_AXIS_tready;
  input [255:0]SLOT_12_AXIS_tdata;
  input SLOT_12_AXIS_tlast;
  input SLOT_12_AXIS_tvalid;
  input SLOT_12_AXIS_tready;
  input resetn;
endmodule
