-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1.1 (win64) Build 2960000 Wed Aug  5 22:57:20 MDT 2020
-- Date        : Tue Oct 13 21:26:43 2020
-- Host        : JAMES-LENOVO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/repos/RFSoC_Controller_V2/vivado_project/RFSoC_Controller_V2.srcs/sources_1/bd/top_level/ip/top_level_usp_rf_data_converter_0_0/top_level_usp_rf_data_converter_0_0_stub.vhdl
-- Design      : top_level_usp_rf_data_converter_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_usp_rf_data_converter_0_0 is
  Port ( 
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    sysref_in_p : in STD_LOGIC;
    sysref_in_n : in STD_LOGIC;
    user_sysref_adc : in STD_LOGIC;
    user_sysref_dac : in STD_LOGIC;
    adc0_clk_p : in STD_LOGIC;
    adc0_clk_n : in STD_LOGIC;
    clk_adc0 : out STD_LOGIC;
    m0_axis_aclk : in STD_LOGIC;
    m0_axis_aresetn : in STD_LOGIC;
    adc1_clk_p : in STD_LOGIC;
    adc1_clk_n : in STD_LOGIC;
    clk_adc1 : out STD_LOGIC;
    m1_axis_aclk : in STD_LOGIC;
    m1_axis_aresetn : in STD_LOGIC;
    adc2_clk_p : in STD_LOGIC;
    adc2_clk_n : in STD_LOGIC;
    clk_adc2 : out STD_LOGIC;
    m2_axis_aclk : in STD_LOGIC;
    m2_axis_aresetn : in STD_LOGIC;
    adc3_clk_p : in STD_LOGIC;
    adc3_clk_n : in STD_LOGIC;
    clk_adc3 : out STD_LOGIC;
    m3_axis_aclk : in STD_LOGIC;
    m3_axis_aresetn : in STD_LOGIC;
    vin00_p : in STD_LOGIC;
    vin00_n : in STD_LOGIC;
    vin01_p : in STD_LOGIC;
    vin01_n : in STD_LOGIC;
    vin02_p : in STD_LOGIC;
    vin02_n : in STD_LOGIC;
    vin03_p : in STD_LOGIC;
    vin03_n : in STD_LOGIC;
    vin10_p : in STD_LOGIC;
    vin10_n : in STD_LOGIC;
    vin11_p : in STD_LOGIC;
    vin11_n : in STD_LOGIC;
    vin12_p : in STD_LOGIC;
    vin12_n : in STD_LOGIC;
    vin13_p : in STD_LOGIC;
    vin13_n : in STD_LOGIC;
    vin20_p : in STD_LOGIC;
    vin20_n : in STD_LOGIC;
    vin21_p : in STD_LOGIC;
    vin21_n : in STD_LOGIC;
    vin22_p : in STD_LOGIC;
    vin22_n : in STD_LOGIC;
    vin23_p : in STD_LOGIC;
    vin23_n : in STD_LOGIC;
    vin30_p : in STD_LOGIC;
    vin30_n : in STD_LOGIC;
    vin31_p : in STD_LOGIC;
    vin31_n : in STD_LOGIC;
    vin32_p : in STD_LOGIC;
    vin32_n : in STD_LOGIC;
    vin33_p : in STD_LOGIC;
    vin33_n : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m01_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m01_axis_tvalid : out STD_LOGIC;
    m01_axis_tready : in STD_LOGIC;
    m02_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m02_axis_tvalid : out STD_LOGIC;
    m02_axis_tready : in STD_LOGIC;
    m03_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m03_axis_tvalid : out STD_LOGIC;
    m03_axis_tready : in STD_LOGIC;
    m10_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m10_axis_tvalid : out STD_LOGIC;
    m10_axis_tready : in STD_LOGIC;
    m11_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m11_axis_tvalid : out STD_LOGIC;
    m11_axis_tready : in STD_LOGIC;
    m12_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m12_axis_tvalid : out STD_LOGIC;
    m12_axis_tready : in STD_LOGIC;
    m13_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m13_axis_tvalid : out STD_LOGIC;
    m13_axis_tready : in STD_LOGIC;
    m20_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m20_axis_tvalid : out STD_LOGIC;
    m20_axis_tready : in STD_LOGIC;
    m21_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m21_axis_tvalid : out STD_LOGIC;
    m21_axis_tready : in STD_LOGIC;
    m22_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m22_axis_tvalid : out STD_LOGIC;
    m22_axis_tready : in STD_LOGIC;
    m23_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m23_axis_tvalid : out STD_LOGIC;
    m23_axis_tready : in STD_LOGIC;
    m30_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m30_axis_tvalid : out STD_LOGIC;
    m30_axis_tready : in STD_LOGIC;
    m31_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m31_axis_tvalid : out STD_LOGIC;
    m31_axis_tready : in STD_LOGIC;
    m32_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m32_axis_tvalid : out STD_LOGIC;
    m32_axis_tready : in STD_LOGIC;
    m33_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m33_axis_tvalid : out STD_LOGIC;
    m33_axis_tready : in STD_LOGIC;
    dac0_clk_p : in STD_LOGIC;
    dac0_clk_n : in STD_LOGIC;
    clk_dac0 : out STD_LOGIC;
    s0_axis_aclk : in STD_LOGIC;
    s0_axis_aresetn : in STD_LOGIC;
    dac1_clk_p : in STD_LOGIC;
    dac1_clk_n : in STD_LOGIC;
    clk_dac1 : out STD_LOGIC;
    s1_axis_aclk : in STD_LOGIC;
    s1_axis_aresetn : in STD_LOGIC;
    dac2_clk_p : in STD_LOGIC;
    dac2_clk_n : in STD_LOGIC;
    clk_dac2 : out STD_LOGIC;
    s2_axis_aclk : in STD_LOGIC;
    s2_axis_aresetn : in STD_LOGIC;
    dac3_clk_p : in STD_LOGIC;
    dac3_clk_n : in STD_LOGIC;
    clk_dac3 : out STD_LOGIC;
    s3_axis_aclk : in STD_LOGIC;
    s3_axis_aresetn : in STD_LOGIC;
    vout00_p : out STD_LOGIC;
    vout00_n : out STD_LOGIC;
    vout01_p : out STD_LOGIC;
    vout01_n : out STD_LOGIC;
    vout02_p : out STD_LOGIC;
    vout02_n : out STD_LOGIC;
    vout03_p : out STD_LOGIC;
    vout03_n : out STD_LOGIC;
    vout10_p : out STD_LOGIC;
    vout10_n : out STD_LOGIC;
    vout11_p : out STD_LOGIC;
    vout11_n : out STD_LOGIC;
    vout12_p : out STD_LOGIC;
    vout12_n : out STD_LOGIC;
    vout13_p : out STD_LOGIC;
    vout13_n : out STD_LOGIC;
    vout20_p : out STD_LOGIC;
    vout20_n : out STD_LOGIC;
    vout21_p : out STD_LOGIC;
    vout21_n : out STD_LOGIC;
    vout22_p : out STD_LOGIC;
    vout22_n : out STD_LOGIC;
    vout23_p : out STD_LOGIC;
    vout23_n : out STD_LOGIC;
    vout30_p : out STD_LOGIC;
    vout30_n : out STD_LOGIC;
    vout31_p : out STD_LOGIC;
    vout31_n : out STD_LOGIC;
    vout32_p : out STD_LOGIC;
    vout32_n : out STD_LOGIC;
    vout33_p : out STD_LOGIC;
    vout33_n : out STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s01_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s01_axis_tvalid : in STD_LOGIC;
    s01_axis_tready : out STD_LOGIC;
    s02_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s02_axis_tvalid : in STD_LOGIC;
    s02_axis_tready : out STD_LOGIC;
    s03_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s03_axis_tvalid : in STD_LOGIC;
    s03_axis_tready : out STD_LOGIC;
    s10_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s10_axis_tvalid : in STD_LOGIC;
    s10_axis_tready : out STD_LOGIC;
    s11_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s11_axis_tvalid : in STD_LOGIC;
    s11_axis_tready : out STD_LOGIC;
    s12_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s12_axis_tvalid : in STD_LOGIC;
    s12_axis_tready : out STD_LOGIC;
    s13_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s13_axis_tvalid : in STD_LOGIC;
    s13_axis_tready : out STD_LOGIC;
    s20_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s20_axis_tvalid : in STD_LOGIC;
    s20_axis_tready : out STD_LOGIC;
    s21_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s21_axis_tvalid : in STD_LOGIC;
    s21_axis_tready : out STD_LOGIC;
    s22_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s22_axis_tvalid : in STD_LOGIC;
    s22_axis_tready : out STD_LOGIC;
    s23_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s23_axis_tvalid : in STD_LOGIC;
    s23_axis_tready : out STD_LOGIC;
    s30_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s30_axis_tvalid : in STD_LOGIC;
    s30_axis_tready : out STD_LOGIC;
    s31_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s31_axis_tvalid : in STD_LOGIC;
    s31_axis_tready : out STD_LOGIC;
    s32_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s32_axis_tvalid : in STD_LOGIC;
    s32_axis_tready : out STD_LOGIC;
    s33_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s33_axis_tvalid : in STD_LOGIC;
    s33_axis_tready : out STD_LOGIC;
    irq : out STD_LOGIC
  );

