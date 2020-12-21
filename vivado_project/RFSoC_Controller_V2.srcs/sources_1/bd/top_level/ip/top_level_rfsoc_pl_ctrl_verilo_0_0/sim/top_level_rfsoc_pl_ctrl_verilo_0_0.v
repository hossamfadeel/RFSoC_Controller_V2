// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:rfsoc_pl_ctrl_verilog_wrapper:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module top_level_rfsoc_pl_ctrl_verilo_0_0 (
  clk,
  rst,
  gpio_ctrl,
  s_axis_tdata,
  s_axis_tvalid,
  s_axis_tready,
  m16_axis_tdata,
  m16_axis_tvalid,
  m16_axis_tready,
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
  s15_axis_tready
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF m0_axis:m10_axis:m11_axis:m12_axis:m13_axis:m14_axis:m15_axis:m16_axis:m1_axis:m2_axis:m3_axis:m4_axis:m5_axis:m6_axis:m7_axis:m8_axis:m9_axis:s0_axis:s10_axis:s11_axis:s12_axis:s13_axis:s14_axis:s15_axis:s1_axis:s2_axis:s3_axis:s4_axis:s5_axis:s6_axis:s7_axis:s8_axis:s9_axis:s_axis, ASSOCIATED_RESET rst, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
input wire [15 : 0] gpio_ctrl;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *)
input wire [31 : 0] s_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *)
input wire s_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *)
output wire s_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m16_axis TDATA" *)
output wire [31 : 0] m16_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m16_axis TVALID" *)
output wire m16_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m16_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m16_axis TREADY" *)
input wire m16_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m0_axis TDATA" *)
output wire [255 : 0] m0_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m0_axis TVALID" *)
output wire m0_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m0_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m0_axis TREADY" *)
input wire m0_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m1_axis TDATA" *)
output wire [255 : 0] m1_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m1_axis TVALID" *)
output wire m1_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m1_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m1_axis TREADY" *)
input wire m1_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m2_axis TDATA" *)
output wire [255 : 0] m2_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m2_axis TVALID" *)
output wire m2_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m2_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m2_axis TREADY" *)
input wire m2_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m3_axis TDATA" *)
output wire [255 : 0] m3_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m3_axis TVALID" *)
output wire m3_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m3_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m3_axis TREADY" *)
input wire m3_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m4_axis TDATA" *)
output wire [255 : 0] m4_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m4_axis TVALID" *)
output wire m4_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m4_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m4_axis TREADY" *)
input wire m4_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m5_axis TDATA" *)
output wire [255 : 0] m5_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m5_axis TVALID" *)
output wire m5_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m5_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m5_axis TREADY" *)
input wire m5_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m6_axis TDATA" *)
output wire [255 : 0] m6_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m6_axis TVALID" *)
output wire m6_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m6_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m6_axis TREADY" *)
input wire m6_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m7_axis TDATA" *)
output wire [255 : 0] m7_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m7_axis TVALID" *)
output wire m7_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m7_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m7_axis TREADY" *)
input wire m7_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m8_axis TDATA" *)
output wire [255 : 0] m8_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m8_axis TVALID" *)
output wire m8_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m8_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m8_axis TREADY" *)
input wire m8_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m9_axis TDATA" *)
output wire [255 : 0] m9_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m9_axis TVALID" *)
output wire m9_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m9_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m9_axis TREADY" *)
input wire m9_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m10_axis TDATA" *)
output wire [255 : 0] m10_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m10_axis TVALID" *)
output wire m10_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m10_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m10_axis TREADY" *)
input wire m10_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m11_axis TDATA" *)
output wire [255 : 0] m11_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m11_axis TVALID" *)
output wire m11_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m11_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m11_axis TREADY" *)
input wire m11_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m12_axis TDATA" *)
output wire [255 : 0] m12_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m12_axis TVALID" *)
output wire m12_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m12_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m12_axis TREADY" *)
input wire m12_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m13_axis TDATA" *)
output wire [255 : 0] m13_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m13_axis TVALID" *)
output wire m13_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m13_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m13_axis TREADY" *)
input wire m13_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m14_axis TDATA" *)
output wire [255 : 0] m14_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m14_axis TVALID" *)
output wire m14_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m14_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m14_axis TREADY" *)
input wire m14_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m15_axis TDATA" *)
output wire [255 : 0] m15_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m15_axis TVALID" *)
output wire m15_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m15_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m15_axis TREADY" *)
input wire m15_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s0_axis TDATA" *)
input wire [127 : 0] s0_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s0_axis TVALID" *)
input wire s0_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s0_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s0_axis TREADY" *)
output wire s0_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s1_axis TDATA" *)
input wire [127 : 0] s1_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s1_axis TVALID" *)
input wire s1_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s1_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s1_axis TREADY" *)
output wire s1_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2_axis TDATA" *)
input wire [127 : 0] s2_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2_axis TVALID" *)
input wire s2_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s2_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s2_axis TREADY" *)
output wire s2_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s3_axis TDATA" *)
input wire [127 : 0] s3_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s3_axis TVALID" *)
input wire s3_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s3_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s3_axis TREADY" *)
output wire s3_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s4_axis TDATA" *)
input wire [127 : 0] s4_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s4_axis TVALID" *)
input wire s4_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s4_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s4_axis TREADY" *)
output wire s4_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s5_axis TDATA" *)
input wire [127 : 0] s5_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s5_axis TVALID" *)
input wire s5_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s5_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s5_axis TREADY" *)
output wire s5_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s6_axis TDATA" *)
input wire [127 : 0] s6_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s6_axis TVALID" *)
input wire s6_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s6_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s6_axis TREADY" *)
output wire s6_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s7_axis TDATA" *)
input wire [127 : 0] s7_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s7_axis TVALID" *)
input wire s7_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s7_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s7_axis TREADY" *)
output wire s7_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s8_axis TDATA" *)
input wire [127 : 0] s8_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s8_axis TVALID" *)
input wire s8_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s8_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s8_axis TREADY" *)
output wire s8_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s9_axis TDATA" *)
input wire [127 : 0] s9_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s9_axis TVALID" *)
input wire s9_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s9_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s9_axis TREADY" *)
output wire s9_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s10_axis TDATA" *)
input wire [127 : 0] s10_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s10_axis TVALID" *)
input wire s10_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s10_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s10_axis TREADY" *)
output wire s10_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s11_axis TDATA" *)
input wire [127 : 0] s11_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s11_axis TVALID" *)
input wire s11_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s11_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s11_axis TREADY" *)
output wire s11_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s12_axis TDATA" *)
input wire [127 : 0] s12_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s12_axis TVALID" *)
input wire s12_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s12_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s12_axis TREADY" *)
output wire s12_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s13_axis TDATA" *)
input wire [127 : 0] s13_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s13_axis TVALID" *)
input wire s13_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s13_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s13_axis TREADY" *)
output wire s13_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s14_axis TDATA" *)
input wire [127 : 0] s14_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s14_axis TVALID" *)
input wire s14_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s14_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s14_axis TREADY" *)
output wire s14_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s15_axis TDATA" *)
input wire [127 : 0] s15_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s15_axis TVALID" *)
input wire s15_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s15_axis, FREQ_HZ 250000000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s15_axis TREADY" *)
output wire s15_axis_tready;

  rfsoc_pl_ctrl_verilog_wrapper #(
    .ps_axis_width(32)
  ) inst (
    .clk(clk),
    .rst(rst),
    .gpio_ctrl(gpio_ctrl),
    .s_axis_tdata(s_axis_tdata),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tready(s_axis_tready),
    .m16_axis_tdata(m16_axis_tdata),
    .m16_axis_tvalid(m16_axis_tvalid),
    .m16_axis_tready(m16_axis_tready),
    .m0_axis_tdata(m0_axis_tdata),
    .m0_axis_tvalid(m0_axis_tvalid),
    .m0_axis_tready(m0_axis_tready),
    .m1_axis_tdata(m1_axis_tdata),
    .m1_axis_tvalid(m1_axis_tvalid),
    .m1_axis_tready(m1_axis_tready),
    .m2_axis_tdata(m2_axis_tdata),
    .m2_axis_tvalid(m2_axis_tvalid),
    .m2_axis_tready(m2_axis_tready),
    .m3_axis_tdata(m3_axis_tdata),
    .m3_axis_tvalid(m3_axis_tvalid),
    .m3_axis_tready(m3_axis_tready),
    .m4_axis_tdata(m4_axis_tdata),
    .m4_axis_tvalid(m4_axis_tvalid),
    .m4_axis_tready(m4_axis_tready),
    .m5_axis_tdata(m5_axis_tdata),
    .m5_axis_tvalid(m5_axis_tvalid),
    .m5_axis_tready(m5_axis_tready),
    .m6_axis_tdata(m6_axis_tdata),
    .m6_axis_tvalid(m6_axis_tvalid),
    .m6_axis_tready(m6_axis_tready),
    .m7_axis_tdata(m7_axis_tdata),
    .m7_axis_tvalid(m7_axis_tvalid),
    .m7_axis_tready(m7_axis_tready),
    .m8_axis_tdata(m8_axis_tdata),
    .m8_axis_tvalid(m8_axis_tvalid),
    .m8_axis_tready(m8_axis_tready),
    .m9_axis_tdata(m9_axis_tdata),
    .m9_axis_tvalid(m9_axis_tvalid),
    .m9_axis_tready(m9_axis_tready),
    .m10_axis_tdata(m10_axis_tdata),
    .m10_axis_tvalid(m10_axis_tvalid),
    .m10_axis_tready(m10_axis_tready),
    .m11_axis_tdata(m11_axis_tdata),
    .m11_axis_tvalid(m11_axis_tvalid),
    .m11_axis_tready(m11_axis_tready),
    .m12_axis_tdata(m12_axis_tdata),
    .m12_axis_tvalid(m12_axis_tvalid),
    .m12_axis_tready(m12_axis_tready),
    .m13_axis_tdata(m13_axis_tdata),
    .m13_axis_tvalid(m13_axis_tvalid),
    .m13_axis_tready(m13_axis_tready),
    .m14_axis_tdata(m14_axis_tdata),
    .m14_axis_tvalid(m14_axis_tvalid),
    .m14_axis_tready(m14_axis_tready),
    .m15_axis_tdata(m15_axis_tdata),
    .m15_axis_tvalid(m15_axis_tvalid),
    .m15_axis_tready(m15_axis_tready),
    .s0_axis_tdata(s0_axis_tdata),
    .s0_axis_tvalid(s0_axis_tvalid),
    .s0_axis_tready(s0_axis_tready),
    .s1_axis_tdata(s1_axis_tdata),
    .s1_axis_tvalid(s1_axis_tvalid),
    .s1_axis_tready(s1_axis_tready),
    .s2_axis_tdata(s2_axis_tdata),
    .s2_axis_tvalid(s2_axis_tvalid),
    .s2_axis_tready(s2_axis_tready),
    .s3_axis_tdata(s3_axis_tdata),
    .s3_axis_tvalid(s3_axis_tvalid),
    .s3_axis_tready(s3_axis_tready),
    .s4_axis_tdata(s4_axis_tdata),
    .s4_axis_tvalid(s4_axis_tvalid),
    .s4_axis_tready(s4_axis_tready),
    .s5_axis_tdata(s5_axis_tdata),
    .s5_axis_tvalid(s5_axis_tvalid),
    .s5_axis_tready(s5_axis_tready),
    .s6_axis_tdata(s6_axis_tdata),
    .s6_axis_tvalid(s6_axis_tvalid),
    .s6_axis_tready(s6_axis_tready),
    .s7_axis_tdata(s7_axis_tdata),
    .s7_axis_tvalid(s7_axis_tvalid),
    .s7_axis_tready(s7_axis_tready),
    .s8_axis_tdata(s8_axis_tdata),
    .s8_axis_tvalid(s8_axis_tvalid),
    .s8_axis_tready(s8_axis_tready),
    .s9_axis_tdata(s9_axis_tdata),
    .s9_axis_tvalid(s9_axis_tvalid),
    .s9_axis_tready(s9_axis_tready),
    .s10_axis_tdata(s10_axis_tdata),
    .s10_axis_tvalid(s10_axis_tvalid),
    .s10_axis_tready(s10_axis_tready),
    .s11_axis_tdata(s11_axis_tdata),
    .s11_axis_tvalid(s11_axis_tvalid),
    .s11_axis_tready(s11_axis_tready),
    .s12_axis_tdata(s12_axis_tdata),
    .s12_axis_tvalid(s12_axis_tvalid),
    .s12_axis_tready(s12_axis_tready),
    .s13_axis_tdata(s13_axis_tdata),
    .s13_axis_tvalid(s13_axis_tvalid),
    .s13_axis_tready(s13_axis_tready),
    .s14_axis_tdata(s14_axis_tdata),
    .s14_axis_tvalid(s14_axis_tvalid),
    .s14_axis_tready(s14_axis_tready),
    .s15_axis_tdata(s15_axis_tdata),
    .s15_axis_tvalid(s15_axis_tvalid),
    .s15_axis_tready(s15_axis_tready)
  );
endmodule
