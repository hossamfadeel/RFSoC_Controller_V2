-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1.1 (win64) Build 2960000 Wed Aug  5 22:57:20 MDT 2020
-- Date        : Wed Oct 14 09:01:19 2020
-- Host        : JAMES-LENOVO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/repos/RFSoC_Controller_V2/vivado_project/RFSoC_Controller_V2.srcs/sources_1/bd/top_level/ip/top_level_gpio_buffer_0_0/top_level_gpio_buffer_0_0_stub.vhdl
-- Design      : top_level_gpio_buffer_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu29dr-ffvf1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_gpio_buffer_0_0 is
  Port ( 
    gpio_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gpio_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC
  );

end top_level_gpio_buffer_0_0;

architecture stub of top_level_gpio_buffer_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "gpio_in[15:0],gpio_out[15:0],s_axis_tvalid,s_axis_tready,s_axis_tdata[15:0],m_axis_tdata[15:0],m_axis_tvalid,m_axis_tready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "gpio_buffer,Vivado 2020.1.1";
begin
end;