end top_level_usp_rf_data_converter_0_0;

architecture stub of top_level_usp_rf_data_converter_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_aclk,s_axi_aresetn,s_axi_awaddr[17:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[17:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,sysref_in_p,sysref_in_n,user_sysref_adc,user_sysref_dac,adc0_clk_p,adc0_clk_n,clk_adc0,m0_axis_aclk,m0_axis_aresetn,adc1_clk_p,adc1_clk_n,clk_adc1,m1_axis_aclk,m1_axis_aresetn,adc2_clk_p,adc2_clk_n,clk_adc2,m2_axis_aclk,m2_axis_aresetn,adc3_clk_p,adc3_clk_n,clk_adc3,m3_axis_aclk,m3_axis_aresetn,vin00_p,vin00_n,vin01_p,vin01_n,vin02_p,vin02_n,vin03_p,vin03_n,vin10_p,vin10_n,vin11_p,vin11_n,vin12_p,vin12_n,vin13_p,vin13_n,vin20_p,vin20_n,vin21_p,vin21_n,vin22_p,vin22_n,vin23_p,vin23_n,vin30_p,vin30_n,vin31_p,vin31_n,vin32_p,vin32_n,vin33_p,vin33_n,m00_axis_tdata[127:0],m00_axis_tvalid,m00_axis_tready,m01_axis_tdata[127:0],m01_axis_tvalid,m01_axis_tready,m02_axis_tdata[127:0],m02_axis_tvalid,m02_axis_tready,m03_axis_tdata[127:0],m03_axis_tvalid,m03_axis_tready,m10_axis_tdata[127:0],m10_axis_tvalid,m10_axis_tready,m11_axis_tdata[127:0],m11_axis_tvalid,m11_axis_tready,m12_axis_tdata[127:0],m12_axis_tvalid,m12_axis_tready,m13_axis_tdata[127:0],m13_axis_tvalid,m13_axis_tready,m20_axis_tdata[127:0],m20_axis_tvalid,m20_axis_tready,m21_axis_tdata[127:0],m21_axis_tvalid,m21_axis_tready,m22_axis_tdata[127:0],m22_axis_tvalid,m22_axis_tready,m23_axis_tdata[127:0],m23_axis_tvalid,m23_axis_tready,m30_axis_tdata[127:0],m30_axis_tvalid,m30_axis_tready,m31_axis_tdata[127:0],m31_axis_tvalid,m31_axis_tready,m32_axis_tdata[127:0],m32_axis_tvalid,m32_axis_tready,m33_axis_tdata[127:0],m33_axis_tvalid,m33_axis_tready,dac0_clk_p,dac0_clk_n,clk_dac0,s0_axis_aclk,s0_axis_aresetn,dac1_clk_p,dac1_clk_n,clk_dac1,s1_axis_aclk,s1_axis_aresetn,dac2_clk_p,dac2_clk_n,clk_dac2,s2_axis_aclk,s2_axis_aresetn,dac3_clk_p,dac3_clk_n,clk_dac3,s3_axis_aclk,s3_axis_aresetn,vout00_p,vout00_n,vout01_p,vout01_n,vout02_p,vout02_n,vout03_p,vout03_n,vout10_p,vout10_n,vout11_p,vout11_n,vout12_p,vout12_n,vout13_p,vout13_n,vout20_p,vout20_n,vout21_p,vout21_n,vout22_p,vout22_n,vout23_p,vout23_n,vout30_p,vout30_n,vout31_p,vout31_n,vout32_p,vout32_n,vout33_p,vout33_n,s00_axis_tdata[255:0],s00_axis_tvalid,s00_axis_tready,s01_axis_tdata[255:0],s01_axis_tvalid,s01_axis_tready,s02_axis_tdata[255:0],s02_axis_tvalid,s02_axis_tready,s03_axis_tdata[255:0],s03_axis_tvalid,s03_axis_tready,s10_axis_tdata[255:0],s10_axis_tvalid,s10_axis_tready,s11_axis_tdata[255:0],s11_axis_tvalid,s11_axis_tready,s12_axis_tdata[255:0],s12_axis_tvalid,s12_axis_tready,s13_axis_tdata[255:0],s13_axis_tvalid,s13_axis_tready,s20_axis_tdata[255:0],s20_axis_tvalid,s20_axis_tready,s21_axis_tdata[255:0],s21_axis_tvalid,s21_axis_tready,s22_axis_tdata[255:0],s22_axis_tvalid,s22_axis_tready,s23_axis_tdata[255:0],s23_axis_tvalid,s23_axis_tready,s30_axis_tdata[255:0],s30_axis_tvalid,s30_axis_tready,s31_axis_tdata[255:0],s31_axis_tvalid,s31_axis_tready,s32_axis_tdata[255:0],s32_axis_tvalid,s32_axis_tready,s33_axis_tdata[255:0],s33_axis_tvalid,s33_axis_tready,irq";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "usp_rf_data_converter_v2_3_0,Vivado 2020.1.1";
begin
end;