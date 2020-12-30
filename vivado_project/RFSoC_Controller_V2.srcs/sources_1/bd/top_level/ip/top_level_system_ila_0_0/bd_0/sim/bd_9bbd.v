//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_9bbd.bd
//Design : bd_9bbd
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_9bbd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_9bbd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "top_level_system_ila_0_0.hwdef" *) 
module bd_9bbd
   (SLOT_0_AXIS_tdata,
    SLOT_0_AXIS_tlast,
    SLOT_0_AXIS_tready,
    SLOT_0_AXIS_tvalid,
    SLOT_10_AXIS_tdata,
    SLOT_10_AXIS_tlast,
    SLOT_10_AXIS_tready,
    SLOT_10_AXIS_tvalid,
    SLOT_11_AXIS_tdata,
    SLOT_11_AXIS_tlast,
    SLOT_11_AXIS_tready,
    SLOT_11_AXIS_tvalid,
    SLOT_12_AXIS_tdata,
    SLOT_12_AXIS_tlast,
    SLOT_12_AXIS_tready,
    SLOT_12_AXIS_tvalid,
    SLOT_1_AXIS_tdata,
    SLOT_1_AXIS_tlast,
    SLOT_1_AXIS_tready,
    SLOT_1_AXIS_tvalid,
    SLOT_2_AXIS_tdata,
    SLOT_2_AXIS_tlast,
    SLOT_2_AXIS_tready,
    SLOT_2_AXIS_tvalid,
    SLOT_3_AXIS_tdata,
    SLOT_3_AXIS_tlast,
    SLOT_3_AXIS_tready,
    SLOT_3_AXIS_tvalid,
    SLOT_4_AXIS_tdata,
    SLOT_4_AXIS_tlast,
    SLOT_4_AXIS_tready,
    SLOT_4_AXIS_tvalid,
    SLOT_5_AXIS_tdata,
    SLOT_5_AXIS_tlast,
    SLOT_5_AXIS_tready,
    SLOT_5_AXIS_tvalid,
    SLOT_6_AXIS_tdata,
    SLOT_6_AXIS_tlast,
    SLOT_6_AXIS_tready,
    SLOT_6_AXIS_tvalid,
    SLOT_7_AXIS_tdata,
    SLOT_7_AXIS_tlast,
    SLOT_7_AXIS_tready,
    SLOT_7_AXIS_tvalid,
    SLOT_8_AXIS_tdata,
    SLOT_8_AXIS_tlast,
    SLOT_8_AXIS_tready,
    SLOT_8_AXIS_tvalid,
    SLOT_9_AXIS_tdata,
    SLOT_9_AXIS_tlast,
    SLOT_9_AXIS_tready,
    SLOT_9_AXIS_tvalid,
    clk,
    probe0,
    resetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_0_AXIS, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [31:0]SLOT_0_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TLAST" *) input SLOT_0_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TREADY" *) input SLOT_0_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TVALID" *) input SLOT_0_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_10_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_10_AXIS, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [255:0]SLOT_10_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_10_AXIS TLAST" *) input SLOT_10_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_10_AXIS TREADY" *) input SLOT_10_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_10_AXIS TVALID" *) input SLOT_10_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_11_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_11_AXIS, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [255:0]SLOT_11_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_11_AXIS TLAST" *) input SLOT_11_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_11_AXIS TREADY" *) input SLOT_11_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_11_AXIS TVALID" *) input SLOT_11_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_12_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_12_AXIS, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [255:0]SLOT_12_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_12_AXIS TLAST" *) input SLOT_12_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_12_AXIS TREADY" *) input SLOT_12_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_12_AXIS TVALID" *) input SLOT_12_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_1_AXIS, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [255:0]SLOT_1_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TLAST" *) input SLOT_1_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TREADY" *) input SLOT_1_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TVALID" *) input SLOT_1_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_2_AXIS, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [31:0]SLOT_2_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TLAST" *) input SLOT_2_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TREADY" *) input SLOT_2_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TVALID" *) input SLOT_2_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_3_AXIS, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [255:0]SLOT_3_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TLAST" *) input SLOT_3_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TREADY" *) input SLOT_3_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TVALID" *) input SLOT_3_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_4_AXIS, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [255:0]SLOT_4_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TLAST" *) input SLOT_4_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TREADY" *) input SLOT_4_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TVALID" *) input SLOT_4_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_5_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_5_AXIS, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [255:0]SLOT_5_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_5_AXIS TLAST" *) input SLOT_5_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_5_AXIS TREADY" *) input SLOT_5_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_5_AXIS TVALID" *) input SLOT_5_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_6_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_6_AXIS, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [255:0]SLOT_6_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_6_AXIS TLAST" *) input SLOT_6_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_6_AXIS TREADY" *) input SLOT_6_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_6_AXIS TVALID" *) input SLOT_6_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_7_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_7_AXIS, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [255:0]SLOT_7_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_7_AXIS TLAST" *) input SLOT_7_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_7_AXIS TREADY" *) input SLOT_7_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_7_AXIS TVALID" *) input SLOT_7_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_8_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_8_AXIS, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [255:0]SLOT_8_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_8_AXIS TLAST" *) input SLOT_8_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_8_AXIS TREADY" *) input SLOT_8_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_8_AXIS TVALID" *) input SLOT_8_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_9_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_9_AXIS, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [255:0]SLOT_9_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_9_AXIS TLAST" *) input SLOT_9_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_9_AXIS TREADY" *) input SLOT_9_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_9_AXIS TVALID" *) input SLOT_9_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF SLOT_0_AXIS:SLOT_10_AXIS:SLOT_11_AXIS:SLOT_12_AXIS:SLOT_1_AXIS:SLOT_2_AXIS:SLOT_3_AXIS:SLOT_4_AXIS:SLOT_5_AXIS:SLOT_6_AXIS:SLOT_7_AXIS:SLOT_8_AXIS:SLOT_9_AXIS, ASSOCIATED_RESET resetn, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk;
  input [15:0]probe0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input resetn;

  wire [255:0]Conn10_TDATA;
  wire Conn10_TLAST;
  wire Conn10_TREADY;
  wire Conn10_TVALID;
  wire [255:0]Conn11_TDATA;
  wire Conn11_TLAST;
  wire Conn11_TREADY;
  wire Conn11_TVALID;
  wire [255:0]Conn12_TDATA;
  wire Conn12_TLAST;
  wire Conn12_TREADY;
  wire Conn12_TVALID;
  wire [255:0]Conn1_TDATA;
  wire Conn1_TLAST;
  wire Conn1_TREADY;
  wire Conn1_TVALID;
  wire [31:0]Conn2_TDATA;
  wire Conn2_TLAST;
  wire Conn2_TREADY;
  wire Conn2_TVALID;
  wire [255:0]Conn3_TDATA;
  wire Conn3_TLAST;
  wire Conn3_TREADY;
  wire Conn3_TVALID;
  wire [255:0]Conn4_TDATA;
  wire Conn4_TLAST;
  wire Conn4_TREADY;
  wire Conn4_TVALID;
  wire [255:0]Conn5_TDATA;
  wire Conn5_TLAST;
  wire Conn5_TREADY;
  wire Conn5_TVALID;
  wire [255:0]Conn6_TDATA;
  wire Conn6_TLAST;
  wire Conn6_TREADY;
  wire Conn6_TVALID;
  wire [255:0]Conn7_TDATA;
  wire Conn7_TLAST;
  wire Conn7_TREADY;
  wire Conn7_TVALID;
  wire [255:0]Conn8_TDATA;
  wire Conn8_TLAST;
  wire Conn8_TREADY;
  wire Conn8_TVALID;
  wire [255:0]Conn9_TDATA;
  wire Conn9_TLAST;
  wire Conn9_TREADY;
  wire Conn9_TVALID;
  wire [31:0]Conn_TDATA;
  wire Conn_TLAST;
  wire Conn_TREADY;
  wire Conn_TVALID;
  wire clk_1;
  wire [31:0]net_slot_0_axis_tdata;
  wire net_slot_0_axis_tlast;
  wire net_slot_0_axis_tready;
  wire net_slot_0_axis_tvalid;
  wire [255:0]net_slot_10_axis_tdata;
  wire net_slot_10_axis_tlast;
  wire net_slot_10_axis_tready;
  wire net_slot_10_axis_tvalid;
  wire [255:0]net_slot_11_axis_tdata;
  wire net_slot_11_axis_tlast;
  wire net_slot_11_axis_tready;
  wire net_slot_11_axis_tvalid;
  wire [255:0]net_slot_12_axis_tdata;
  wire net_slot_12_axis_tlast;
  wire net_slot_12_axis_tready;
  wire net_slot_12_axis_tvalid;
  wire [255:0]net_slot_1_axis_tdata;
  wire net_slot_1_axis_tlast;
  wire net_slot_1_axis_tready;
  wire net_slot_1_axis_tvalid;
  wire [31:0]net_slot_2_axis_tdata;
  wire net_slot_2_axis_tlast;
  wire net_slot_2_axis_tready;
  wire net_slot_2_axis_tvalid;
  wire [255:0]net_slot_3_axis_tdata;
  wire net_slot_3_axis_tlast;
  wire net_slot_3_axis_tready;
  wire net_slot_3_axis_tvalid;
  wire [255:0]net_slot_4_axis_tdata;
  wire net_slot_4_axis_tlast;
  wire net_slot_4_axis_tready;
  wire net_slot_4_axis_tvalid;
  wire [255:0]net_slot_5_axis_tdata;
  wire net_slot_5_axis_tlast;
  wire net_slot_5_axis_tready;
  wire net_slot_5_axis_tvalid;
  wire [255:0]net_slot_6_axis_tdata;
  wire net_slot_6_axis_tlast;
  wire net_slot_6_axis_tready;
  wire net_slot_6_axis_tvalid;
  wire [255:0]net_slot_7_axis_tdata;
  wire net_slot_7_axis_tlast;
  wire net_slot_7_axis_tready;
  wire net_slot_7_axis_tvalid;
  wire [255:0]net_slot_8_axis_tdata;
  wire net_slot_8_axis_tlast;
  wire net_slot_8_axis_tready;
  wire net_slot_8_axis_tvalid;
  wire [255:0]net_slot_9_axis_tdata;
  wire net_slot_9_axis_tlast;
  wire net_slot_9_axis_tready;
  wire net_slot_9_axis_tvalid;
  wire [15:0]probe0_1;
  wire resetn_1;

  assign Conn10_TDATA = SLOT_10_AXIS_tdata[255:0];
  assign Conn10_TLAST = SLOT_10_AXIS_tlast;
  assign Conn10_TREADY = SLOT_10_AXIS_tready;
  assign Conn10_TVALID = SLOT_10_AXIS_tvalid;
  assign Conn11_TDATA = SLOT_11_AXIS_tdata[255:0];
  assign Conn11_TLAST = SLOT_11_AXIS_tlast;
  assign Conn11_TREADY = SLOT_11_AXIS_tready;
  assign Conn11_TVALID = SLOT_11_AXIS_tvalid;
  assign Conn12_TDATA = SLOT_12_AXIS_tdata[255:0];
  assign Conn12_TLAST = SLOT_12_AXIS_tlast;
  assign Conn12_TREADY = SLOT_12_AXIS_tready;
  assign Conn12_TVALID = SLOT_12_AXIS_tvalid;
  assign Conn1_TDATA = SLOT_1_AXIS_tdata[255:0];
  assign Conn1_TLAST = SLOT_1_AXIS_tlast;
  assign Conn1_TREADY = SLOT_1_AXIS_tready;
  assign Conn1_TVALID = SLOT_1_AXIS_tvalid;
  assign Conn2_TDATA = SLOT_2_AXIS_tdata[31:0];
  assign Conn2_TLAST = SLOT_2_AXIS_tlast;
  assign Conn2_TREADY = SLOT_2_AXIS_tready;
  assign Conn2_TVALID = SLOT_2_AXIS_tvalid;
  assign Conn3_TDATA = SLOT_3_AXIS_tdata[255:0];
  assign Conn3_TLAST = SLOT_3_AXIS_tlast;
  assign Conn3_TREADY = SLOT_3_AXIS_tready;
  assign Conn3_TVALID = SLOT_3_AXIS_tvalid;
  assign Conn4_TDATA = SLOT_4_AXIS_tdata[255:0];
  assign Conn4_TLAST = SLOT_4_AXIS_tlast;
  assign Conn4_TREADY = SLOT_4_AXIS_tready;
  assign Conn4_TVALID = SLOT_4_AXIS_tvalid;
  assign Conn5_TDATA = SLOT_5_AXIS_tdata[255:0];
  assign Conn5_TLAST = SLOT_5_AXIS_tlast;
  assign Conn5_TREADY = SLOT_5_AXIS_tready;
  assign Conn5_TVALID = SLOT_5_AXIS_tvalid;
  assign Conn6_TDATA = SLOT_6_AXIS_tdata[255:0];
  assign Conn6_TLAST = SLOT_6_AXIS_tlast;
  assign Conn6_TREADY = SLOT_6_AXIS_tready;
  assign Conn6_TVALID = SLOT_6_AXIS_tvalid;
  assign Conn7_TDATA = SLOT_7_AXIS_tdata[255:0];
  assign Conn7_TLAST = SLOT_7_AXIS_tlast;
  assign Conn7_TREADY = SLOT_7_AXIS_tready;
  assign Conn7_TVALID = SLOT_7_AXIS_tvalid;
  assign Conn8_TDATA = SLOT_8_AXIS_tdata[255:0];
  assign Conn8_TLAST = SLOT_8_AXIS_tlast;
  assign Conn8_TREADY = SLOT_8_AXIS_tready;
  assign Conn8_TVALID = SLOT_8_AXIS_tvalid;
  assign Conn9_TDATA = SLOT_9_AXIS_tdata[255:0];
  assign Conn9_TLAST = SLOT_9_AXIS_tlast;
  assign Conn9_TREADY = SLOT_9_AXIS_tready;
  assign Conn9_TVALID = SLOT_9_AXIS_tvalid;
  assign Conn_TDATA = SLOT_0_AXIS_tdata[31:0];
  assign Conn_TLAST = SLOT_0_AXIS_tlast;
  assign Conn_TREADY = SLOT_0_AXIS_tready;
  assign Conn_TVALID = SLOT_0_AXIS_tvalid;
  assign clk_1 = clk;
  assign probe0_1 = probe0[15:0];
  assign resetn_1 = resetn;
  bd_9bbd_g_inst_0 g_inst
       (.aclk(clk_1),
        .aresetn(resetn_1),
        .m_slot_0_axis_tdata(net_slot_0_axis_tdata),
        .m_slot_0_axis_tlast(net_slot_0_axis_tlast),
        .m_slot_0_axis_tready(net_slot_0_axis_tready),
        .m_slot_0_axis_tvalid(net_slot_0_axis_tvalid),
        .m_slot_10_axis_tdata(net_slot_10_axis_tdata),
        .m_slot_10_axis_tlast(net_slot_10_axis_tlast),
        .m_slot_10_axis_tready(net_slot_10_axis_tready),
        .m_slot_10_axis_tvalid(net_slot_10_axis_tvalid),
        .m_slot_11_axis_tdata(net_slot_11_axis_tdata),
        .m_slot_11_axis_tlast(net_slot_11_axis_tlast),
        .m_slot_11_axis_tready(net_slot_11_axis_tready),
        .m_slot_11_axis_tvalid(net_slot_11_axis_tvalid),
        .m_slot_12_axis_tdata(net_slot_12_axis_tdata),
        .m_slot_12_axis_tlast(net_slot_12_axis_tlast),
        .m_slot_12_axis_tready(net_slot_12_axis_tready),
        .m_slot_12_axis_tvalid(net_slot_12_axis_tvalid),
        .m_slot_1_axis_tdata(net_slot_1_axis_tdata),
        .m_slot_1_axis_tlast(net_slot_1_axis_tlast),
        .m_slot_1_axis_tready(net_slot_1_axis_tready),
        .m_slot_1_axis_tvalid(net_slot_1_axis_tvalid),
        .m_slot_2_axis_tdata(net_slot_2_axis_tdata),
        .m_slot_2_axis_tlast(net_slot_2_axis_tlast),
        .m_slot_2_axis_tready(net_slot_2_axis_tready),
        .m_slot_2_axis_tvalid(net_slot_2_axis_tvalid),
        .m_slot_3_axis_tdata(net_slot_3_axis_tdata),
        .m_slot_3_axis_tlast(net_slot_3_axis_tlast),
        .m_slot_3_axis_tready(net_slot_3_axis_tready),
        .m_slot_3_axis_tvalid(net_slot_3_axis_tvalid),
        .m_slot_4_axis_tdata(net_slot_4_axis_tdata),
        .m_slot_4_axis_tlast(net_slot_4_axis_tlast),
        .m_slot_4_axis_tready(net_slot_4_axis_tready),
        .m_slot_4_axis_tvalid(net_slot_4_axis_tvalid),
        .m_slot_5_axis_tdata(net_slot_5_axis_tdata),
        .m_slot_5_axis_tlast(net_slot_5_axis_tlast),
        .m_slot_5_axis_tready(net_slot_5_axis_tready),
        .m_slot_5_axis_tvalid(net_slot_5_axis_tvalid),
        .m_slot_6_axis_tdata(net_slot_6_axis_tdata),
        .m_slot_6_axis_tlast(net_slot_6_axis_tlast),
        .m_slot_6_axis_tready(net_slot_6_axis_tready),
        .m_slot_6_axis_tvalid(net_slot_6_axis_tvalid),
        .m_slot_7_axis_tdata(net_slot_7_axis_tdata),
        .m_slot_7_axis_tlast(net_slot_7_axis_tlast),
        .m_slot_7_axis_tready(net_slot_7_axis_tready),
        .m_slot_7_axis_tvalid(net_slot_7_axis_tvalid),
        .m_slot_8_axis_tdata(net_slot_8_axis_tdata),
        .m_slot_8_axis_tlast(net_slot_8_axis_tlast),
        .m_slot_8_axis_tready(net_slot_8_axis_tready),
        .m_slot_8_axis_tvalid(net_slot_8_axis_tvalid),
        .m_slot_9_axis_tdata(net_slot_9_axis_tdata),
        .m_slot_9_axis_tlast(net_slot_9_axis_tlast),
        .m_slot_9_axis_tready(net_slot_9_axis_tready),
        .m_slot_9_axis_tvalid(net_slot_9_axis_tvalid),
        .slot_0_axis_tdata(Conn_TDATA),
        .slot_0_axis_tlast(Conn_TLAST),
        .slot_0_axis_tready(Conn_TREADY),
        .slot_0_axis_tvalid(Conn_TVALID),
        .slot_10_axis_tdata(Conn10_TDATA),
        .slot_10_axis_tlast(Conn10_TLAST),
        .slot_10_axis_tready(Conn10_TREADY),
        .slot_10_axis_tvalid(Conn10_TVALID),
        .slot_11_axis_tdata(Conn11_TDATA),
        .slot_11_axis_tlast(Conn11_TLAST),
        .slot_11_axis_tready(Conn11_TREADY),
        .slot_11_axis_tvalid(Conn11_TVALID),
        .slot_12_axis_tdata(Conn12_TDATA),
        .slot_12_axis_tlast(Conn12_TLAST),
        .slot_12_axis_tready(Conn12_TREADY),
        .slot_12_axis_tvalid(Conn12_TVALID),
        .slot_1_axis_tdata(Conn1_TDATA),
        .slot_1_axis_tlast(Conn1_TLAST),
        .slot_1_axis_tready(Conn1_TREADY),
        .slot_1_axis_tvalid(Conn1_TVALID),
        .slot_2_axis_tdata(Conn2_TDATA),
        .slot_2_axis_tlast(Conn2_TLAST),
        .slot_2_axis_tready(Conn2_TREADY),
        .slot_2_axis_tvalid(Conn2_TVALID),
        .slot_3_axis_tdata(Conn3_TDATA),
        .slot_3_axis_tlast(Conn3_TLAST),
        .slot_3_axis_tready(Conn3_TREADY),
        .slot_3_axis_tvalid(Conn3_TVALID),
        .slot_4_axis_tdata(Conn4_TDATA),
        .slot_4_axis_tlast(Conn4_TLAST),
        .slot_4_axis_tready(Conn4_TREADY),
        .slot_4_axis_tvalid(Conn4_TVALID),
        .slot_5_axis_tdata(Conn5_TDATA),
        .slot_5_axis_tlast(Conn5_TLAST),
        .slot_5_axis_tready(Conn5_TREADY),
        .slot_5_axis_tvalid(Conn5_TVALID),
        .slot_6_axis_tdata(Conn6_TDATA),
        .slot_6_axis_tlast(Conn6_TLAST),
        .slot_6_axis_tready(Conn6_TREADY),
        .slot_6_axis_tvalid(Conn6_TVALID),
        .slot_7_axis_tdata(Conn7_TDATA),
        .slot_7_axis_tlast(Conn7_TLAST),
        .slot_7_axis_tready(Conn7_TREADY),
        .slot_7_axis_tvalid(Conn7_TVALID),
        .slot_8_axis_tdata(Conn8_TDATA),
        .slot_8_axis_tlast(Conn8_TLAST),
        .slot_8_axis_tready(Conn8_TREADY),
        .slot_8_axis_tvalid(Conn8_TVALID),
        .slot_9_axis_tdata(Conn9_TDATA),
        .slot_9_axis_tlast(Conn9_TLAST),
        .slot_9_axis_tready(Conn9_TREADY),
        .slot_9_axis_tvalid(Conn9_TVALID));
  bd_9bbd_ila_lib_0 ila_lib
       (.clk(clk_1),
        .probe0(probe0_1),
        .probe1(net_slot_0_axis_tdata),
        .probe10(net_slot_2_axis_tvalid),
        .probe11(net_slot_2_axis_tready),
        .probe12(net_slot_2_axis_tlast),
        .probe13(net_slot_3_axis_tdata),
        .probe14(net_slot_3_axis_tvalid),
        .probe15(net_slot_3_axis_tready),
        .probe16(net_slot_3_axis_tlast),
        .probe17(net_slot_4_axis_tdata),
        .probe18(net_slot_4_axis_tvalid),
        .probe19(net_slot_4_axis_tready),
        .probe2(net_slot_0_axis_tvalid),
        .probe20(net_slot_4_axis_tlast),
        .probe21(net_slot_5_axis_tdata),
        .probe22(net_slot_5_axis_tvalid),
        .probe23(net_slot_5_axis_tready),
        .probe24(net_slot_5_axis_tlast),
        .probe25(net_slot_6_axis_tdata),
        .probe26(net_slot_6_axis_tvalid),
        .probe27(net_slot_6_axis_tready),
        .probe28(net_slot_6_axis_tlast),
        .probe29(net_slot_7_axis_tdata),
        .probe3(net_slot_0_axis_tready),
        .probe30(net_slot_7_axis_tvalid),
        .probe31(net_slot_7_axis_tready),
        .probe32(net_slot_7_axis_tlast),
        .probe33(net_slot_8_axis_tdata),
        .probe34(net_slot_8_axis_tvalid),
        .probe35(net_slot_8_axis_tready),
        .probe36(net_slot_8_axis_tlast),
        .probe37(net_slot_9_axis_tdata),
        .probe38(net_slot_9_axis_tvalid),
        .probe39(net_slot_9_axis_tready),
        .probe4(net_slot_0_axis_tlast),
        .probe40(net_slot_9_axis_tlast),
        .probe41(net_slot_10_axis_tdata),
        .probe42(net_slot_10_axis_tvalid),
        .probe43(net_slot_10_axis_tready),
        .probe44(net_slot_10_axis_tlast),
        .probe45(net_slot_11_axis_tdata),
        .probe46(net_slot_11_axis_tvalid),
        .probe47(net_slot_11_axis_tready),
        .probe48(net_slot_11_axis_tlast),
        .probe49(net_slot_12_axis_tdata),
        .probe5(net_slot_1_axis_tdata),
        .probe50(net_slot_12_axis_tvalid),
        .probe51(net_slot_12_axis_tready),
        .probe52(net_slot_12_axis_tlast),
        .probe6(net_slot_1_axis_tvalid),
        .probe7(net_slot_1_axis_tready),
        .probe8(net_slot_1_axis_tlast),
        .probe9(net_slot_2_axis_tdata));
endmodule
