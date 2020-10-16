-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1.1 (win64) Build 2960000 Wed Aug  5 22:57:20 MDT 2020
-- Date        : Wed Oct 14 08:12:33 2020
-- Host        : JAMES-LENOVO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/repos/RFSoC_Controller_V2/vivado_project/RFSoC_Controller_V2.srcs/sources_1/bd/top_level/ip/top_level_rfsoc_pl_ctrl_verilo_0_0/top_level_rfsoc_pl_ctrl_verilo_0_0_stub.vhdl
-- Design      : top_level_rfsoc_pl_ctrl_verilo_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_rfsoc_pl_ctrl_verilo_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    gpio_ctrl : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    m16_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m16_axis_tvalid : out STD_LOGIC;
    m16_axis_tready : in STD_LOGIC;
    m0_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m0_axis_tvalid : out STD_LOGIC;
    m0_axis_tready : in STD_LOGIC;
    m1_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m1_axis_tvalid : out STD_LOGIC;
    m1_axis_tready : in STD_LOGIC;
    m2_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m2_axis_tvalid : out STD_LOGIC;
    m2_axis_tready : in STD_LOGIC;
    m3_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m3_axis_tvalid : out STD_LOGIC;
    m3_axis_tready : in STD_LOGIC;
    m4_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m4_axis_tvalid : out STD_LOGIC;
    m4_axis_tready : in STD_LOGIC;
    m5_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m5_axis_tvalid : out STD_LOGIC;
    m5_axis_tready : in STD_LOGIC;
    m6_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m6_axis_tvalid : out STD_LOGIC;
    m6_axis_tready : in STD_LOGIC;
    m7_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m7_axis_tvalid : out STD_LOGIC;
    m7_axis_tready : in STD_LOGIC;
    m8_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m8_axis_tvalid : out STD_LOGIC;
    m8_axis_tready : in STD_LOGIC;
    m9_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m9_axis_tvalid : out STD_LOGIC;
    m9_axis_tready : in STD_LOGIC;
    m10_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m10_axis_tvalid : out STD_LOGIC;
    m10_axis_tready : in STD_LOGIC;
    m11_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m11_axis_tvalid : out STD_LOGIC;
    m11_axis_tready : in STD_LOGIC;
    m12_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m12_axis_tvalid : out STD_LOGIC;
    m12_axis_tready : in STD_LOGIC;
    m13_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m13_axis_tvalid : out STD_LOGIC;
    m13_axis_tready : in STD_LOGIC;
    m14_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m14_axis_tvalid : out STD_LOGIC;
    m14_axis_tready : in STD_LOGIC;
    m15_axis_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m15_axis_tvalid : out STD_LOGIC;
    m15_axis_tready : in STD_LOGIC;
    s0_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s0_axis_tvalid : in STD_LOGIC;
    s0_axis_tready : out STD_LOGIC;
    s1_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s1_axis_tvalid : in STD_LOGIC;
    s1_axis_tready : out STD_LOGIC;
    s2_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s2_axis_tvalid : in STD_LOGIC;
    s2_axis_tready : out STD_LOGIC;
    s3_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s3_axis_tvalid : in STD_LOGIC;
    s3_axis_tready : out STD_LOGIC;
    s4_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s4_axis_tvalid : in STD_LOGIC;
    s4_axis_tready : out STD_LOGIC;
    s5_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s5_axis_tvalid : in STD_LOGIC;
    s5_axis_tready : out STD_LOGIC;
    s6_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s6_axis_tvalid : in STD_LOGIC;
    s6_axis_tready : out STD_LOGIC;
    s7_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s7_axis_tvalid : in STD_LOGIC;
    s7_axis_tready : out STD_LOGIC;
    s8_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s8_axis_tvalid : in STD_LOGIC;
    s8_axis_tready : out STD_LOGIC;
    s9_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s9_axis_tvalid : in STD_LOGIC;
    s9_axis_tready : out STD_LOGIC;
    s10_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s10_axis_tvalid : in STD_LOGIC;
    s10_axis_tready : out STD_LOGIC;
    s11_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s11_axis_tvalid : in STD_LOGIC;
    s11_axis_tready : out STD_LOGIC;
    s12_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s12_axis_tvalid : in STD_LOGIC;
    s12_axis_tready : out STD_LOGIC;
    s13_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s13_axis_tvalid : in STD_LOGIC;
    s13_axis_tready : out STD_LOGIC;
    s14_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s14_axis_tvalid : in STD_LOGIC;
    s14_axis_tready : out STD_LOGIC;
    s15_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s15_axis_tvalid : in STD_LOGIC;
    s15_axis_tready : out STD_LOGIC
  );

end top_level_rfsoc_pl_ctrl_verilo_0_0;

architecture stub of top_level_rfsoc_pl_ctrl_verilo_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,gpio_ctrl[15:0],s_axis_tdata[31:0],s_axis_tvalid,s_axis_tready,m16_axis_tdata[31:0],m16_axis_tvalid,m16_axis_tready,m0_axis_tdata[255:0],m0_axis_tvalid,m0_axis_tready,m1_axis_tdata[255:0],m1_axis_tvalid,m1_axis_tready,m2_axis_tdata[255:0],m2_axis_tvalid,m2_axis_tready,m3_axis_tdata[255:0],m3_axis_tvalid,m3_axis_tready,m4_axis_tdata[255:0],m4_axis_tvalid,m4_axis_tready,m5_axis_tdata[255:0],m5_axis_tvalid,m5_axis_tready,m6_axis_tdata[255:0],m6_axis_tvalid,m6_axis_tready,m7_axis_tdata[255:0],m7_axis_tvalid,m7_axis_tready,m8_axis_tdata[255:0],m8_axis_tvalid,m8_axis_tready,m9_axis_tdata[255:0],m9_axis_tvalid,m9_axis_tready,m10_axis_tdata[255:0],m10_axis_tvalid,m10_axis_tready,m11_axis_tdata[255:0],m11_axis_tvalid,m11_axis_tready,m12_axis_tdata[255:0],m12_axis_tvalid,m12_axis_tready,m13_axis_tdata[255:0],m13_axis_tvalid,m13_axis_tready,m14_axis_tdata[255:0],m14_axis_tvalid,m14_axis_tready,m15_axis_tdata[255:0],m15_axis_tvalid,m15_axis_tready,s0_axis_tdata[127:0],s0_axis_tvalid,s0_axis_tready,s1_axis_tdata[127:0],s1_axis_tvalid,s1_axis_tready,s2_axis_tdata[127:0],s2_axis_tvalid,s2_axis_tready,s3_axis_tdata[127:0],s3_axis_tvalid,s3_axis_tready,s4_axis_tdata[127:0],s4_axis_tvalid,s4_axis_tready,s5_axis_tdata[127:0],s5_axis_tvalid,s5_axis_tready,s6_axis_tdata[127:0],s6_axis_tvalid,s6_axis_tready,s7_axis_tdata[127:0],s7_axis_tvalid,s7_axis_tready,s8_axis_tdata[127:0],s8_axis_tvalid,s8_axis_tready,s9_axis_tdata[127:0],s9_axis_tvalid,s9_axis_tready,s10_axis_tdata[127:0],s10_axis_tvalid,s10_axis_tready,s11_axis_tdata[127:0],s11_axis_tvalid,s11_axis_tready,s12_axis_tdata[127:0],s12_axis_tvalid,s12_axis_tready,s13_axis_tdata[127:0],s13_axis_tvalid,s13_axis_tready,s14_axis_tdata[127:0],s14_axis_tvalid,s14_axis_tready,s15_axis_tdata[127:0],s15_axis_tvalid,s15_axis_tready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rfsoc_pl_ctrl_verilog_wrapper,Vivado 2020.1.1";
begin
end;
