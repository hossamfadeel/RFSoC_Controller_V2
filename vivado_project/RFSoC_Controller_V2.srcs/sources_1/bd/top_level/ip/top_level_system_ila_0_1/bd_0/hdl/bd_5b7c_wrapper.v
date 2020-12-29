//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_5b7c_wrapper.bd
//Design : bd_5b7c_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_5b7c_wrapper
   (SLOT_0_AXIS_tdata,
    SLOT_0_AXIS_tkeep,
    SLOT_0_AXIS_tlast,
    SLOT_0_AXIS_tready,
    SLOT_0_AXIS_tvalid,
    SLOT_1_AXIS_tdata,
    SLOT_1_AXIS_tkeep,
    SLOT_1_AXIS_tlast,
    SLOT_1_AXIS_tready,
    SLOT_1_AXIS_tvalid,
    SLOT_2_GPIO_tri_o,
    clk,
    probe0,
    resetn);
  input [31:0]SLOT_0_AXIS_tdata;
  input [3:0]SLOT_0_AXIS_tkeep;
  input SLOT_0_AXIS_tlast;
  input SLOT_0_AXIS_tready;
  input SLOT_0_AXIS_tvalid;
  input [31:0]SLOT_1_AXIS_tdata;
  input [3:0]SLOT_1_AXIS_tkeep;
  input SLOT_1_AXIS_tlast;
  input SLOT_1_AXIS_tready;
  input SLOT_1_AXIS_tvalid;
  input [7:0]SLOT_2_GPIO_tri_o;
  input clk;
  input [15:0]probe0;
  input resetn;

  wire [31:0]SLOT_0_AXIS_tdata;
  wire [3:0]SLOT_0_AXIS_tkeep;
  wire SLOT_0_AXIS_tlast;
  wire SLOT_0_AXIS_tready;
  wire SLOT_0_AXIS_tvalid;
  wire [31:0]SLOT_1_AXIS_tdata;
  wire [3:0]SLOT_1_AXIS_tkeep;
  wire SLOT_1_AXIS_tlast;
  wire SLOT_1_AXIS_tready;
  wire SLOT_1_AXIS_tvalid;
  wire [7:0]SLOT_2_GPIO_tri_o;
  wire clk;
  wire [15:0]probe0;
  wire resetn;

  bd_5b7c bd_5b7c_i
       (.SLOT_0_AXIS_tdata(SLOT_0_AXIS_tdata),
        .SLOT_0_AXIS_tkeep(SLOT_0_AXIS_tkeep),
        .SLOT_0_AXIS_tlast(SLOT_0_AXIS_tlast),
        .SLOT_0_AXIS_tready(SLOT_0_AXIS_tready),
        .SLOT_0_AXIS_tvalid(SLOT_0_AXIS_tvalid),
        .SLOT_1_AXIS_tdata(SLOT_1_AXIS_tdata),
        .SLOT_1_AXIS_tkeep(SLOT_1_AXIS_tkeep),
        .SLOT_1_AXIS_tlast(SLOT_1_AXIS_tlast),
        .SLOT_1_AXIS_tready(SLOT_1_AXIS_tready),
        .SLOT_1_AXIS_tvalid(SLOT_1_AXIS_tvalid),
        .SLOT_2_GPIO_tri_o(SLOT_2_GPIO_tri_o),
        .clk(clk),
        .probe0(probe0),
        .resetn(resetn));
endmodule
