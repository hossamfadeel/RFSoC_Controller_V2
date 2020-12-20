//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Sat Dec 19 14:57:34 2020
//Host        : JAMES-LENOVO running 64-bit major release  (build 9200)
//Command     : generate_target top_level.bd
//Design      : top_level
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module m00_couplers_imp_K308NP
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [0:0]S_AXI_wvalid;

  wire [39:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [0:0]m00_couplers_to_m00_couplers_ARREADY;
  wire [0:0]m00_couplers_to_m00_couplers_ARVALID;
  wire [39:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [0:0]m00_couplers_to_m00_couplers_AWREADY;
  wire [0:0]m00_couplers_to_m00_couplers_AWVALID;
  wire [0:0]m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire [0:0]m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire [0:0]m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire [0:0]m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire [0:0]m00_couplers_to_m00_couplers_WREADY;
  wire [0:0]m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[39:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready[0] = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready[0] = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wvalid[0] = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready[0] = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready[0] = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid[0] = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid[0] = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready[0] = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[39:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready[0];
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid[0];
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready[0];
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid[0];
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready[0];
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid[0];
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready[0];
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid[0];
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready[0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m01_couplers_imp_189BYX9
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [39:0]m01_couplers_to_m01_couplers_ARADDR;
  wire [0:0]m01_couplers_to_m01_couplers_ARREADY;
  wire [0:0]m01_couplers_to_m01_couplers_ARVALID;
  wire [39:0]m01_couplers_to_m01_couplers_AWADDR;
  wire [0:0]m01_couplers_to_m01_couplers_AWREADY;
  wire [0:0]m01_couplers_to_m01_couplers_AWVALID;
  wire [0:0]m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire [0:0]m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire [0:0]m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire [0:0]m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire [0:0]m01_couplers_to_m01_couplers_WREADY;
  wire [3:0]m01_couplers_to_m01_couplers_WSTRB;
  wire [0:0]m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[39:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready[0] = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready[0] = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m01_couplers_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready[0] = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready[0] = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid[0] = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid[0] = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready[0] = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[39:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready[0];
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid[0];
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready[0];
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid[0];
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready[0];
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid[0];
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready[0];
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid[0];
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready[0];
  assign m01_couplers_to_m01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m02_couplers_imp_GVO0MC
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [39:0]m02_couplers_to_m02_couplers_ARADDR;
  wire m02_couplers_to_m02_couplers_ARREADY;
  wire m02_couplers_to_m02_couplers_ARVALID;
  wire [39:0]m02_couplers_to_m02_couplers_AWADDR;
  wire m02_couplers_to_m02_couplers_AWREADY;
  wire m02_couplers_to_m02_couplers_AWVALID;
  wire m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire m02_couplers_to_m02_couplers_WREADY;
  wire [3:0]m02_couplers_to_m02_couplers_WSTRB;
  wire m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[39:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arvalid = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awvalid = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m02_couplers_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[39:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready;
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid;
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready;
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid;
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready;
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid;
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready;
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid;
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready;
  assign m02_couplers_to_m02_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid;
endmodule

module s00_couplers_imp_1LSKJNT
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [15:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [15:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [15:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [127:0]S_AXI_rdata;
  output [15:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [127:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [15:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [39:0]auto_ds_to_auto_pc_ARADDR;
  wire [1:0]auto_ds_to_auto_pc_ARBURST;
  wire [3:0]auto_ds_to_auto_pc_ARCACHE;
  wire [7:0]auto_ds_to_auto_pc_ARLEN;
  wire [0:0]auto_ds_to_auto_pc_ARLOCK;
  wire [2:0]auto_ds_to_auto_pc_ARPROT;
  wire [3:0]auto_ds_to_auto_pc_ARQOS;
  wire auto_ds_to_auto_pc_ARREADY;
  wire [3:0]auto_ds_to_auto_pc_ARREGION;
  wire [2:0]auto_ds_to_auto_pc_ARSIZE;
  wire auto_ds_to_auto_pc_ARVALID;
  wire [39:0]auto_ds_to_auto_pc_AWADDR;
  wire [1:0]auto_ds_to_auto_pc_AWBURST;
  wire [3:0]auto_ds_to_auto_pc_AWCACHE;
  wire [7:0]auto_ds_to_auto_pc_AWLEN;
  wire [0:0]auto_ds_to_auto_pc_AWLOCK;
  wire [2:0]auto_ds_to_auto_pc_AWPROT;
  wire [3:0]auto_ds_to_auto_pc_AWQOS;
  wire auto_ds_to_auto_pc_AWREADY;
  wire [3:0]auto_ds_to_auto_pc_AWREGION;
  wire [2:0]auto_ds_to_auto_pc_AWSIZE;
  wire auto_ds_to_auto_pc_AWVALID;
  wire auto_ds_to_auto_pc_BREADY;
  wire [1:0]auto_ds_to_auto_pc_BRESP;
  wire auto_ds_to_auto_pc_BVALID;
  wire [31:0]auto_ds_to_auto_pc_RDATA;
  wire auto_ds_to_auto_pc_RLAST;
  wire auto_ds_to_auto_pc_RREADY;
  wire [1:0]auto_ds_to_auto_pc_RRESP;
  wire auto_ds_to_auto_pc_RVALID;
  wire [31:0]auto_ds_to_auto_pc_WDATA;
  wire auto_ds_to_auto_pc_WLAST;
  wire auto_ds_to_auto_pc_WREADY;
  wire [3:0]auto_ds_to_auto_pc_WSTRB;
  wire auto_ds_to_auto_pc_WVALID;
  wire [39:0]auto_pc_to_s00_couplers_ARADDR;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [39:0]auto_pc_to_s00_couplers_AWADDR;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [39:0]s00_couplers_to_auto_ds_ARADDR;
  wire [1:0]s00_couplers_to_auto_ds_ARBURST;
  wire [3:0]s00_couplers_to_auto_ds_ARCACHE;
  wire [15:0]s00_couplers_to_auto_ds_ARID;
  wire [7:0]s00_couplers_to_auto_ds_ARLEN;
  wire s00_couplers_to_auto_ds_ARLOCK;
  wire [2:0]s00_couplers_to_auto_ds_ARPROT;
  wire [3:0]s00_couplers_to_auto_ds_ARQOS;
  wire s00_couplers_to_auto_ds_ARREADY;
  wire [2:0]s00_couplers_to_auto_ds_ARSIZE;
  wire s00_couplers_to_auto_ds_ARVALID;
  wire [39:0]s00_couplers_to_auto_ds_AWADDR;
  wire [1:0]s00_couplers_to_auto_ds_AWBURST;
  wire [3:0]s00_couplers_to_auto_ds_AWCACHE;
  wire [15:0]s00_couplers_to_auto_ds_AWID;
  wire [7:0]s00_couplers_to_auto_ds_AWLEN;
  wire s00_couplers_to_auto_ds_AWLOCK;
  wire [2:0]s00_couplers_to_auto_ds_AWPROT;
  wire [3:0]s00_couplers_to_auto_ds_AWQOS;
  wire s00_couplers_to_auto_ds_AWREADY;
  wire [2:0]s00_couplers_to_auto_ds_AWSIZE;
  wire s00_couplers_to_auto_ds_AWVALID;
  wire [15:0]s00_couplers_to_auto_ds_BID;
  wire s00_couplers_to_auto_ds_BREADY;
  wire [1:0]s00_couplers_to_auto_ds_BRESP;
  wire s00_couplers_to_auto_ds_BVALID;
  wire [127:0]s00_couplers_to_auto_ds_RDATA;
  wire [15:0]s00_couplers_to_auto_ds_RID;
  wire s00_couplers_to_auto_ds_RLAST;
  wire s00_couplers_to_auto_ds_RREADY;
  wire [1:0]s00_couplers_to_auto_ds_RRESP;
  wire s00_couplers_to_auto_ds_RVALID;
  wire [127:0]s00_couplers_to_auto_ds_WDATA;
  wire s00_couplers_to_auto_ds_WLAST;
  wire s00_couplers_to_auto_ds_WREADY;
  wire [15:0]s00_couplers_to_auto_ds_WSTRB;
  wire s00_couplers_to_auto_ds_WVALID;

  assign M_AXI_araddr[39:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_ds_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_ds_AWREADY;
  assign S_AXI_bid[15:0] = s00_couplers_to_auto_ds_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_ds_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_ds_BVALID;
  assign S_AXI_rdata[127:0] = s00_couplers_to_auto_ds_RDATA;
  assign S_AXI_rid[15:0] = s00_couplers_to_auto_ds_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_ds_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_ds_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_ds_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_ds_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_ds_ARADDR = S_AXI_araddr[39:0];
  assign s00_couplers_to_auto_ds_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_ds_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_ds_ARID = S_AXI_arid[15:0];
  assign s00_couplers_to_auto_ds_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_auto_ds_ARLOCK = S_AXI_arlock;
  assign s00_couplers_to_auto_ds_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_ds_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_ds_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_ds_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_ds_AWADDR = S_AXI_awaddr[39:0];
  assign s00_couplers_to_auto_ds_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_ds_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_ds_AWID = S_AXI_awid[15:0];
  assign s00_couplers_to_auto_ds_AWLEN = S_AXI_awlen[7:0];
  assign s00_couplers_to_auto_ds_AWLOCK = S_AXI_awlock;
  assign s00_couplers_to_auto_ds_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_ds_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_ds_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_ds_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_ds_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_ds_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_ds_WDATA = S_AXI_wdata[127:0];
  assign s00_couplers_to_auto_ds_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_ds_WSTRB = S_AXI_wstrb[15:0];
  assign s00_couplers_to_auto_ds_WVALID = S_AXI_wvalid;
  top_level_auto_ds_0 auto_ds
       (.m_axi_araddr(auto_ds_to_auto_pc_ARADDR),
        .m_axi_arburst(auto_ds_to_auto_pc_ARBURST),
        .m_axi_arcache(auto_ds_to_auto_pc_ARCACHE),
        .m_axi_arlen(auto_ds_to_auto_pc_ARLEN),
        .m_axi_arlock(auto_ds_to_auto_pc_ARLOCK),
        .m_axi_arprot(auto_ds_to_auto_pc_ARPROT),
        .m_axi_arqos(auto_ds_to_auto_pc_ARQOS),
        .m_axi_arready(auto_ds_to_auto_pc_ARREADY),
        .m_axi_arregion(auto_ds_to_auto_pc_ARREGION),
        .m_axi_arsize(auto_ds_to_auto_pc_ARSIZE),
        .m_axi_arvalid(auto_ds_to_auto_pc_ARVALID),
        .m_axi_awaddr(auto_ds_to_auto_pc_AWADDR),
        .m_axi_awburst(auto_ds_to_auto_pc_AWBURST),
        .m_axi_awcache(auto_ds_to_auto_pc_AWCACHE),
        .m_axi_awlen(auto_ds_to_auto_pc_AWLEN),
        .m_axi_awlock(auto_ds_to_auto_pc_AWLOCK),
        .m_axi_awprot(auto_ds_to_auto_pc_AWPROT),
        .m_axi_awqos(auto_ds_to_auto_pc_AWQOS),
        .m_axi_awready(auto_ds_to_auto_pc_AWREADY),
        .m_axi_awregion(auto_ds_to_auto_pc_AWREGION),
        .m_axi_awsize(auto_ds_to_auto_pc_AWSIZE),
        .m_axi_awvalid(auto_ds_to_auto_pc_AWVALID),
        .m_axi_bready(auto_ds_to_auto_pc_BREADY),
        .m_axi_bresp(auto_ds_to_auto_pc_BRESP),
        .m_axi_bvalid(auto_ds_to_auto_pc_BVALID),
        .m_axi_rdata(auto_ds_to_auto_pc_RDATA),
        .m_axi_rlast(auto_ds_to_auto_pc_RLAST),
        .m_axi_rready(auto_ds_to_auto_pc_RREADY),
        .m_axi_rresp(auto_ds_to_auto_pc_RRESP),
        .m_axi_rvalid(auto_ds_to_auto_pc_RVALID),
        .m_axi_wdata(auto_ds_to_auto_pc_WDATA),
        .m_axi_wlast(auto_ds_to_auto_pc_WLAST),
        .m_axi_wready(auto_ds_to_auto_pc_WREADY),
        .m_axi_wstrb(auto_ds_to_auto_pc_WSTRB),
        .m_axi_wvalid(auto_ds_to_auto_pc_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(s00_couplers_to_auto_ds_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_ds_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_ds_ARCACHE),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arid(s00_couplers_to_auto_ds_ARID),
        .s_axi_arlen(s00_couplers_to_auto_ds_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_ds_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_ds_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_ds_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_ds_ARREADY),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(s00_couplers_to_auto_ds_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_ds_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_ds_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_ds_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_ds_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_ds_AWID),
        .s_axi_awlen(s00_couplers_to_auto_ds_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_ds_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_ds_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_ds_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_ds_AWREADY),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(s00_couplers_to_auto_ds_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_ds_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_ds_BID),
        .s_axi_bready(s00_couplers_to_auto_ds_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_ds_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_ds_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_ds_RDATA),
        .s_axi_rid(s00_couplers_to_auto_ds_RID),
        .s_axi_rlast(s00_couplers_to_auto_ds_RLAST),
        .s_axi_rready(s00_couplers_to_auto_ds_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_ds_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_ds_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_ds_WDATA),
        .s_axi_wlast(s00_couplers_to_auto_ds_WLAST),
        .s_axi_wready(s00_couplers_to_auto_ds_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_ds_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_ds_WVALID));
  top_level_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(auto_ds_to_auto_pc_ARADDR),
        .s_axi_arburst(auto_ds_to_auto_pc_ARBURST),
        .s_axi_arcache(auto_ds_to_auto_pc_ARCACHE),
        .s_axi_arlen(auto_ds_to_auto_pc_ARLEN),
        .s_axi_arlock(auto_ds_to_auto_pc_ARLOCK),
        .s_axi_arprot(auto_ds_to_auto_pc_ARPROT),
        .s_axi_arqos(auto_ds_to_auto_pc_ARQOS),
        .s_axi_arready(auto_ds_to_auto_pc_ARREADY),
        .s_axi_arregion(auto_ds_to_auto_pc_ARREGION),
        .s_axi_arsize(auto_ds_to_auto_pc_ARSIZE),
        .s_axi_arvalid(auto_ds_to_auto_pc_ARVALID),
        .s_axi_awaddr(auto_ds_to_auto_pc_AWADDR),
        .s_axi_awburst(auto_ds_to_auto_pc_AWBURST),
        .s_axi_awcache(auto_ds_to_auto_pc_AWCACHE),
        .s_axi_awlen(auto_ds_to_auto_pc_AWLEN),
        .s_axi_awlock(auto_ds_to_auto_pc_AWLOCK),
        .s_axi_awprot(auto_ds_to_auto_pc_AWPROT),
        .s_axi_awqos(auto_ds_to_auto_pc_AWQOS),
        .s_axi_awready(auto_ds_to_auto_pc_AWREADY),
        .s_axi_awregion(auto_ds_to_auto_pc_AWREGION),
        .s_axi_awsize(auto_ds_to_auto_pc_AWSIZE),
        .s_axi_awvalid(auto_ds_to_auto_pc_AWVALID),
        .s_axi_bready(auto_ds_to_auto_pc_BREADY),
        .s_axi_bresp(auto_ds_to_auto_pc_BRESP),
        .s_axi_bvalid(auto_ds_to_auto_pc_BVALID),
        .s_axi_rdata(auto_ds_to_auto_pc_RDATA),
        .s_axi_rlast(auto_ds_to_auto_pc_RLAST),
        .s_axi_rready(auto_ds_to_auto_pc_RREADY),
        .s_axi_rresp(auto_ds_to_auto_pc_RRESP),
        .s_axi_rvalid(auto_ds_to_auto_pc_RVALID),
        .s_axi_wdata(auto_ds_to_auto_pc_WDATA),
        .s_axi_wlast(auto_ds_to_auto_pc_WLAST),
        .s_axi_wready(auto_ds_to_auto_pc_WREADY),
        .s_axi_wstrb(auto_ds_to_auto_pc_WSTRB),
        .s_axi_wvalid(auto_ds_to_auto_pc_WVALID));
endmodule

(* CORE_GENERATION_INFO = "top_level,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=top_level,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=24,numReposBlks=19,numNonXlnxBlks=0,numHierBlks=5,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=8,da_board_cnt=2,da_rf_converter_usp_cnt=1,da_zynq_ultra_ps_e_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "top_level.hwdef" *) 
module top_level
   (adc0_clk_clk_n,
    adc0_clk_clk_p,
    adc1_clk_clk_n,
    adc1_clk_clk_p,
    adc2_clk_clk_n,
    adc2_clk_clk_p,
    adc3_clk_clk_n,
    adc3_clk_clk_p,
    app_leds_tri_o,
    dac0_clk_clk_n,
    dac0_clk_clk_p,
    dac1_clk_clk_n,
    dac1_clk_clk_p,
    dac2_clk_clk_n,
    dac2_clk_clk_p,
    dac3_clk_clk_n,
    dac3_clk_clk_p,
    sysref_in_diff_n,
    sysref_in_diff_p,
    vin00_v_n,
    vin00_v_p,
    vin01_v_n,
    vin01_v_p,
    vin02_v_n,
    vin02_v_p,
    vin03_v_n,
    vin03_v_p,
    vin10_v_n,
    vin10_v_p,
    vin11_v_n,
    vin11_v_p,
    vin12_v_n,
    vin12_v_p,
    vin13_v_n,
    vin13_v_p,
    vin20_v_n,
    vin20_v_p,
    vin21_v_n,
    vin21_v_p,
    vin22_v_n,
    vin22_v_p,
    vin23_v_n,
    vin23_v_p,
    vin30_v_n,
    vin30_v_p,
    vin31_v_n,
    vin31_v_p,
    vin32_v_n,
    vin32_v_p,
    vin33_v_n,
    vin33_v_p,
    vout00_v_n,
    vout00_v_p,
    vout01_v_n,
    vout01_v_p,
    vout02_v_n,
    vout02_v_p,
    vout03_v_n,
    vout03_v_p,
    vout10_v_n,
    vout10_v_p,
    vout11_v_n,
    vout11_v_p,
    vout12_v_n,
    vout12_v_p,
    vout13_v_n,
    vout13_v_p,
    vout20_v_n,
    vout20_v_p,
    vout21_v_n,
    vout21_v_p,
    vout22_v_n,
    vout22_v_p,
    vout23_v_n,
    vout23_v_p,
    vout30_v_n,
    vout30_v_p,
    vout31_v_n,
    vout31_v_p,
    vout32_v_n,
    vout32_v_p,
    vout33_v_n,
    vout33_v_p);
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 adc0_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc0_clk, CAN_DEBUG false, FREQ_HZ 250000000" *) input adc0_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 adc0_clk CLK_P" *) input adc0_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 adc1_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc1_clk, CAN_DEBUG false, FREQ_HZ 250000000" *) input adc1_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 adc1_clk CLK_P" *) input adc1_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 adc2_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc2_clk, CAN_DEBUG false, FREQ_HZ 250000000" *) input adc2_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 adc2_clk CLK_P" *) input adc2_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 adc3_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc3_clk, CAN_DEBUG false, FREQ_HZ 250000000" *) input adc3_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 adc3_clk CLK_P" *) input adc3_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 app_leds TRI_O" *) output [7:0]app_leds_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac0_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac0_clk, CAN_DEBUG false, FREQ_HZ 250000000" *) input dac0_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac0_clk CLK_P" *) input dac0_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac1_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac1_clk, CAN_DEBUG false, FREQ_HZ 250000000" *) input dac1_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac1_clk CLK_P" *) input dac1_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac2_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac2_clk, CAN_DEBUG false, FREQ_HZ 250000000" *) input dac2_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac2_clk CLK_P" *) input dac2_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac3_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac3_clk, CAN_DEBUG false, FREQ_HZ 250000000" *) input dac3_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac3_clk CLK_P" *) input dac3_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:display_usp_rf_data_converter:diff_pins:1.0 sysref_in diff_n" *) input sysref_in_diff_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_usp_rf_data_converter:diff_pins:1.0 sysref_in diff_p" *) input sysref_in_diff_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin00 V_N" *) input vin00_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin00 V_P" *) input vin00_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin01 V_N" *) input vin01_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin01 V_P" *) input vin01_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin02 V_N" *) input vin02_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin02 V_P" *) input vin02_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin03 V_N" *) input vin03_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin03 V_P" *) input vin03_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin10 V_N" *) input vin10_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin10 V_P" *) input vin10_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin11 V_N" *) input vin11_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin11 V_P" *) input vin11_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin12 V_N" *) input vin12_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin12 V_P" *) input vin12_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin13 V_N" *) input vin13_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin13 V_P" *) input vin13_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin20 V_N" *) input vin20_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin20 V_P" *) input vin20_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin21 V_N" *) input vin21_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin21 V_P" *) input vin21_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin22 V_N" *) input vin22_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin22 V_P" *) input vin22_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin23 V_N" *) input vin23_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin23 V_P" *) input vin23_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin30 V_N" *) input vin30_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin30 V_P" *) input vin30_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin31 V_N" *) input vin31_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin31 V_P" *) input vin31_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin32 V_N" *) input vin32_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin32 V_P" *) input vin32_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin33 V_N" *) input vin33_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin33 V_P" *) input vin33_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout00 V_N" *) output vout00_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout00 V_P" *) output vout00_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout01 V_N" *) output vout01_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout01 V_P" *) output vout01_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout02 V_N" *) output vout02_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout02 V_P" *) output vout02_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout03 V_N" *) output vout03_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout03 V_P" *) output vout03_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout10 V_N" *) output vout10_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout10 V_P" *) output vout10_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout11 V_N" *) output vout11_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout11 V_P" *) output vout11_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout12 V_N" *) output vout12_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout12 V_P" *) output vout12_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout13 V_N" *) output vout13_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout13 V_P" *) output vout13_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout20 V_N" *) output vout20_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout20 V_P" *) output vout20_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout21 V_N" *) output vout21_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout21 V_P" *) output vout21_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout22 V_N" *) output vout22_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout22 V_P" *) output vout22_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout23 V_N" *) output vout23_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout23 V_P" *) output vout23_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout30 V_N" *) output vout30_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout30 V_P" *) output vout30_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout31 V_N" *) output vout31_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout31 V_P" *) output vout31_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout32 V_N" *) output vout32_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout32 V_P" *) output vout32_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout33 V_N" *) output vout33_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout33 V_P" *) output vout33_v_p;

  wire adc0_clk_1_CLK_N;
  wire adc0_clk_1_CLK_P;
  wire adc1_clk_1_CLK_N;
  wire adc1_clk_1_CLK_P;
  wire adc2_clk_1_CLK_N;
  wire adc2_clk_1_CLK_P;
  wire adc3_clk_1_CLK_N;
  wire adc3_clk_1_CLK_P;
  wire [31:0]axi_dma_0_M_AXIS_MM2S_TDATA;
  wire [3:0]axi_dma_0_M_AXIS_MM2S_TKEEP;
  wire axi_dma_0_M_AXIS_MM2S_TLAST;
  wire axi_dma_0_M_AXIS_MM2S_TREADY;
  wire axi_dma_0_M_AXIS_MM2S_TVALID;
  wire [31:0]axi_dma_0_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_dma_0_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_dma_0_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_dma_0_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_dma_0_M_AXI_MM2S_ARPROT;
  wire axi_dma_0_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_dma_0_M_AXI_MM2S_ARSIZE;
  wire axi_dma_0_M_AXI_MM2S_ARVALID;
  wire [31:0]axi_dma_0_M_AXI_MM2S_RDATA;
  wire axi_dma_0_M_AXI_MM2S_RLAST;
  wire axi_dma_0_M_AXI_MM2S_RREADY;
  wire [1:0]axi_dma_0_M_AXI_MM2S_RRESP;
  wire axi_dma_0_M_AXI_MM2S_RVALID;
  wire [31:0]axi_dma_0_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_dma_0_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_dma_0_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_dma_0_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_dma_0_M_AXI_S2MM_AWPROT;
  wire axi_dma_0_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_dma_0_M_AXI_S2MM_AWSIZE;
  wire axi_dma_0_M_AXI_S2MM_AWVALID;
  wire axi_dma_0_M_AXI_S2MM_BREADY;
  wire [1:0]axi_dma_0_M_AXI_S2MM_BRESP;
  wire axi_dma_0_M_AXI_S2MM_BVALID;
  wire [31:0]axi_dma_0_M_AXI_S2MM_WDATA;
  wire axi_dma_0_M_AXI_S2MM_WLAST;
  wire axi_dma_0_M_AXI_S2MM_WREADY;
  wire [3:0]axi_dma_0_M_AXI_S2MM_WSTRB;
  wire axi_dma_0_M_AXI_S2MM_WVALID;
  wire axi_dma_0_mm2s_introut;
  wire axi_dma_0_s2mm_introut;
  wire [7:0]axi_gpio_0_GPIO2_TRI_O;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]axi_gpio_0_gpio_io_o;
  wire [48:0]axi_smc_M00_AXI_ARADDR;
  wire [1:0]axi_smc_M00_AXI_ARBURST;
  wire [3:0]axi_smc_M00_AXI_ARCACHE;
  wire [7:0]axi_smc_M00_AXI_ARLEN;
  wire [0:0]axi_smc_M00_AXI_ARLOCK;
  wire [2:0]axi_smc_M00_AXI_ARPROT;
  wire [3:0]axi_smc_M00_AXI_ARQOS;
  wire axi_smc_M00_AXI_ARREADY;
  wire [2:0]axi_smc_M00_AXI_ARSIZE;
  wire axi_smc_M00_AXI_ARVALID;
  wire [48:0]axi_smc_M00_AXI_AWADDR;
  wire [1:0]axi_smc_M00_AXI_AWBURST;
  wire [3:0]axi_smc_M00_AXI_AWCACHE;
  wire [7:0]axi_smc_M00_AXI_AWLEN;
  wire [0:0]axi_smc_M00_AXI_AWLOCK;
  wire [2:0]axi_smc_M00_AXI_AWPROT;
  wire [3:0]axi_smc_M00_AXI_AWQOS;
  wire axi_smc_M00_AXI_AWREADY;
  wire [2:0]axi_smc_M00_AXI_AWSIZE;
  wire axi_smc_M00_AXI_AWVALID;
  wire axi_smc_M00_AXI_BREADY;
  wire [1:0]axi_smc_M00_AXI_BRESP;
  wire axi_smc_M00_AXI_BVALID;
  wire [127:0]axi_smc_M00_AXI_RDATA;
  wire axi_smc_M00_AXI_RLAST;
  wire axi_smc_M00_AXI_RREADY;
  wire [1:0]axi_smc_M00_AXI_RRESP;
  wire axi_smc_M00_AXI_RVALID;
  wire [127:0]axi_smc_M00_AXI_WDATA;
  wire axi_smc_M00_AXI_WLAST;
  wire axi_smc_M00_AXI_WREADY;
  wire [15:0]axi_smc_M00_AXI_WSTRB;
  wire axi_smc_M00_AXI_WVALID;
  wire [15:0]axis_data_fifo_0_M_AXIS_TDATA;
  wire axis_data_fifo_0_M_AXIS_TREADY;
  wire axis_data_fifo_0_M_AXIS_TVALID;
  (* CONN_BUS_INFO = "axis_data_fifo_1_M_AXIS xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axis_data_fifo_1_M_AXIS_TDATA;
  (* CONN_BUS_INFO = "axis_data_fifo_1_M_AXIS xilinx.com:interface:axis:1.0 None TKEEP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axis_data_fifo_1_M_AXIS_TKEEP;
  (* CONN_BUS_INFO = "axis_data_fifo_1_M_AXIS xilinx.com:interface:axis:1.0 None TLAST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_1_M_AXIS_TLAST;
  (* CONN_BUS_INFO = "axis_data_fifo_1_M_AXIS xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_1_M_AXIS_TREADY;
  (* CONN_BUS_INFO = "axis_data_fifo_1_M_AXIS xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_1_M_AXIS_TVALID;
  (* CONN_BUS_INFO = "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axis_data_fifo_2_M_AXIS_TDATA;
  (* CONN_BUS_INFO = "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TKEEP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axis_data_fifo_2_M_AXIS_TKEEP;
  (* CONN_BUS_INFO = "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TLAST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_2_M_AXIS_TLAST;
  (* CONN_BUS_INFO = "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_2_M_AXIS_TREADY;
  (* CONN_BUS_INFO = "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_2_M_AXIS_TVALID;
  wire [31:0]axis_data_pl_to_ps_fifo_M_AXIS_TDATA;
  wire axis_data_pl_to_ps_fifo_M_AXIS_TREADY;
  wire axis_data_pl_to_ps_fifo_M_AXIS_TVALID;
  wire dac0_clk_1_CLK_N;
  wire dac0_clk_1_CLK_P;
  wire dac1_clk_1_CLK_N;
  wire dac1_clk_1_CLK_P;
  wire dac2_clk_1_CLK_N;
  wire dac2_clk_1_CLK_P;
  wire dac3_clk_1_CLK_N;
  wire dac3_clk_1_CLK_P;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]gpio_buffer_0_gpio_out;
  wire [15:0]gpio_buffer_0_m_axis_TDATA;
  wire gpio_buffer_0_m_axis_TREADY;
  wire gpio_buffer_0_m_axis_TVALID;
  wire [39:0]ps8_0_axi_periph_M00_AXI_ARADDR;
  wire ps8_0_axi_periph_M00_AXI_ARREADY;
  wire [0:0]ps8_0_axi_periph_M00_AXI_ARVALID;
  wire [39:0]ps8_0_axi_periph_M00_AXI_AWADDR;
  wire ps8_0_axi_periph_M00_AXI_AWREADY;
  wire [0:0]ps8_0_axi_periph_M00_AXI_AWVALID;
  wire [0:0]ps8_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]ps8_0_axi_periph_M00_AXI_BRESP;
  wire ps8_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]ps8_0_axi_periph_M00_AXI_RDATA;
  wire [0:0]ps8_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]ps8_0_axi_periph_M00_AXI_RRESP;
  wire ps8_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]ps8_0_axi_periph_M00_AXI_WDATA;
  wire ps8_0_axi_periph_M00_AXI_WREADY;
  wire [0:0]ps8_0_axi_periph_M00_AXI_WVALID;
  wire [39:0]ps8_0_axi_periph_M01_AXI_ARADDR;
  wire ps8_0_axi_periph_M01_AXI_ARREADY;
  wire [0:0]ps8_0_axi_periph_M01_AXI_ARVALID;
  wire [39:0]ps8_0_axi_periph_M01_AXI_AWADDR;
  wire ps8_0_axi_periph_M01_AXI_AWREADY;
  wire [0:0]ps8_0_axi_periph_M01_AXI_AWVALID;
  wire [0:0]ps8_0_axi_periph_M01_AXI_BREADY;
  wire [1:0]ps8_0_axi_periph_M01_AXI_BRESP;
  wire ps8_0_axi_periph_M01_AXI_BVALID;
  wire [31:0]ps8_0_axi_periph_M01_AXI_RDATA;
  wire [0:0]ps8_0_axi_periph_M01_AXI_RREADY;
  wire [1:0]ps8_0_axi_periph_M01_AXI_RRESP;
  wire ps8_0_axi_periph_M01_AXI_RVALID;
  wire [31:0]ps8_0_axi_periph_M01_AXI_WDATA;
  wire ps8_0_axi_periph_M01_AXI_WREADY;
  wire [3:0]ps8_0_axi_periph_M01_AXI_WSTRB;
  wire [0:0]ps8_0_axi_periph_M01_AXI_WVALID;
  wire [39:0]ps8_0_axi_periph_M02_AXI_ARADDR;
  wire ps8_0_axi_periph_M02_AXI_ARREADY;
  wire ps8_0_axi_periph_M02_AXI_ARVALID;
  wire [39:0]ps8_0_axi_periph_M02_AXI_AWADDR;
  wire ps8_0_axi_periph_M02_AXI_AWREADY;
  wire ps8_0_axi_periph_M02_AXI_AWVALID;
  wire ps8_0_axi_periph_M02_AXI_BREADY;
  wire [1:0]ps8_0_axi_periph_M02_AXI_BRESP;
  wire ps8_0_axi_periph_M02_AXI_BVALID;
  wire [31:0]ps8_0_axi_periph_M02_AXI_RDATA;
  wire ps8_0_axi_periph_M02_AXI_RREADY;
  wire [1:0]ps8_0_axi_periph_M02_AXI_RRESP;
  wire ps8_0_axi_periph_M02_AXI_RVALID;
  wire [31:0]ps8_0_axi_periph_M02_AXI_WDATA;
  wire ps8_0_axi_periph_M02_AXI_WREADY;
  wire [3:0]ps8_0_axi_periph_M02_AXI_WSTRB;
  wire ps8_0_axi_periph_M02_AXI_WVALID;
  (* CONN_BUS_INFO = "rfsoc_pl_ctrl_verilo_0_m0_axis xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]rfsoc_pl_ctrl_verilo_0_m0_axis_TDATA;
  (* CONN_BUS_INFO = "rfsoc_pl_ctrl_verilo_0_m0_axis xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire rfsoc_pl_ctrl_verilo_0_m0_axis_TREADY;
  (* CONN_BUS_INFO = "rfsoc_pl_ctrl_verilo_0_m0_axis xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire rfsoc_pl_ctrl_verilo_0_m0_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m10_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m10_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m10_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m11_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m11_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m11_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m12_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m12_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m12_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m13_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m13_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m13_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m14_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m14_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m14_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m15_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m15_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m15_axis_TVALID;
  (* CONN_BUS_INFO = "rfsoc_pl_ctrl_verilo_0_m16_axis xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]rfsoc_pl_ctrl_verilo_0_m16_axis_TDATA;
  (* CONN_BUS_INFO = "rfsoc_pl_ctrl_verilo_0_m16_axis xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire rfsoc_pl_ctrl_verilo_0_m16_axis_TREADY;
  (* CONN_BUS_INFO = "rfsoc_pl_ctrl_verilo_0_m16_axis xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire rfsoc_pl_ctrl_verilo_0_m16_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m1_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m1_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m1_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m2_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m2_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m2_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m3_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m3_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m3_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m4_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m4_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m4_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m5_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m5_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m5_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m6_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m6_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m6_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m7_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m7_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m7_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m8_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m8_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m8_axis_TVALID;
  wire [255:0]rfsoc_pl_ctrl_verilo_0_m9_axis_TDATA;
  wire rfsoc_pl_ctrl_verilo_0_m9_axis_TREADY;
  wire rfsoc_pl_ctrl_verilo_0_m9_axis_TVALID;
  wire [0:0]rst_ps8_0_100M1_peripheral_aresetn;
  wire [0:0]rst_ps8_0_100M_peripheral_aresetn;
  wire sysref_in_1_diff_n;
  wire sysref_in_1_diff_p;
  wire usp_rf_data_converter_0_clk_dac0;
  wire [127:0]usp_rf_data_converter_0_m00_axis_TDATA;
  wire usp_rf_data_converter_0_m00_axis_TREADY;
  wire usp_rf_data_converter_0_m00_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m01_axis_TDATA;
  wire usp_rf_data_converter_0_m01_axis_TREADY;
  wire usp_rf_data_converter_0_m01_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m02_axis_TDATA;
  wire usp_rf_data_converter_0_m02_axis_TREADY;
  wire usp_rf_data_converter_0_m02_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m03_axis_TDATA;
  wire usp_rf_data_converter_0_m03_axis_TREADY;
  wire usp_rf_data_converter_0_m03_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m10_axis_TDATA;
  wire usp_rf_data_converter_0_m10_axis_TREADY;
  wire usp_rf_data_converter_0_m10_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m11_axis_TDATA;
  wire usp_rf_data_converter_0_m11_axis_TREADY;
  wire usp_rf_data_converter_0_m11_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m12_axis_TDATA;
  wire usp_rf_data_converter_0_m12_axis_TREADY;
  wire usp_rf_data_converter_0_m12_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m13_axis_TDATA;
  wire usp_rf_data_converter_0_m13_axis_TREADY;
  wire usp_rf_data_converter_0_m13_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m20_axis_TDATA;
  wire usp_rf_data_converter_0_m20_axis_TREADY;
  wire usp_rf_data_converter_0_m20_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m21_axis_TDATA;
  wire usp_rf_data_converter_0_m21_axis_TREADY;
  wire usp_rf_data_converter_0_m21_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m22_axis_TDATA;
  wire usp_rf_data_converter_0_m22_axis_TREADY;
  wire usp_rf_data_converter_0_m22_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m23_axis_TDATA;
  wire usp_rf_data_converter_0_m23_axis_TREADY;
  wire usp_rf_data_converter_0_m23_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m30_axis_TDATA;
  wire usp_rf_data_converter_0_m30_axis_TREADY;
  wire usp_rf_data_converter_0_m30_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m31_axis_TDATA;
  wire usp_rf_data_converter_0_m31_axis_TREADY;
  wire usp_rf_data_converter_0_m31_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m32_axis_TDATA;
  wire usp_rf_data_converter_0_m32_axis_TREADY;
  wire usp_rf_data_converter_0_m32_axis_TVALID;
  wire [127:0]usp_rf_data_converter_0_m33_axis_TDATA;
  wire usp_rf_data_converter_0_m33_axis_TREADY;
  wire usp_rf_data_converter_0_m33_axis_TVALID;
  wire usp_rf_data_converter_0_vout00_V_N;
  wire usp_rf_data_converter_0_vout00_V_P;
  wire usp_rf_data_converter_0_vout01_V_N;
  wire usp_rf_data_converter_0_vout01_V_P;
  wire usp_rf_data_converter_0_vout02_V_N;
  wire usp_rf_data_converter_0_vout02_V_P;
  wire usp_rf_data_converter_0_vout03_V_N;
  wire usp_rf_data_converter_0_vout03_V_P;
  wire usp_rf_data_converter_0_vout10_V_N;
  wire usp_rf_data_converter_0_vout10_V_P;
  wire usp_rf_data_converter_0_vout11_V_N;
  wire usp_rf_data_converter_0_vout11_V_P;
  wire usp_rf_data_converter_0_vout12_V_N;
  wire usp_rf_data_converter_0_vout12_V_P;
  wire usp_rf_data_converter_0_vout13_V_N;
  wire usp_rf_data_converter_0_vout13_V_P;
  wire usp_rf_data_converter_0_vout20_V_N;
  wire usp_rf_data_converter_0_vout20_V_P;
  wire usp_rf_data_converter_0_vout21_V_N;
  wire usp_rf_data_converter_0_vout21_V_P;
  wire usp_rf_data_converter_0_vout22_V_N;
  wire usp_rf_data_converter_0_vout22_V_P;
  wire usp_rf_data_converter_0_vout23_V_N;
  wire usp_rf_data_converter_0_vout23_V_P;
  wire usp_rf_data_converter_0_vout30_V_N;
  wire usp_rf_data_converter_0_vout30_V_P;
  wire usp_rf_data_converter_0_vout31_V_N;
  wire usp_rf_data_converter_0_vout31_V_P;
  wire usp_rf_data_converter_0_vout32_V_N;
  wire usp_rf_data_converter_0_vout32_V_P;
  wire usp_rf_data_converter_0_vout33_V_N;
  wire usp_rf_data_converter_0_vout33_V_P;
  wire vin00_1_V_N;
  wire vin00_1_V_P;
  wire vin01_1_V_N;
  wire vin01_1_V_P;
  wire vin02_1_V_N;
  wire vin02_1_V_P;
  wire vin03_1_V_N;
  wire vin03_1_V_P;
  wire vin10_1_V_N;
  wire vin10_1_V_P;
  wire vin11_1_V_N;
  wire vin11_1_V_P;
  wire vin12_1_V_N;
  wire vin12_1_V_P;
  wire vin13_1_V_N;
  wire vin13_1_V_P;
  wire vin20_1_V_N;
  wire vin20_1_V_P;
  wire vin21_1_V_N;
  wire vin21_1_V_P;
  wire vin22_1_V_N;
  wire vin22_1_V_P;
  wire vin23_1_V_N;
  wire vin23_1_V_P;
  wire vin30_1_V_N;
  wire vin30_1_V_P;
  wire vin31_1_V_N;
  wire vin31_1_V_P;
  wire vin32_1_V_N;
  wire vin32_1_V_P;
  wire vin33_1_V_N;
  wire vin33_1_V_P;
  wire [1:0]xlconcat_0_dout;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID;
  wire [127:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID;
  wire [127:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID;
  wire zynq_ultra_ps_e_0_pl_clk0;
  wire zynq_ultra_ps_e_0_pl_resetn0;

  assign adc0_clk_1_CLK_N = adc0_clk_clk_n;
  assign adc0_clk_1_CLK_P = adc0_clk_clk_p;
  assign adc1_clk_1_CLK_N = adc1_clk_clk_n;
  assign adc1_clk_1_CLK_P = adc1_clk_clk_p;
  assign adc2_clk_1_CLK_N = adc2_clk_clk_n;
  assign adc2_clk_1_CLK_P = adc2_clk_clk_p;
  assign adc3_clk_1_CLK_N = adc3_clk_clk_n;
  assign adc3_clk_1_CLK_P = adc3_clk_clk_p;
  assign app_leds_tri_o[7:0] = axi_gpio_0_GPIO2_TRI_O;
  assign dac0_clk_1_CLK_N = dac0_clk_clk_n;
  assign dac0_clk_1_CLK_P = dac0_clk_clk_p;
  assign dac1_clk_1_CLK_N = dac1_clk_clk_n;
  assign dac1_clk_1_CLK_P = dac1_clk_clk_p;
  assign dac2_clk_1_CLK_N = dac2_clk_clk_n;
  assign dac2_clk_1_CLK_P = dac2_clk_clk_p;
  assign dac3_clk_1_CLK_N = dac3_clk_clk_n;
  assign dac3_clk_1_CLK_P = dac3_clk_clk_p;
  assign sysref_in_1_diff_n = sysref_in_diff_n;
  assign sysref_in_1_diff_p = sysref_in_diff_p;
  assign vin00_1_V_N = vin00_v_n;
  assign vin00_1_V_P = vin00_v_p;
  assign vin01_1_V_N = vin01_v_n;
  assign vin01_1_V_P = vin01_v_p;
  assign vin02_1_V_N = vin02_v_n;
  assign vin02_1_V_P = vin02_v_p;
  assign vin03_1_V_N = vin03_v_n;
  assign vin03_1_V_P = vin03_v_p;
  assign vin10_1_V_N = vin10_v_n;
  assign vin10_1_V_P = vin10_v_p;
  assign vin11_1_V_N = vin11_v_n;
  assign vin11_1_V_P = vin11_v_p;
  assign vin12_1_V_N = vin12_v_n;
  assign vin12_1_V_P = vin12_v_p;
  assign vin13_1_V_N = vin13_v_n;
  assign vin13_1_V_P = vin13_v_p;
  assign vin20_1_V_N = vin20_v_n;
  assign vin20_1_V_P = vin20_v_p;
  assign vin21_1_V_N = vin21_v_n;
  assign vin21_1_V_P = vin21_v_p;
  assign vin22_1_V_N = vin22_v_n;
  assign vin22_1_V_P = vin22_v_p;
  assign vin23_1_V_N = vin23_v_n;
  assign vin23_1_V_P = vin23_v_p;
  assign vin30_1_V_N = vin30_v_n;
  assign vin30_1_V_P = vin30_v_p;
  assign vin31_1_V_N = vin31_v_n;
  assign vin31_1_V_P = vin31_v_p;
  assign vin32_1_V_N = vin32_v_n;
  assign vin32_1_V_P = vin32_v_p;
  assign vin33_1_V_N = vin33_v_n;
  assign vin33_1_V_P = vin33_v_p;
  assign vout00_v_n = usp_rf_data_converter_0_vout00_V_N;
  assign vout00_v_p = usp_rf_data_converter_0_vout00_V_P;
  assign vout01_v_n = usp_rf_data_converter_0_vout01_V_N;
  assign vout01_v_p = usp_rf_data_converter_0_vout01_V_P;
  assign vout02_v_n = usp_rf_data_converter_0_vout02_V_N;
  assign vout02_v_p = usp_rf_data_converter_0_vout02_V_P;
  assign vout03_v_n = usp_rf_data_converter_0_vout03_V_N;
  assign vout03_v_p = usp_rf_data_converter_0_vout03_V_P;
  assign vout10_v_n = usp_rf_data_converter_0_vout10_V_N;
  assign vout10_v_p = usp_rf_data_converter_0_vout10_V_P;
  assign vout11_v_n = usp_rf_data_converter_0_vout11_V_N;
  assign vout11_v_p = usp_rf_data_converter_0_vout11_V_P;
  assign vout12_v_n = usp_rf_data_converter_0_vout12_V_N;
  assign vout12_v_p = usp_rf_data_converter_0_vout12_V_P;
  assign vout13_v_n = usp_rf_data_converter_0_vout13_V_N;
  assign vout13_v_p = usp_rf_data_converter_0_vout13_V_P;
  assign vout20_v_n = usp_rf_data_converter_0_vout20_V_N;
  assign vout20_v_p = usp_rf_data_converter_0_vout20_V_P;
  assign vout21_v_n = usp_rf_data_converter_0_vout21_V_N;
  assign vout21_v_p = usp_rf_data_converter_0_vout21_V_P;
  assign vout22_v_n = usp_rf_data_converter_0_vout22_V_N;
  assign vout22_v_p = usp_rf_data_converter_0_vout22_V_P;
  assign vout23_v_n = usp_rf_data_converter_0_vout23_V_N;
  assign vout23_v_p = usp_rf_data_converter_0_vout23_V_P;
  assign vout30_v_n = usp_rf_data_converter_0_vout30_V_N;
  assign vout30_v_p = usp_rf_data_converter_0_vout30_V_P;
  assign vout31_v_n = usp_rf_data_converter_0_vout31_V_N;
  assign vout31_v_p = usp_rf_data_converter_0_vout31_V_P;
  assign vout32_v_n = usp_rf_data_converter_0_vout32_V_N;
  assign vout32_v_p = usp_rf_data_converter_0_vout32_V_P;
  assign vout33_v_n = usp_rf_data_converter_0_vout33_V_N;
  assign vout33_v_p = usp_rf_data_converter_0_vout33_V_P;
  top_level_axi_dma_0_0 axi_dma_0
       (.axi_resetn(rst_ps8_0_100M_peripheral_aresetn),
        .m_axi_mm2s_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .m_axi_mm2s_araddr(axi_dma_0_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_dma_0_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_dma_0_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(axi_dma_0_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_dma_0_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_dma_0_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_dma_0_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(axi_dma_0_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_dma_0_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_dma_0_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_dma_0_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_dma_0_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_dma_0_M_AXI_MM2S_RVALID),
        .m_axi_s2mm_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .m_axi_s2mm_awaddr(axi_dma_0_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_dma_0_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_dma_0_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_dma_0_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_dma_0_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_dma_0_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_dma_0_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(axi_dma_0_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_dma_0_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_dma_0_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_dma_0_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_dma_0_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_dma_0_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_dma_0_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_dma_0_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_dma_0_M_AXI_S2MM_WVALID),
        .m_axis_mm2s_tdata(axi_dma_0_M_AXIS_MM2S_TDATA),
        .m_axis_mm2s_tkeep(axi_dma_0_M_AXIS_MM2S_TKEEP),
        .m_axis_mm2s_tlast(axi_dma_0_M_AXIS_MM2S_TLAST),
        .m_axis_mm2s_tready(axi_dma_0_M_AXIS_MM2S_TREADY),
        .m_axis_mm2s_tvalid(axi_dma_0_M_AXIS_MM2S_TVALID),
        .mm2s_introut(axi_dma_0_mm2s_introut),
        .s2mm_introut(axi_dma_0_s2mm_introut),
        .s_axi_lite_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .s_axi_lite_araddr(ps8_0_axi_periph_M00_AXI_ARADDR[9:0]),
        .s_axi_lite_arready(ps8_0_axi_periph_M00_AXI_ARREADY),
        .s_axi_lite_arvalid(ps8_0_axi_periph_M00_AXI_ARVALID),
        .s_axi_lite_awaddr(ps8_0_axi_periph_M00_AXI_AWADDR[9:0]),
        .s_axi_lite_awready(ps8_0_axi_periph_M00_AXI_AWREADY),
        .s_axi_lite_awvalid(ps8_0_axi_periph_M00_AXI_AWVALID),
        .s_axi_lite_bready(ps8_0_axi_periph_M00_AXI_BREADY),
        .s_axi_lite_bresp(ps8_0_axi_periph_M00_AXI_BRESP),
        .s_axi_lite_bvalid(ps8_0_axi_periph_M00_AXI_BVALID),
        .s_axi_lite_rdata(ps8_0_axi_periph_M00_AXI_RDATA),
        .s_axi_lite_rready(ps8_0_axi_periph_M00_AXI_RREADY),
        .s_axi_lite_rresp(ps8_0_axi_periph_M00_AXI_RRESP),
        .s_axi_lite_rvalid(ps8_0_axi_periph_M00_AXI_RVALID),
        .s_axi_lite_wdata(ps8_0_axi_periph_M00_AXI_WDATA),
        .s_axi_lite_wready(ps8_0_axi_periph_M00_AXI_WREADY),
        .s_axi_lite_wvalid(ps8_0_axi_periph_M00_AXI_WVALID),
        .s_axis_s2mm_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .s_axis_s2mm_tkeep(axis_data_fifo_2_M_AXIS_TKEEP),
        .s_axis_s2mm_tlast(axis_data_fifo_2_M_AXIS_TLAST),
        .s_axis_s2mm_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .s_axis_s2mm_tvalid(axis_data_fifo_2_M_AXIS_TVALID));
  top_level_axi_gpio_0_0 axi_gpio_0
       (.gpio2_io_o(axi_gpio_0_GPIO2_TRI_O),
        .gpio_io_o(axi_gpio_0_gpio_io_o),
        .s_axi_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .s_axi_araddr(ps8_0_axi_periph_M01_AXI_ARADDR[8:0]),
        .s_axi_aresetn(rst_ps8_0_100M_peripheral_aresetn),
        .s_axi_arready(ps8_0_axi_periph_M01_AXI_ARREADY),
        .s_axi_arvalid(ps8_0_axi_periph_M01_AXI_ARVALID),
        .s_axi_awaddr(ps8_0_axi_periph_M01_AXI_AWADDR[8:0]),
        .s_axi_awready(ps8_0_axi_periph_M01_AXI_AWREADY),
        .s_axi_awvalid(ps8_0_axi_periph_M01_AXI_AWVALID),
        .s_axi_bready(ps8_0_axi_periph_M01_AXI_BREADY),
        .s_axi_bresp(ps8_0_axi_periph_M01_AXI_BRESP),
        .s_axi_bvalid(ps8_0_axi_periph_M01_AXI_BVALID),
        .s_axi_rdata(ps8_0_axi_periph_M01_AXI_RDATA),
        .s_axi_rready(ps8_0_axi_periph_M01_AXI_RREADY),
        .s_axi_rresp(ps8_0_axi_periph_M01_AXI_RRESP),
        .s_axi_rvalid(ps8_0_axi_periph_M01_AXI_RVALID),
        .s_axi_wdata(ps8_0_axi_periph_M01_AXI_WDATA),
        .s_axi_wready(ps8_0_axi_periph_M01_AXI_WREADY),
        .s_axi_wstrb(ps8_0_axi_periph_M01_AXI_WSTRB),
        .s_axi_wvalid(ps8_0_axi_periph_M01_AXI_WVALID));
  top_level_axi_smc_0 axi_smc
       (.M00_AXI_araddr(axi_smc_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_smc_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_smc_M00_AXI_ARCACHE),
        .M00_AXI_arlen(axi_smc_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_smc_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_smc_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_smc_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_smc_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_smc_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_smc_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_smc_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_smc_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_smc_M00_AXI_AWCACHE),
        .M00_AXI_awlen(axi_smc_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_smc_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_smc_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_smc_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_smc_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_smc_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_smc_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_smc_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_smc_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_smc_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_smc_M00_AXI_RDATA),
        .M00_AXI_rlast(axi_smc_M00_AXI_RLAST),
        .M00_AXI_rready(axi_smc_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_smc_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_smc_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_smc_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_smc_M00_AXI_WLAST),
        .M00_AXI_wready(axi_smc_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_smc_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_smc_M00_AXI_WVALID),
        .S00_AXI_araddr(axi_dma_0_M_AXI_MM2S_ARADDR),
        .S00_AXI_arburst(axi_dma_0_M_AXI_MM2S_ARBURST),
        .S00_AXI_arcache(axi_dma_0_M_AXI_MM2S_ARCACHE),
        .S00_AXI_arlen(axi_dma_0_M_AXI_MM2S_ARLEN),
        .S00_AXI_arlock(1'b0),
        .S00_AXI_arprot(axi_dma_0_M_AXI_MM2S_ARPROT),
        .S00_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arready(axi_dma_0_M_AXI_MM2S_ARREADY),
        .S00_AXI_arsize(axi_dma_0_M_AXI_MM2S_ARSIZE),
        .S00_AXI_arvalid(axi_dma_0_M_AXI_MM2S_ARVALID),
        .S00_AXI_rdata(axi_dma_0_M_AXI_MM2S_RDATA),
        .S00_AXI_rlast(axi_dma_0_M_AXI_MM2S_RLAST),
        .S00_AXI_rready(axi_dma_0_M_AXI_MM2S_RREADY),
        .S00_AXI_rresp(axi_dma_0_M_AXI_MM2S_RRESP),
        .S00_AXI_rvalid(axi_dma_0_M_AXI_MM2S_RVALID),
        .S01_AXI_awaddr(axi_dma_0_M_AXI_S2MM_AWADDR),
        .S01_AXI_awburst(axi_dma_0_M_AXI_S2MM_AWBURST),
        .S01_AXI_awcache(axi_dma_0_M_AXI_S2MM_AWCACHE),
        .S01_AXI_awlen(axi_dma_0_M_AXI_S2MM_AWLEN),
        .S01_AXI_awlock(1'b0),
        .S01_AXI_awprot(axi_dma_0_M_AXI_S2MM_AWPROT),
        .S01_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awready(axi_dma_0_M_AXI_S2MM_AWREADY),
        .S01_AXI_awsize(axi_dma_0_M_AXI_S2MM_AWSIZE),
        .S01_AXI_awvalid(axi_dma_0_M_AXI_S2MM_AWVALID),
        .S01_AXI_bready(axi_dma_0_M_AXI_S2MM_BREADY),
        .S01_AXI_bresp(axi_dma_0_M_AXI_S2MM_BRESP),
        .S01_AXI_bvalid(axi_dma_0_M_AXI_S2MM_BVALID),
        .S01_AXI_wdata(axi_dma_0_M_AXI_S2MM_WDATA),
        .S01_AXI_wlast(axi_dma_0_M_AXI_S2MM_WLAST),
        .S01_AXI_wready(axi_dma_0_M_AXI_S2MM_WREADY),
        .S01_AXI_wstrb(axi_dma_0_M_AXI_S2MM_WSTRB),
        .S01_AXI_wvalid(axi_dma_0_M_AXI_S2MM_WVALID),
        .aclk(zynq_ultra_ps_e_0_pl_clk0),
        .aresetn(rst_ps8_0_100M_peripheral_aresetn));
  top_level_axis_data_fifo_1_1 axis_data_pl_to_ps_fifo
       (.m_axis_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .m_axis_tdata(axis_data_pl_to_ps_fifo_M_AXIS_TDATA),
        .m_axis_tready(axis_data_pl_to_ps_fifo_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_pl_to_ps_fifo_M_AXIS_TVALID),
        .s_axis_aclk(usp_rf_data_converter_0_clk_dac0),
        .s_axis_aresetn(rst_ps8_0_100M1_peripheral_aresetn),
        .s_axis_tdata(rfsoc_pl_ctrl_verilo_0_m16_axis_TDATA),
        .s_axis_tready(rfsoc_pl_ctrl_verilo_0_m16_axis_TREADY),
        .s_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m16_axis_TVALID));
  top_level_axis_data_fifo_1_0 axis_data_ps_to_pl_fifo
       (.m_axis_aclk(usp_rf_data_converter_0_clk_dac0),
        .m_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .m_axis_tkeep(axis_data_fifo_1_M_AXIS_TKEEP),
        .m_axis_tlast(axis_data_fifo_1_M_AXIS_TLAST),
        .m_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .s_axis_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .s_axis_aresetn(rst_ps8_0_100M_peripheral_aresetn),
        .s_axis_tdata(axi_dma_0_M_AXIS_MM2S_TDATA),
        .s_axis_tkeep(axi_dma_0_M_AXIS_MM2S_TKEEP),
        .s_axis_tlast(axi_dma_0_M_AXIS_MM2S_TLAST),
        .s_axis_tready(axi_dma_0_M_AXIS_MM2S_TREADY),
        .s_axis_tvalid(axi_dma_0_M_AXIS_MM2S_TVALID));
  top_level_axis_data_fifo_0_0 axis_gpio_async_fifo
       (.m_axis_aclk(usp_rf_data_converter_0_clk_dac0),
        .m_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .s_axis_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .s_axis_aresetn(rst_ps8_0_100M_peripheral_aresetn),
        .s_axis_tdata(gpio_buffer_0_m_axis_TDATA),
        .s_axis_tready(gpio_buffer_0_m_axis_TREADY),
        .s_axis_tvalid(gpio_buffer_0_m_axis_TVALID));
  top_level_axis_tlast_slice_0_0 axis_tlast_slice_0
       (.m_axis_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .m_axis_tkeep(axis_data_fifo_2_M_AXIS_TKEEP),
        .m_axis_tlast(axis_data_fifo_2_M_AXIS_TLAST),
        .m_axis_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .ps_clk(zynq_ultra_ps_e_0_pl_clk0),
        .rst(rst_ps8_0_100M_peripheral_aresetn),
        .s_axis_tdata(axis_data_pl_to_ps_fifo_M_AXIS_TDATA),
        .s_axis_tready(axis_data_pl_to_ps_fifo_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_pl_to_ps_fifo_M_AXIS_TVALID));
  top_level_gpio_buffer_0_0 gpio_buffer_0
       (.gpio_in(axi_gpio_0_gpio_io_o),
        .gpio_out(gpio_buffer_0_gpio_out),
        .m_axis_tdata(gpio_buffer_0_m_axis_TDATA),
        .m_axis_tready(gpio_buffer_0_m_axis_TREADY),
        .m_axis_tvalid(gpio_buffer_0_m_axis_TVALID),
        .s_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .s_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID));
  top_level_ps8_0_axi_periph_0 ps8_0_axi_periph
       (.ACLK(zynq_ultra_ps_e_0_pl_clk0),
        .ARESETN(rst_ps8_0_100M_peripheral_aresetn),
        .M00_ACLK(zynq_ultra_ps_e_0_pl_clk0),
        .M00_ARESETN(rst_ps8_0_100M_peripheral_aresetn),
        .M00_AXI_araddr(ps8_0_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arready(ps8_0_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(ps8_0_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(ps8_0_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awready(ps8_0_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(ps8_0_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(ps8_0_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(ps8_0_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(ps8_0_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(ps8_0_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(ps8_0_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(ps8_0_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(ps8_0_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(ps8_0_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(ps8_0_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wvalid(ps8_0_axi_periph_M00_AXI_WVALID),
        .M01_ACLK(zynq_ultra_ps_e_0_pl_clk0),
        .M01_ARESETN(rst_ps8_0_100M_peripheral_aresetn),
        .M01_AXI_araddr(ps8_0_axi_periph_M01_AXI_ARADDR),
        .M01_AXI_arready(ps8_0_axi_periph_M01_AXI_ARREADY),
        .M01_AXI_arvalid(ps8_0_axi_periph_M01_AXI_ARVALID),
        .M01_AXI_awaddr(ps8_0_axi_periph_M01_AXI_AWADDR),
        .M01_AXI_awready(ps8_0_axi_periph_M01_AXI_AWREADY),
        .M01_AXI_awvalid(ps8_0_axi_periph_M01_AXI_AWVALID),
        .M01_AXI_bready(ps8_0_axi_periph_M01_AXI_BREADY),
        .M01_AXI_bresp(ps8_0_axi_periph_M01_AXI_BRESP),
        .M01_AXI_bvalid(ps8_0_axi_periph_M01_AXI_BVALID),
        .M01_AXI_rdata(ps8_0_axi_periph_M01_AXI_RDATA),
        .M01_AXI_rready(ps8_0_axi_periph_M01_AXI_RREADY),
        .M01_AXI_rresp(ps8_0_axi_periph_M01_AXI_RRESP),
        .M01_AXI_rvalid(ps8_0_axi_periph_M01_AXI_RVALID),
        .M01_AXI_wdata(ps8_0_axi_periph_M01_AXI_WDATA),
        .M01_AXI_wready(ps8_0_axi_periph_M01_AXI_WREADY),
        .M01_AXI_wstrb(ps8_0_axi_periph_M01_AXI_WSTRB),
        .M01_AXI_wvalid(ps8_0_axi_periph_M01_AXI_WVALID),
        .M02_ACLK(zynq_ultra_ps_e_0_pl_clk0),
        .M02_ARESETN(rst_ps8_0_100M_peripheral_aresetn),
        .M02_AXI_araddr(ps8_0_axi_periph_M02_AXI_ARADDR),
        .M02_AXI_arready(ps8_0_axi_periph_M02_AXI_ARREADY),
        .M02_AXI_arvalid(ps8_0_axi_periph_M02_AXI_ARVALID),
        .M02_AXI_awaddr(ps8_0_axi_periph_M02_AXI_AWADDR),
        .M02_AXI_awready(ps8_0_axi_periph_M02_AXI_AWREADY),
        .M02_AXI_awvalid(ps8_0_axi_periph_M02_AXI_AWVALID),
        .M02_AXI_bready(ps8_0_axi_periph_M02_AXI_BREADY),
        .M02_AXI_bresp(ps8_0_axi_periph_M02_AXI_BRESP),
        .M02_AXI_bvalid(ps8_0_axi_periph_M02_AXI_BVALID),
        .M02_AXI_rdata(ps8_0_axi_periph_M02_AXI_RDATA),
        .M02_AXI_rready(ps8_0_axi_periph_M02_AXI_RREADY),
        .M02_AXI_rresp(ps8_0_axi_periph_M02_AXI_RRESP),
        .M02_AXI_rvalid(ps8_0_axi_periph_M02_AXI_RVALID),
        .M02_AXI_wdata(ps8_0_axi_periph_M02_AXI_WDATA),
        .M02_AXI_wready(ps8_0_axi_periph_M02_AXI_WREADY),
        .M02_AXI_wstrb(ps8_0_axi_periph_M02_AXI_WSTRB),
        .M02_AXI_wvalid(ps8_0_axi_periph_M02_AXI_WVALID),
        .S00_ACLK(zynq_ultra_ps_e_0_pl_clk0),
        .S00_ARESETN(rst_ps8_0_100M_peripheral_aresetn),
        .S00_AXI_araddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR),
        .S00_AXI_arburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST),
        .S00_AXI_arcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE),
        .S00_AXI_arid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID),
        .S00_AXI_arlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN),
        .S00_AXI_arlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK),
        .S00_AXI_arprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT),
        .S00_AXI_arqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS),
        .S00_AXI_arready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY),
        .S00_AXI_arsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE),
        .S00_AXI_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID),
        .S00_AXI_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR),
        .S00_AXI_awburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST),
        .S00_AXI_awcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE),
        .S00_AXI_awid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID),
        .S00_AXI_awlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN),
        .S00_AXI_awlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK),
        .S00_AXI_awprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT),
        .S00_AXI_awqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS),
        .S00_AXI_awready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY),
        .S00_AXI_awsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE),
        .S00_AXI_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID),
        .S00_AXI_bid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID),
        .S00_AXI_bready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY),
        .S00_AXI_bresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP),
        .S00_AXI_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID),
        .S00_AXI_rdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA),
        .S00_AXI_rid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID),
        .S00_AXI_rlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST),
        .S00_AXI_rready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY),
        .S00_AXI_rresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP),
        .S00_AXI_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID),
        .S00_AXI_wdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA),
        .S00_AXI_wlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST),
        .S00_AXI_wready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY),
        .S00_AXI_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB),
        .S00_AXI_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID));
  top_level_rfsoc_pl_ctrl_verilo_0_0 rfsoc_pl_ctrl_verilo_0
       (.clk(usp_rf_data_converter_0_clk_dac0),
        .gpio_ctrl(gpio_buffer_0_gpio_out),
        .m0_axis_tdata(rfsoc_pl_ctrl_verilo_0_m0_axis_TDATA),
        .m0_axis_tready(rfsoc_pl_ctrl_verilo_0_m0_axis_TREADY),
        .m0_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m0_axis_TVALID),
        .m10_axis_tdata(rfsoc_pl_ctrl_verilo_0_m10_axis_TDATA),
        .m10_axis_tready(rfsoc_pl_ctrl_verilo_0_m10_axis_TREADY),
        .m10_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m10_axis_TVALID),
        .m11_axis_tdata(rfsoc_pl_ctrl_verilo_0_m11_axis_TDATA),
        .m11_axis_tready(rfsoc_pl_ctrl_verilo_0_m11_axis_TREADY),
        .m11_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m11_axis_TVALID),
        .m12_axis_tdata(rfsoc_pl_ctrl_verilo_0_m12_axis_TDATA),
        .m12_axis_tready(rfsoc_pl_ctrl_verilo_0_m12_axis_TREADY),
        .m12_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m12_axis_TVALID),
        .m13_axis_tdata(rfsoc_pl_ctrl_verilo_0_m13_axis_TDATA),
        .m13_axis_tready(rfsoc_pl_ctrl_verilo_0_m13_axis_TREADY),
        .m13_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m13_axis_TVALID),
        .m14_axis_tdata(rfsoc_pl_ctrl_verilo_0_m14_axis_TDATA),
        .m14_axis_tready(rfsoc_pl_ctrl_verilo_0_m14_axis_TREADY),
        .m14_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m14_axis_TVALID),
        .m15_axis_tdata(rfsoc_pl_ctrl_verilo_0_m15_axis_TDATA),
        .m15_axis_tready(rfsoc_pl_ctrl_verilo_0_m15_axis_TREADY),
        .m15_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m15_axis_TVALID),
        .m16_axis_tdata(rfsoc_pl_ctrl_verilo_0_m16_axis_TDATA),
        .m16_axis_tready(rfsoc_pl_ctrl_verilo_0_m16_axis_TREADY),
        .m16_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m16_axis_TVALID),
        .m1_axis_tdata(rfsoc_pl_ctrl_verilo_0_m1_axis_TDATA),
        .m1_axis_tready(rfsoc_pl_ctrl_verilo_0_m1_axis_TREADY),
        .m1_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m1_axis_TVALID),
        .m2_axis_tdata(rfsoc_pl_ctrl_verilo_0_m2_axis_TDATA),
        .m2_axis_tready(rfsoc_pl_ctrl_verilo_0_m2_axis_TREADY),
        .m2_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m2_axis_TVALID),
        .m3_axis_tdata(rfsoc_pl_ctrl_verilo_0_m3_axis_TDATA),
        .m3_axis_tready(rfsoc_pl_ctrl_verilo_0_m3_axis_TREADY),
        .m3_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m3_axis_TVALID),
        .m4_axis_tdata(rfsoc_pl_ctrl_verilo_0_m4_axis_TDATA),
        .m4_axis_tready(rfsoc_pl_ctrl_verilo_0_m4_axis_TREADY),
        .m4_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m4_axis_TVALID),
        .m5_axis_tdata(rfsoc_pl_ctrl_verilo_0_m5_axis_TDATA),
        .m5_axis_tready(rfsoc_pl_ctrl_verilo_0_m5_axis_TREADY),
        .m5_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m5_axis_TVALID),
        .m6_axis_tdata(rfsoc_pl_ctrl_verilo_0_m6_axis_TDATA),
        .m6_axis_tready(rfsoc_pl_ctrl_verilo_0_m6_axis_TREADY),
        .m6_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m6_axis_TVALID),
        .m7_axis_tdata(rfsoc_pl_ctrl_verilo_0_m7_axis_TDATA),
        .m7_axis_tready(rfsoc_pl_ctrl_verilo_0_m7_axis_TREADY),
        .m7_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m7_axis_TVALID),
        .m8_axis_tdata(rfsoc_pl_ctrl_verilo_0_m8_axis_TDATA),
        .m8_axis_tready(rfsoc_pl_ctrl_verilo_0_m8_axis_TREADY),
        .m8_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m8_axis_TVALID),
        .m9_axis_tdata(rfsoc_pl_ctrl_verilo_0_m9_axis_TDATA),
        .m9_axis_tready(rfsoc_pl_ctrl_verilo_0_m9_axis_TREADY),
        .m9_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m9_axis_TVALID),
        .rst(rst_ps8_0_100M1_peripheral_aresetn),
        .s0_axis_tdata(usp_rf_data_converter_0_m00_axis_TDATA),
        .s0_axis_tready(usp_rf_data_converter_0_m00_axis_TREADY),
        .s0_axis_tvalid(usp_rf_data_converter_0_m00_axis_TVALID),
        .s10_axis_tdata(usp_rf_data_converter_0_m22_axis_TDATA),
        .s10_axis_tready(usp_rf_data_converter_0_m22_axis_TREADY),
        .s10_axis_tvalid(usp_rf_data_converter_0_m22_axis_TVALID),
        .s11_axis_tdata(usp_rf_data_converter_0_m23_axis_TDATA),
        .s11_axis_tready(usp_rf_data_converter_0_m23_axis_TREADY),
        .s11_axis_tvalid(usp_rf_data_converter_0_m23_axis_TVALID),
        .s12_axis_tdata(usp_rf_data_converter_0_m30_axis_TDATA),
        .s12_axis_tready(usp_rf_data_converter_0_m30_axis_TREADY),
        .s12_axis_tvalid(usp_rf_data_converter_0_m30_axis_TVALID),
        .s13_axis_tdata(usp_rf_data_converter_0_m31_axis_TDATA),
        .s13_axis_tready(usp_rf_data_converter_0_m31_axis_TREADY),
        .s13_axis_tvalid(usp_rf_data_converter_0_m31_axis_TVALID),
        .s14_axis_tdata(usp_rf_data_converter_0_m32_axis_TDATA),
        .s14_axis_tready(usp_rf_data_converter_0_m32_axis_TREADY),
        .s14_axis_tvalid(usp_rf_data_converter_0_m32_axis_TVALID),
        .s15_axis_tdata(usp_rf_data_converter_0_m33_axis_TDATA),
        .s15_axis_tready(usp_rf_data_converter_0_m33_axis_TREADY),
        .s15_axis_tvalid(usp_rf_data_converter_0_m33_axis_TVALID),
        .s1_axis_tdata(usp_rf_data_converter_0_m01_axis_TDATA),
        .s1_axis_tready(usp_rf_data_converter_0_m01_axis_TREADY),
        .s1_axis_tvalid(usp_rf_data_converter_0_m01_axis_TVALID),
        .s2_axis_tdata(usp_rf_data_converter_0_m02_axis_TDATA),
        .s2_axis_tready(usp_rf_data_converter_0_m02_axis_TREADY),
        .s2_axis_tvalid(usp_rf_data_converter_0_m02_axis_TVALID),
        .s3_axis_tdata(usp_rf_data_converter_0_m03_axis_TDATA),
        .s3_axis_tready(usp_rf_data_converter_0_m03_axis_TREADY),
        .s3_axis_tvalid(usp_rf_data_converter_0_m03_axis_TVALID),
        .s4_axis_tdata(usp_rf_data_converter_0_m10_axis_TDATA),
        .s4_axis_tready(usp_rf_data_converter_0_m10_axis_TREADY),
        .s4_axis_tvalid(usp_rf_data_converter_0_m10_axis_TVALID),
        .s5_axis_tdata(usp_rf_data_converter_0_m11_axis_TDATA),
        .s5_axis_tready(usp_rf_data_converter_0_m11_axis_TREADY),
        .s5_axis_tvalid(usp_rf_data_converter_0_m11_axis_TVALID),
        .s6_axis_tdata(usp_rf_data_converter_0_m12_axis_TDATA),
        .s6_axis_tready(usp_rf_data_converter_0_m12_axis_TREADY),
        .s6_axis_tvalid(usp_rf_data_converter_0_m12_axis_TVALID),
        .s7_axis_tdata(usp_rf_data_converter_0_m13_axis_TDATA),
        .s7_axis_tready(usp_rf_data_converter_0_m13_axis_TREADY),
        .s7_axis_tvalid(usp_rf_data_converter_0_m13_axis_TVALID),
        .s8_axis_tdata(usp_rf_data_converter_0_m20_axis_TDATA),
        .s8_axis_tready(usp_rf_data_converter_0_m20_axis_TREADY),
        .s8_axis_tvalid(usp_rf_data_converter_0_m20_axis_TVALID),
        .s9_axis_tdata(usp_rf_data_converter_0_m21_axis_TDATA),
        .s9_axis_tready(usp_rf_data_converter_0_m21_axis_TREADY),
        .s9_axis_tvalid(usp_rf_data_converter_0_m21_axis_TVALID),
        .s_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .s_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID));
  top_level_rst_ps8_0_100M_0 rst_ps8_0_100M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(zynq_ultra_ps_e_0_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_ps8_0_100M_peripheral_aresetn),
        .slowest_sync_clk(zynq_ultra_ps_e_0_pl_clk0));
  top_level_rst_ps8_0_100M_1 rst_ps8_0_100M1
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(rst_ps8_0_100M_peripheral_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_ps8_0_100M1_peripheral_aresetn),
        .slowest_sync_clk(usp_rf_data_converter_0_clk_dac0));
  top_level_system_ila_0_0 system_ila_pl
       (.SLOT_0_AXIS_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .SLOT_0_AXIS_tkeep(axis_data_fifo_1_M_AXIS_TKEEP),
        .SLOT_0_AXIS_tlast(axis_data_fifo_1_M_AXIS_TLAST),
        .SLOT_0_AXIS_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .SLOT_0_AXIS_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .SLOT_1_AXIS_tdata(rfsoc_pl_ctrl_verilo_0_m0_axis_TDATA),
        .SLOT_1_AXIS_tlast(1'b0),
        .SLOT_1_AXIS_tready(rfsoc_pl_ctrl_verilo_0_m0_axis_TREADY),
        .SLOT_1_AXIS_tvalid(rfsoc_pl_ctrl_verilo_0_m0_axis_TVALID),
        .SLOT_2_AXIS_tdata(rfsoc_pl_ctrl_verilo_0_m16_axis_TDATA),
        .SLOT_2_AXIS_tlast(1'b0),
        .SLOT_2_AXIS_tready(rfsoc_pl_ctrl_verilo_0_m16_axis_TREADY),
        .SLOT_2_AXIS_tvalid(rfsoc_pl_ctrl_verilo_0_m16_axis_TVALID),
        .clk(usp_rf_data_converter_0_clk_dac0),
        .probe0(gpio_buffer_0_gpio_out),
        .resetn(rst_ps8_0_100M1_peripheral_aresetn));
  top_level_system_ila_1_0 system_ila_ps
       (.SLOT_0_AXIS_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .SLOT_0_AXIS_tkeep(axis_data_fifo_2_M_AXIS_TKEEP),
        .SLOT_0_AXIS_tlast(axis_data_fifo_2_M_AXIS_TLAST),
        .SLOT_0_AXIS_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .SLOT_0_AXIS_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .clk(zynq_ultra_ps_e_0_pl_clk0),
        .probe0(axi_gpio_0_gpio_io_o),
        .resetn(rst_ps8_0_100M_peripheral_aresetn));
  top_level_usp_rf_data_converter_0_0 usp_rf_data_converter_0
       (.adc0_clk_n(adc0_clk_1_CLK_N),
        .adc0_clk_p(adc0_clk_1_CLK_P),
        .adc1_clk_n(adc1_clk_1_CLK_N),
        .adc1_clk_p(adc1_clk_1_CLK_P),
        .adc2_clk_n(adc2_clk_1_CLK_N),
        .adc2_clk_p(adc2_clk_1_CLK_P),
        .adc3_clk_n(adc3_clk_1_CLK_N),
        .adc3_clk_p(adc3_clk_1_CLK_P),
        .clk_dac0(usp_rf_data_converter_0_clk_dac0),
        .dac0_clk_n(dac0_clk_1_CLK_N),
        .dac0_clk_p(dac0_clk_1_CLK_P),
        .dac1_clk_n(dac1_clk_1_CLK_N),
        .dac1_clk_p(dac1_clk_1_CLK_P),
        .dac2_clk_n(dac2_clk_1_CLK_N),
        .dac2_clk_p(dac2_clk_1_CLK_P),
        .dac3_clk_n(dac3_clk_1_CLK_N),
        .dac3_clk_p(dac3_clk_1_CLK_P),
        .m00_axis_tdata(usp_rf_data_converter_0_m00_axis_TDATA),
        .m00_axis_tready(usp_rf_data_converter_0_m00_axis_TREADY),
        .m00_axis_tvalid(usp_rf_data_converter_0_m00_axis_TVALID),
        .m01_axis_tdata(usp_rf_data_converter_0_m01_axis_TDATA),
        .m01_axis_tready(usp_rf_data_converter_0_m01_axis_TREADY),
        .m01_axis_tvalid(usp_rf_data_converter_0_m01_axis_TVALID),
        .m02_axis_tdata(usp_rf_data_converter_0_m02_axis_TDATA),
        .m02_axis_tready(usp_rf_data_converter_0_m02_axis_TREADY),
        .m02_axis_tvalid(usp_rf_data_converter_0_m02_axis_TVALID),
        .m03_axis_tdata(usp_rf_data_converter_0_m03_axis_TDATA),
        .m03_axis_tready(usp_rf_data_converter_0_m03_axis_TREADY),
        .m03_axis_tvalid(usp_rf_data_converter_0_m03_axis_TVALID),
        .m0_axis_aclk(usp_rf_data_converter_0_clk_dac0),
        .m0_axis_aresetn(rst_ps8_0_100M1_peripheral_aresetn),
        .m10_axis_tdata(usp_rf_data_converter_0_m10_axis_TDATA),
        .m10_axis_tready(usp_rf_data_converter_0_m10_axis_TREADY),
        .m10_axis_tvalid(usp_rf_data_converter_0_m10_axis_TVALID),
        .m11_axis_tdata(usp_rf_data_converter_0_m11_axis_TDATA),
        .m11_axis_tready(usp_rf_data_converter_0_m11_axis_TREADY),
        .m11_axis_tvalid(usp_rf_data_converter_0_m11_axis_TVALID),
        .m12_axis_tdata(usp_rf_data_converter_0_m12_axis_TDATA),
        .m12_axis_tready(usp_rf_data_converter_0_m12_axis_TREADY),
        .m12_axis_tvalid(usp_rf_data_converter_0_m12_axis_TVALID),
        .m13_axis_tdata(usp_rf_data_converter_0_m13_axis_TDATA),
        .m13_axis_tready(usp_rf_data_converter_0_m13_axis_TREADY),
        .m13_axis_tvalid(usp_rf_data_converter_0_m13_axis_TVALID),
        .m1_axis_aclk(usp_rf_data_converter_0_clk_dac0),
        .m1_axis_aresetn(rst_ps8_0_100M1_peripheral_aresetn),
        .m20_axis_tdata(usp_rf_data_converter_0_m20_axis_TDATA),
        .m20_axis_tready(usp_rf_data_converter_0_m20_axis_TREADY),
        .m20_axis_tvalid(usp_rf_data_converter_0_m20_axis_TVALID),
        .m21_axis_tdata(usp_rf_data_converter_0_m21_axis_TDATA),
        .m21_axis_tready(usp_rf_data_converter_0_m21_axis_TREADY),
        .m21_axis_tvalid(usp_rf_data_converter_0_m21_axis_TVALID),
        .m22_axis_tdata(usp_rf_data_converter_0_m22_axis_TDATA),
        .m22_axis_tready(usp_rf_data_converter_0_m22_axis_TREADY),
        .m22_axis_tvalid(usp_rf_data_converter_0_m22_axis_TVALID),
        .m23_axis_tdata(usp_rf_data_converter_0_m23_axis_TDATA),
        .m23_axis_tready(usp_rf_data_converter_0_m23_axis_TREADY),
        .m23_axis_tvalid(usp_rf_data_converter_0_m23_axis_TVALID),
        .m2_axis_aclk(usp_rf_data_converter_0_clk_dac0),
        .m2_axis_aresetn(rst_ps8_0_100M1_peripheral_aresetn),
        .m30_axis_tdata(usp_rf_data_converter_0_m30_axis_TDATA),
        .m30_axis_tready(usp_rf_data_converter_0_m30_axis_TREADY),
        .m30_axis_tvalid(usp_rf_data_converter_0_m30_axis_TVALID),
        .m31_axis_tdata(usp_rf_data_converter_0_m31_axis_TDATA),
        .m31_axis_tready(usp_rf_data_converter_0_m31_axis_TREADY),
        .m31_axis_tvalid(usp_rf_data_converter_0_m31_axis_TVALID),
        .m32_axis_tdata(usp_rf_data_converter_0_m32_axis_TDATA),
        .m32_axis_tready(usp_rf_data_converter_0_m32_axis_TREADY),
        .m32_axis_tvalid(usp_rf_data_converter_0_m32_axis_TVALID),
        .m33_axis_tdata(usp_rf_data_converter_0_m33_axis_TDATA),
        .m33_axis_tready(usp_rf_data_converter_0_m33_axis_TREADY),
        .m33_axis_tvalid(usp_rf_data_converter_0_m33_axis_TVALID),
        .m3_axis_aclk(usp_rf_data_converter_0_clk_dac0),
        .m3_axis_aresetn(rst_ps8_0_100M1_peripheral_aresetn),
        .s00_axis_tdata(rfsoc_pl_ctrl_verilo_0_m0_axis_TDATA),
        .s00_axis_tready(rfsoc_pl_ctrl_verilo_0_m0_axis_TREADY),
        .s00_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m0_axis_TVALID),
        .s01_axis_tdata(rfsoc_pl_ctrl_verilo_0_m1_axis_TDATA),
        .s01_axis_tready(rfsoc_pl_ctrl_verilo_0_m1_axis_TREADY),
        .s01_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m1_axis_TVALID),
        .s02_axis_tdata(rfsoc_pl_ctrl_verilo_0_m2_axis_TDATA),
        .s02_axis_tready(rfsoc_pl_ctrl_verilo_0_m2_axis_TREADY),
        .s02_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m2_axis_TVALID),
        .s03_axis_tdata(rfsoc_pl_ctrl_verilo_0_m3_axis_TDATA),
        .s03_axis_tready(rfsoc_pl_ctrl_verilo_0_m3_axis_TREADY),
        .s03_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m3_axis_TVALID),
        .s0_axis_aclk(usp_rf_data_converter_0_clk_dac0),
        .s0_axis_aresetn(rst_ps8_0_100M1_peripheral_aresetn),
        .s10_axis_tdata(rfsoc_pl_ctrl_verilo_0_m4_axis_TDATA),
        .s10_axis_tready(rfsoc_pl_ctrl_verilo_0_m4_axis_TREADY),
        .s10_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m4_axis_TVALID),
        .s11_axis_tdata(rfsoc_pl_ctrl_verilo_0_m5_axis_TDATA),
        .s11_axis_tready(rfsoc_pl_ctrl_verilo_0_m5_axis_TREADY),
        .s11_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m5_axis_TVALID),
        .s12_axis_tdata(rfsoc_pl_ctrl_verilo_0_m6_axis_TDATA),
        .s12_axis_tready(rfsoc_pl_ctrl_verilo_0_m6_axis_TREADY),
        .s12_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m6_axis_TVALID),
        .s13_axis_tdata(rfsoc_pl_ctrl_verilo_0_m7_axis_TDATA),
        .s13_axis_tready(rfsoc_pl_ctrl_verilo_0_m7_axis_TREADY),
        .s13_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m7_axis_TVALID),
        .s1_axis_aclk(usp_rf_data_converter_0_clk_dac0),
        .s1_axis_aresetn(rst_ps8_0_100M1_peripheral_aresetn),
        .s20_axis_tdata(rfsoc_pl_ctrl_verilo_0_m8_axis_TDATA),
        .s20_axis_tready(rfsoc_pl_ctrl_verilo_0_m8_axis_TREADY),
        .s20_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m8_axis_TVALID),
        .s21_axis_tdata(rfsoc_pl_ctrl_verilo_0_m9_axis_TDATA),
        .s21_axis_tready(rfsoc_pl_ctrl_verilo_0_m9_axis_TREADY),
        .s21_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m9_axis_TVALID),
        .s22_axis_tdata(rfsoc_pl_ctrl_verilo_0_m10_axis_TDATA),
        .s22_axis_tready(rfsoc_pl_ctrl_verilo_0_m10_axis_TREADY),
        .s22_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m10_axis_TVALID),
        .s23_axis_tdata(rfsoc_pl_ctrl_verilo_0_m11_axis_TDATA),
        .s23_axis_tready(rfsoc_pl_ctrl_verilo_0_m11_axis_TREADY),
        .s23_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m11_axis_TVALID),
        .s2_axis_aclk(usp_rf_data_converter_0_clk_dac0),
        .s2_axis_aresetn(rst_ps8_0_100M1_peripheral_aresetn),
        .s30_axis_tdata(rfsoc_pl_ctrl_verilo_0_m12_axis_TDATA),
        .s30_axis_tready(rfsoc_pl_ctrl_verilo_0_m12_axis_TREADY),
        .s30_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m12_axis_TVALID),
        .s31_axis_tdata(rfsoc_pl_ctrl_verilo_0_m13_axis_TDATA),
        .s31_axis_tready(rfsoc_pl_ctrl_verilo_0_m13_axis_TREADY),
        .s31_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m13_axis_TVALID),
        .s32_axis_tdata(rfsoc_pl_ctrl_verilo_0_m14_axis_TDATA),
        .s32_axis_tready(rfsoc_pl_ctrl_verilo_0_m14_axis_TREADY),
        .s32_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m14_axis_TVALID),
        .s33_axis_tdata(rfsoc_pl_ctrl_verilo_0_m15_axis_TDATA),
        .s33_axis_tready(rfsoc_pl_ctrl_verilo_0_m15_axis_TREADY),
        .s33_axis_tvalid(rfsoc_pl_ctrl_verilo_0_m15_axis_TVALID),
        .s3_axis_aclk(usp_rf_data_converter_0_clk_dac0),
        .s3_axis_aresetn(rst_ps8_0_100M1_peripheral_aresetn),
        .s_axi_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .s_axi_araddr(ps8_0_axi_periph_M02_AXI_ARADDR[17:0]),
        .s_axi_aresetn(rst_ps8_0_100M_peripheral_aresetn),
        .s_axi_arready(ps8_0_axi_periph_M02_AXI_ARREADY),
        .s_axi_arvalid(ps8_0_axi_periph_M02_AXI_ARVALID),
        .s_axi_awaddr(ps8_0_axi_periph_M02_AXI_AWADDR[17:0]),
        .s_axi_awready(ps8_0_axi_periph_M02_AXI_AWREADY),
        .s_axi_awvalid(ps8_0_axi_periph_M02_AXI_AWVALID),
        .s_axi_bready(ps8_0_axi_periph_M02_AXI_BREADY),
        .s_axi_bresp(ps8_0_axi_periph_M02_AXI_BRESP),
        .s_axi_bvalid(ps8_0_axi_periph_M02_AXI_BVALID),
        .s_axi_rdata(ps8_0_axi_periph_M02_AXI_RDATA),
        .s_axi_rready(ps8_0_axi_periph_M02_AXI_RREADY),
        .s_axi_rresp(ps8_0_axi_periph_M02_AXI_RRESP),
        .s_axi_rvalid(ps8_0_axi_periph_M02_AXI_RVALID),
        .s_axi_wdata(ps8_0_axi_periph_M02_AXI_WDATA),
        .s_axi_wready(ps8_0_axi_periph_M02_AXI_WREADY),
        .s_axi_wstrb(ps8_0_axi_periph_M02_AXI_WSTRB),
        .s_axi_wvalid(ps8_0_axi_periph_M02_AXI_WVALID),
        .sysref_in_n(sysref_in_1_diff_n),
        .sysref_in_p(sysref_in_1_diff_p),
        .user_sysref_adc(1'b0),
        .user_sysref_dac(1'b0),
        .vin00_n(vin00_1_V_N),
        .vin00_p(vin00_1_V_P),
        .vin01_n(vin01_1_V_N),
        .vin01_p(vin01_1_V_P),
        .vin02_n(vin02_1_V_N),
        .vin02_p(vin02_1_V_P),
        .vin03_n(vin03_1_V_N),
        .vin03_p(vin03_1_V_P),
        .vin10_n(vin10_1_V_N),
        .vin10_p(vin10_1_V_P),
        .vin11_n(vin11_1_V_N),
        .vin11_p(vin11_1_V_P),
        .vin12_n(vin12_1_V_N),
        .vin12_p(vin12_1_V_P),
        .vin13_n(vin13_1_V_N),
        .vin13_p(vin13_1_V_P),
        .vin20_n(vin20_1_V_N),
        .vin20_p(vin20_1_V_P),
        .vin21_n(vin21_1_V_N),
        .vin21_p(vin21_1_V_P),
        .vin22_n(vin22_1_V_N),
        .vin22_p(vin22_1_V_P),
        .vin23_n(vin23_1_V_N),
        .vin23_p(vin23_1_V_P),
        .vin30_n(vin30_1_V_N),
        .vin30_p(vin30_1_V_P),
        .vin31_n(vin31_1_V_N),
        .vin31_p(vin31_1_V_P),
        .vin32_n(vin32_1_V_N),
        .vin32_p(vin32_1_V_P),
        .vin33_n(vin33_1_V_N),
        .vin33_p(vin33_1_V_P),
        .vout00_n(usp_rf_data_converter_0_vout00_V_N),
        .vout00_p(usp_rf_data_converter_0_vout00_V_P),
        .vout01_n(usp_rf_data_converter_0_vout01_V_N),
        .vout01_p(usp_rf_data_converter_0_vout01_V_P),
        .vout02_n(usp_rf_data_converter_0_vout02_V_N),
        .vout02_p(usp_rf_data_converter_0_vout02_V_P),
        .vout03_n(usp_rf_data_converter_0_vout03_V_N),
        .vout03_p(usp_rf_data_converter_0_vout03_V_P),
        .vout10_n(usp_rf_data_converter_0_vout10_V_N),
        .vout10_p(usp_rf_data_converter_0_vout10_V_P),
        .vout11_n(usp_rf_data_converter_0_vout11_V_N),
        .vout11_p(usp_rf_data_converter_0_vout11_V_P),
        .vout12_n(usp_rf_data_converter_0_vout12_V_N),
        .vout12_p(usp_rf_data_converter_0_vout12_V_P),
        .vout13_n(usp_rf_data_converter_0_vout13_V_N),
        .vout13_p(usp_rf_data_converter_0_vout13_V_P),
        .vout20_n(usp_rf_data_converter_0_vout20_V_N),
        .vout20_p(usp_rf_data_converter_0_vout20_V_P),
        .vout21_n(usp_rf_data_converter_0_vout21_V_N),
        .vout21_p(usp_rf_data_converter_0_vout21_V_P),
        .vout22_n(usp_rf_data_converter_0_vout22_V_N),
        .vout22_p(usp_rf_data_converter_0_vout22_V_P),
        .vout23_n(usp_rf_data_converter_0_vout23_V_N),
        .vout23_p(usp_rf_data_converter_0_vout23_V_P),
        .vout30_n(usp_rf_data_converter_0_vout30_V_N),
        .vout30_p(usp_rf_data_converter_0_vout30_V_P),
        .vout31_n(usp_rf_data_converter_0_vout31_V_N),
        .vout31_p(usp_rf_data_converter_0_vout31_V_P),
        .vout32_n(usp_rf_data_converter_0_vout32_V_N),
        .vout32_p(usp_rf_data_converter_0_vout32_V_P),
        .vout33_n(usp_rf_data_converter_0_vout33_V_N),
        .vout33_p(usp_rf_data_converter_0_vout33_V_P));
  top_level_xlconcat_0_0 xlconcat_0
       (.In0(axi_dma_0_mm2s_introut),
        .In1(axi_dma_0_s2mm_introut),
        .dout(xlconcat_0_dout));
  top_level_zynq_ultra_ps_e_0_0 zynq_ultra_ps_e_0
       (.maxigp0_araddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR),
        .maxigp0_arburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST),
        .maxigp0_arcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE),
        .maxigp0_arid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID),
        .maxigp0_arlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN),
        .maxigp0_arlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK),
        .maxigp0_arprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT),
        .maxigp0_arqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS),
        .maxigp0_arready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY),
        .maxigp0_arsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE),
        .maxigp0_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID),
        .maxigp0_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR),
        .maxigp0_awburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST),
        .maxigp0_awcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE),
        .maxigp0_awid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID),
        .maxigp0_awlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN),
        .maxigp0_awlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK),
        .maxigp0_awprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT),
        .maxigp0_awqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS),
        .maxigp0_awready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY),
        .maxigp0_awsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE),
        .maxigp0_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID),
        .maxigp0_bid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID),
        .maxigp0_bready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY),
        .maxigp0_bresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP),
        .maxigp0_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID),
        .maxigp0_rdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA),
        .maxigp0_rid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID),
        .maxigp0_rlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST),
        .maxigp0_rready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY),
        .maxigp0_rresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP),
        .maxigp0_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID),
        .maxigp0_wdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA),
        .maxigp0_wlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST),
        .maxigp0_wready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY),
        .maxigp0_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB),
        .maxigp0_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID),
        .maxihpm0_fpd_aclk(zynq_ultra_ps_e_0_pl_clk0),
        .pl_clk0(zynq_ultra_ps_e_0_pl_clk0),
        .pl_ps_irq0(xlconcat_0_dout),
        .pl_resetn0(zynq_ultra_ps_e_0_pl_resetn0),
        .saxigp0_araddr(axi_smc_M00_AXI_ARADDR),
        .saxigp0_arburst(axi_smc_M00_AXI_ARBURST),
        .saxigp0_arcache(axi_smc_M00_AXI_ARCACHE),
        .saxigp0_arid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .saxigp0_arlen(axi_smc_M00_AXI_ARLEN),
        .saxigp0_arlock(axi_smc_M00_AXI_ARLOCK),
        .saxigp0_arprot(axi_smc_M00_AXI_ARPROT),
        .saxigp0_arqos(axi_smc_M00_AXI_ARQOS),
        .saxigp0_arready(axi_smc_M00_AXI_ARREADY),
        .saxigp0_arsize(axi_smc_M00_AXI_ARSIZE),
        .saxigp0_aruser(1'b0),
        .saxigp0_arvalid(axi_smc_M00_AXI_ARVALID),
        .saxigp0_awaddr(axi_smc_M00_AXI_AWADDR),
        .saxigp0_awburst(axi_smc_M00_AXI_AWBURST),
        .saxigp0_awcache(axi_smc_M00_AXI_AWCACHE),
        .saxigp0_awid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .saxigp0_awlen(axi_smc_M00_AXI_AWLEN),
        .saxigp0_awlock(axi_smc_M00_AXI_AWLOCK),
        .saxigp0_awprot(axi_smc_M00_AXI_AWPROT),
        .saxigp0_awqos(axi_smc_M00_AXI_AWQOS),
        .saxigp0_awready(axi_smc_M00_AXI_AWREADY),
        .saxigp0_awsize(axi_smc_M00_AXI_AWSIZE),
        .saxigp0_awuser(1'b0),
        .saxigp0_awvalid(axi_smc_M00_AXI_AWVALID),
        .saxigp0_bready(axi_smc_M00_AXI_BREADY),
        .saxigp0_bresp(axi_smc_M00_AXI_BRESP),
        .saxigp0_bvalid(axi_smc_M00_AXI_BVALID),
        .saxigp0_rdata(axi_smc_M00_AXI_RDATA),
        .saxigp0_rlast(axi_smc_M00_AXI_RLAST),
        .saxigp0_rready(axi_smc_M00_AXI_RREADY),
        .saxigp0_rresp(axi_smc_M00_AXI_RRESP),
        .saxigp0_rvalid(axi_smc_M00_AXI_RVALID),
        .saxigp0_wdata(axi_smc_M00_AXI_WDATA),
        .saxigp0_wlast(axi_smc_M00_AXI_WLAST),
        .saxigp0_wready(axi_smc_M00_AXI_WREADY),
        .saxigp0_wstrb(axi_smc_M00_AXI_WSTRB),
        .saxigp0_wvalid(axi_smc_M00_AXI_WVALID),
        .saxihpc0_fpd_aclk(zynq_ultra_ps_e_0_pl_clk0));
endmodule

module top_level_ps8_0_axi_periph_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [39:0]M00_AXI_araddr;
  input [0:0]M00_AXI_arready;
  output [0:0]M00_AXI_arvalid;
  output [39:0]M00_AXI_awaddr;
  input [0:0]M00_AXI_awready;
  output [0:0]M00_AXI_awvalid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input [0:0]M00_AXI_wready;
  output [0:0]M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [39:0]M01_AXI_araddr;
  input [0:0]M01_AXI_arready;
  output [0:0]M01_AXI_arvalid;
  output [39:0]M01_AXI_awaddr;
  input [0:0]M01_AXI_awready;
  output [0:0]M01_AXI_awvalid;
  output [0:0]M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input [0:0]M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output [0:0]M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input [0:0]M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input [0:0]M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output [0:0]M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [39:0]M02_AXI_araddr;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [39:0]M02_AXI_awaddr;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [39:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [15:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [39:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [15:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [15:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [127:0]S00_AXI_rdata;
  output [15:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [127:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [15:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire [39:0]m00_couplers_to_ps8_0_axi_periph_ARADDR;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_ARREADY;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_ARVALID;
  wire [39:0]m00_couplers_to_ps8_0_axi_periph_AWADDR;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_AWREADY;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_AWVALID;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_BREADY;
  wire [1:0]m00_couplers_to_ps8_0_axi_periph_BRESP;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_BVALID;
  wire [31:0]m00_couplers_to_ps8_0_axi_periph_RDATA;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_RREADY;
  wire [1:0]m00_couplers_to_ps8_0_axi_periph_RRESP;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_RVALID;
  wire [31:0]m00_couplers_to_ps8_0_axi_periph_WDATA;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_WREADY;
  wire [0:0]m00_couplers_to_ps8_0_axi_periph_WVALID;
  wire [39:0]m01_couplers_to_ps8_0_axi_periph_ARADDR;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_ARREADY;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_ARVALID;
  wire [39:0]m01_couplers_to_ps8_0_axi_periph_AWADDR;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_AWREADY;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_AWVALID;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_BREADY;
  wire [1:0]m01_couplers_to_ps8_0_axi_periph_BRESP;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_BVALID;
  wire [31:0]m01_couplers_to_ps8_0_axi_periph_RDATA;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_RREADY;
  wire [1:0]m01_couplers_to_ps8_0_axi_periph_RRESP;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_RVALID;
  wire [31:0]m01_couplers_to_ps8_0_axi_periph_WDATA;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_WREADY;
  wire [3:0]m01_couplers_to_ps8_0_axi_periph_WSTRB;
  wire [0:0]m01_couplers_to_ps8_0_axi_periph_WVALID;
  wire [39:0]m02_couplers_to_ps8_0_axi_periph_ARADDR;
  wire m02_couplers_to_ps8_0_axi_periph_ARREADY;
  wire m02_couplers_to_ps8_0_axi_periph_ARVALID;
  wire [39:0]m02_couplers_to_ps8_0_axi_periph_AWADDR;
  wire m02_couplers_to_ps8_0_axi_periph_AWREADY;
  wire m02_couplers_to_ps8_0_axi_periph_AWVALID;
  wire m02_couplers_to_ps8_0_axi_periph_BREADY;
  wire [1:0]m02_couplers_to_ps8_0_axi_periph_BRESP;
  wire m02_couplers_to_ps8_0_axi_periph_BVALID;
  wire [31:0]m02_couplers_to_ps8_0_axi_periph_RDATA;
  wire m02_couplers_to_ps8_0_axi_periph_RREADY;
  wire [1:0]m02_couplers_to_ps8_0_axi_periph_RRESP;
  wire m02_couplers_to_ps8_0_axi_periph_RVALID;
  wire [31:0]m02_couplers_to_ps8_0_axi_periph_WDATA;
  wire m02_couplers_to_ps8_0_axi_periph_WREADY;
  wire [3:0]m02_couplers_to_ps8_0_axi_periph_WSTRB;
  wire m02_couplers_to_ps8_0_axi_periph_WVALID;
  wire ps8_0_axi_periph_ACLK_net;
  wire ps8_0_axi_periph_ARESETN_net;
  wire [39:0]ps8_0_axi_periph_to_s00_couplers_ARADDR;
  wire [1:0]ps8_0_axi_periph_to_s00_couplers_ARBURST;
  wire [3:0]ps8_0_axi_periph_to_s00_couplers_ARCACHE;
  wire [15:0]ps8_0_axi_periph_to_s00_couplers_ARID;
  wire [7:0]ps8_0_axi_periph_to_s00_couplers_ARLEN;
  wire ps8_0_axi_periph_to_s00_couplers_ARLOCK;
  wire [2:0]ps8_0_axi_periph_to_s00_couplers_ARPROT;
  wire [3:0]ps8_0_axi_periph_to_s00_couplers_ARQOS;
  wire ps8_0_axi_periph_to_s00_couplers_ARREADY;
  wire [2:0]ps8_0_axi_periph_to_s00_couplers_ARSIZE;
  wire ps8_0_axi_periph_to_s00_couplers_ARVALID;
  wire [39:0]ps8_0_axi_periph_to_s00_couplers_AWADDR;
  wire [1:0]ps8_0_axi_periph_to_s00_couplers_AWBURST;
  wire [3:0]ps8_0_axi_periph_to_s00_couplers_AWCACHE;
  wire [15:0]ps8_0_axi_periph_to_s00_couplers_AWID;
  wire [7:0]ps8_0_axi_periph_to_s00_couplers_AWLEN;
  wire ps8_0_axi_periph_to_s00_couplers_AWLOCK;
  wire [2:0]ps8_0_axi_periph_to_s00_couplers_AWPROT;
  wire [3:0]ps8_0_axi_periph_to_s00_couplers_AWQOS;
  wire ps8_0_axi_periph_to_s00_couplers_AWREADY;
  wire [2:0]ps8_0_axi_periph_to_s00_couplers_AWSIZE;
  wire ps8_0_axi_periph_to_s00_couplers_AWVALID;
  wire [15:0]ps8_0_axi_periph_to_s00_couplers_BID;
  wire ps8_0_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]ps8_0_axi_periph_to_s00_couplers_BRESP;
  wire ps8_0_axi_periph_to_s00_couplers_BVALID;
  wire [127:0]ps8_0_axi_periph_to_s00_couplers_RDATA;
  wire [15:0]ps8_0_axi_periph_to_s00_couplers_RID;
  wire ps8_0_axi_periph_to_s00_couplers_RLAST;
  wire ps8_0_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]ps8_0_axi_periph_to_s00_couplers_RRESP;
  wire ps8_0_axi_periph_to_s00_couplers_RVALID;
  wire [127:0]ps8_0_axi_periph_to_s00_couplers_WDATA;
  wire ps8_0_axi_periph_to_s00_couplers_WLAST;
  wire ps8_0_axi_periph_to_s00_couplers_WREADY;
  wire [15:0]ps8_0_axi_periph_to_s00_couplers_WSTRB;
  wire ps8_0_axi_periph_to_s00_couplers_WVALID;
  wire [39:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [39:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [39:0]xbar_to_m00_couplers_ARADDR;
  wire [0:0]xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [39:0]xbar_to_m00_couplers_AWADDR;
  wire [0:0]xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire [0:0]xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire [0:0]xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WREADY;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [79:40]xbar_to_m01_couplers_ARADDR;
  wire [0:0]xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [79:40]xbar_to_m01_couplers_AWADDR;
  wire [0:0]xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire [0:0]xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire [0:0]xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [0:0]xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [119:80]xbar_to_m02_couplers_ARADDR;
  wire xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [119:80]xbar_to_m02_couplers_AWADDR;
  wire xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [11:0]NLW_xbar_m_axi_wstrb_UNCONNECTED;

  assign M00_AXI_araddr[39:0] = m00_couplers_to_ps8_0_axi_periph_ARADDR;
  assign M00_AXI_arvalid[0] = m00_couplers_to_ps8_0_axi_periph_ARVALID;
  assign M00_AXI_awaddr[39:0] = m00_couplers_to_ps8_0_axi_periph_AWADDR;
  assign M00_AXI_awvalid[0] = m00_couplers_to_ps8_0_axi_periph_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_ps8_0_axi_periph_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_ps8_0_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_ps8_0_axi_periph_WDATA;
  assign M00_AXI_wvalid[0] = m00_couplers_to_ps8_0_axi_periph_WVALID;
  assign M01_AXI_araddr[39:0] = m01_couplers_to_ps8_0_axi_periph_ARADDR;
  assign M01_AXI_arvalid[0] = m01_couplers_to_ps8_0_axi_periph_ARVALID;
  assign M01_AXI_awaddr[39:0] = m01_couplers_to_ps8_0_axi_periph_AWADDR;
  assign M01_AXI_awvalid[0] = m01_couplers_to_ps8_0_axi_periph_AWVALID;
  assign M01_AXI_bready[0] = m01_couplers_to_ps8_0_axi_periph_BREADY;
  assign M01_AXI_rready[0] = m01_couplers_to_ps8_0_axi_periph_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_ps8_0_axi_periph_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_ps8_0_axi_periph_WSTRB;
  assign M01_AXI_wvalid[0] = m01_couplers_to_ps8_0_axi_periph_WVALID;
  assign M02_AXI_araddr[39:0] = m02_couplers_to_ps8_0_axi_periph_ARADDR;
  assign M02_AXI_arvalid = m02_couplers_to_ps8_0_axi_periph_ARVALID;
  assign M02_AXI_awaddr[39:0] = m02_couplers_to_ps8_0_axi_periph_AWADDR;
  assign M02_AXI_awvalid = m02_couplers_to_ps8_0_axi_periph_AWVALID;
  assign M02_AXI_bready = m02_couplers_to_ps8_0_axi_periph_BREADY;
  assign M02_AXI_rready = m02_couplers_to_ps8_0_axi_periph_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_ps8_0_axi_periph_WDATA;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_ps8_0_axi_periph_WSTRB;
  assign M02_AXI_wvalid = m02_couplers_to_ps8_0_axi_periph_WVALID;
  assign S00_AXI_arready = ps8_0_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = ps8_0_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[15:0] = ps8_0_axi_periph_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = ps8_0_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = ps8_0_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[127:0] = ps8_0_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rid[15:0] = ps8_0_axi_periph_to_s00_couplers_RID;
  assign S00_AXI_rlast = ps8_0_axi_periph_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = ps8_0_axi_periph_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = ps8_0_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready = ps8_0_axi_periph_to_s00_couplers_WREADY;
  assign m00_couplers_to_ps8_0_axi_periph_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_ps8_0_axi_periph_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_ps8_0_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_ps8_0_axi_periph_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_ps8_0_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_ps8_0_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_ps8_0_axi_periph_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_ps8_0_axi_periph_WREADY = M00_AXI_wready[0];
  assign m01_couplers_to_ps8_0_axi_periph_ARREADY = M01_AXI_arready[0];
  assign m01_couplers_to_ps8_0_axi_periph_AWREADY = M01_AXI_awready[0];
  assign m01_couplers_to_ps8_0_axi_periph_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_ps8_0_axi_periph_BVALID = M01_AXI_bvalid[0];
  assign m01_couplers_to_ps8_0_axi_periph_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_ps8_0_axi_periph_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_ps8_0_axi_periph_RVALID = M01_AXI_rvalid[0];
  assign m01_couplers_to_ps8_0_axi_periph_WREADY = M01_AXI_wready[0];
  assign m02_couplers_to_ps8_0_axi_periph_ARREADY = M02_AXI_arready;
  assign m02_couplers_to_ps8_0_axi_periph_AWREADY = M02_AXI_awready;
  assign m02_couplers_to_ps8_0_axi_periph_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_ps8_0_axi_periph_BVALID = M02_AXI_bvalid;
  assign m02_couplers_to_ps8_0_axi_periph_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_ps8_0_axi_periph_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_ps8_0_axi_periph_RVALID = M02_AXI_rvalid;
  assign m02_couplers_to_ps8_0_axi_periph_WREADY = M02_AXI_wready;
  assign ps8_0_axi_periph_ACLK_net = ACLK;
  assign ps8_0_axi_periph_ARESETN_net = ARESETN;
  assign ps8_0_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[39:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARID = S00_AXI_arid[15:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARLOCK = S00_AXI_arlock;
  assign ps8_0_axi_periph_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign ps8_0_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign ps8_0_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[39:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWID = S00_AXI_awid[15:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWLEN = S00_AXI_awlen[7:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWLOCK = S00_AXI_awlock;
  assign ps8_0_axi_periph_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign ps8_0_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign ps8_0_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready;
  assign ps8_0_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready;
  assign ps8_0_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[127:0];
  assign ps8_0_axi_periph_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign ps8_0_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[15:0];
  assign ps8_0_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid;
  m00_couplers_imp_K308NP m00_couplers
       (.M_ACLK(ps8_0_axi_periph_ACLK_net),
        .M_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m00_couplers_to_ps8_0_axi_periph_ARADDR),
        .M_AXI_arready(m00_couplers_to_ps8_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_ps8_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_ps8_0_axi_periph_AWADDR),
        .M_AXI_awready(m00_couplers_to_ps8_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_ps8_0_axi_periph_AWVALID),
        .M_AXI_bready(m00_couplers_to_ps8_0_axi_periph_BREADY),
        .M_AXI_bresp(m00_couplers_to_ps8_0_axi_periph_BRESP),
        .M_AXI_bvalid(m00_couplers_to_ps8_0_axi_periph_BVALID),
        .M_AXI_rdata(m00_couplers_to_ps8_0_axi_periph_RDATA),
        .M_AXI_rready(m00_couplers_to_ps8_0_axi_periph_RREADY),
        .M_AXI_rresp(m00_couplers_to_ps8_0_axi_periph_RRESP),
        .M_AXI_rvalid(m00_couplers_to_ps8_0_axi_periph_RVALID),
        .M_AXI_wdata(m00_couplers_to_ps8_0_axi_periph_WDATA),
        .M_AXI_wready(m00_couplers_to_ps8_0_axi_periph_WREADY),
        .M_AXI_wvalid(m00_couplers_to_ps8_0_axi_periph_WVALID),
        .S_ACLK(ps8_0_axi_periph_ACLK_net),
        .S_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_189BYX9 m01_couplers
       (.M_ACLK(ps8_0_axi_periph_ACLK_net),
        .M_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m01_couplers_to_ps8_0_axi_periph_ARADDR),
        .M_AXI_arready(m01_couplers_to_ps8_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_ps8_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_ps8_0_axi_periph_AWADDR),
        .M_AXI_awready(m01_couplers_to_ps8_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_ps8_0_axi_periph_AWVALID),
        .M_AXI_bready(m01_couplers_to_ps8_0_axi_periph_BREADY),
        .M_AXI_bresp(m01_couplers_to_ps8_0_axi_periph_BRESP),
        .M_AXI_bvalid(m01_couplers_to_ps8_0_axi_periph_BVALID),
        .M_AXI_rdata(m01_couplers_to_ps8_0_axi_periph_RDATA),
        .M_AXI_rready(m01_couplers_to_ps8_0_axi_periph_RREADY),
        .M_AXI_rresp(m01_couplers_to_ps8_0_axi_periph_RRESP),
        .M_AXI_rvalid(m01_couplers_to_ps8_0_axi_periph_RVALID),
        .M_AXI_wdata(m01_couplers_to_ps8_0_axi_periph_WDATA),
        .M_AXI_wready(m01_couplers_to_ps8_0_axi_periph_WREADY),
        .M_AXI_wstrb(m01_couplers_to_ps8_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_ps8_0_axi_periph_WVALID),
        .S_ACLK(ps8_0_axi_periph_ACLK_net),
        .S_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_GVO0MC m02_couplers
       (.M_ACLK(ps8_0_axi_periph_ACLK_net),
        .M_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(m02_couplers_to_ps8_0_axi_periph_ARADDR),
        .M_AXI_arready(m02_couplers_to_ps8_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_ps8_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_ps8_0_axi_periph_AWADDR),
        .M_AXI_awready(m02_couplers_to_ps8_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_ps8_0_axi_periph_AWVALID),
        .M_AXI_bready(m02_couplers_to_ps8_0_axi_periph_BREADY),
        .M_AXI_bresp(m02_couplers_to_ps8_0_axi_periph_BRESP),
        .M_AXI_bvalid(m02_couplers_to_ps8_0_axi_periph_BVALID),
        .M_AXI_rdata(m02_couplers_to_ps8_0_axi_periph_RDATA),
        .M_AXI_rready(m02_couplers_to_ps8_0_axi_periph_RREADY),
        .M_AXI_rresp(m02_couplers_to_ps8_0_axi_periph_RRESP),
        .M_AXI_rvalid(m02_couplers_to_ps8_0_axi_periph_RVALID),
        .M_AXI_wdata(m02_couplers_to_ps8_0_axi_periph_WDATA),
        .M_AXI_wready(m02_couplers_to_ps8_0_axi_periph_WREADY),
        .M_AXI_wstrb(m02_couplers_to_ps8_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_ps8_0_axi_periph_WVALID),
        .S_ACLK(ps8_0_axi_periph_ACLK_net),
        .S_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  s00_couplers_imp_1LSKJNT s00_couplers
       (.M_ACLK(ps8_0_axi_periph_ACLK_net),
        .M_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(ps8_0_axi_periph_ACLK_net),
        .S_ARESETN(ps8_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(ps8_0_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arburst(ps8_0_axi_periph_to_s00_couplers_ARBURST),
        .S_AXI_arcache(ps8_0_axi_periph_to_s00_couplers_ARCACHE),
        .S_AXI_arid(ps8_0_axi_periph_to_s00_couplers_ARID),
        .S_AXI_arlen(ps8_0_axi_periph_to_s00_couplers_ARLEN),
        .S_AXI_arlock(ps8_0_axi_periph_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(ps8_0_axi_periph_to_s00_couplers_ARPROT),
        .S_AXI_arqos(ps8_0_axi_periph_to_s00_couplers_ARQOS),
        .S_AXI_arready(ps8_0_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arsize(ps8_0_axi_periph_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(ps8_0_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(ps8_0_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awburst(ps8_0_axi_periph_to_s00_couplers_AWBURST),
        .S_AXI_awcache(ps8_0_axi_periph_to_s00_couplers_AWCACHE),
        .S_AXI_awid(ps8_0_axi_periph_to_s00_couplers_AWID),
        .S_AXI_awlen(ps8_0_axi_periph_to_s00_couplers_AWLEN),
        .S_AXI_awlock(ps8_0_axi_periph_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(ps8_0_axi_periph_to_s00_couplers_AWPROT),
        .S_AXI_awqos(ps8_0_axi_periph_to_s00_couplers_AWQOS),
        .S_AXI_awready(ps8_0_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awsize(ps8_0_axi_periph_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(ps8_0_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bid(ps8_0_axi_periph_to_s00_couplers_BID),
        .S_AXI_bready(ps8_0_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(ps8_0_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(ps8_0_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(ps8_0_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rid(ps8_0_axi_periph_to_s00_couplers_RID),
        .S_AXI_rlast(ps8_0_axi_periph_to_s00_couplers_RLAST),
        .S_AXI_rready(ps8_0_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rresp(ps8_0_axi_periph_to_s00_couplers_RRESP),
        .S_AXI_rvalid(ps8_0_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(ps8_0_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wlast(ps8_0_axi_periph_to_s00_couplers_WLAST),
        .S_AXI_wready(ps8_0_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(ps8_0_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(ps8_0_axi_periph_to_s00_couplers_WVALID));
  top_level_xbar_0 xbar
       (.aclk(ps8_0_axi_periph_ACLK_net),
        .aresetn(ps8_0_axi_periph_ARESETN_net),
        .m_axi_araddr({xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arready({xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awready({xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,NLW_xbar_m_axi_wstrb_UNCONNECTED[3:0]}),
        .m_axi_wvalid({xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule
