// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Dec 18 19:35:23 2020
// Host        : JAMES-LENOVO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_system_ila_1_0_stub.v
// Design      : top_level_system_ila_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_5bec,Vivado 2020.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, probe0, SLOT_0_AXIS_tdata, 
  SLOT_0_AXIS_tlast, SLOT_0_AXIS_tvalid, SLOT_0_AXIS_tready, resetn, SLOT_0_AXIS_tkeep)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[15:0],SLOT_0_AXIS_tdata[31:0],SLOT_0_AXIS_tlast,SLOT_0_AXIS_tvalid,SLOT_0_AXIS_tready,resetn,SLOT_0_AXIS_tkeep[3:0]" */;
  input clk;
  input [15:0]probe0;
  input [31:0]SLOT_0_AXIS_tdata;
  input SLOT_0_AXIS_tlast;
  input SLOT_0_AXIS_tvalid;
  input SLOT_0_AXIS_tready;
  input resetn;
  input [3:0]SLOT_0_AXIS_tkeep;
endmodule
