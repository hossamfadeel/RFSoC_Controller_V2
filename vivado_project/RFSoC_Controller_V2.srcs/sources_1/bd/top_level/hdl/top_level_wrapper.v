//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1.1 (win64) Build 2960000 Wed Aug  5 22:57:20 MDT 2020
//Date        : Fri Oct 23 07:37:18 2020
//Host        : JAMES-LENOVO running 64-bit major release  (build 9200)
//Command     : generate_target top_level_wrapper.bd
//Design      : top_level_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module top_level_wrapper
   (adc0_clk_clk_n,
    adc0_clk_clk_p,
    adc1_clk_clk_n,
    adc1_clk_clk_p,
    adc2_clk_clk_n,
    adc2_clk_clk_p,
    adc3_clk_clk_n,
    adc3_clk_clk_p,
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
  input adc0_clk_clk_n;
  input adc0_clk_clk_p;
  input adc1_clk_clk_n;
  input adc1_clk_clk_p;
  input adc2_clk_clk_n;
  input adc2_clk_clk_p;
  input adc3_clk_clk_n;
  input adc3_clk_clk_p;
  input dac0_clk_clk_n;
  input dac0_clk_clk_p;
  input dac1_clk_clk_n;
  input dac1_clk_clk_p;
  input dac2_clk_clk_n;
  input dac2_clk_clk_p;
  input dac3_clk_clk_n;
  input dac3_clk_clk_p;
  input sysref_in_diff_n;
  input sysref_in_diff_p;
  input vin00_v_n;
  input vin00_v_p;
  input vin01_v_n;
  input vin01_v_p;
  input vin02_v_n;
  input vin02_v_p;
  input vin03_v_n;
  input vin03_v_p;
  input vin10_v_n;
  input vin10_v_p;
  input vin11_v_n;
  input vin11_v_p;
  input vin12_v_n;
  input vin12_v_p;
  input vin13_v_n;
  input vin13_v_p;
  input vin20_v_n;
  input vin20_v_p;
  input vin21_v_n;
  input vin21_v_p;
  input vin22_v_n;
  input vin22_v_p;
  input vin23_v_n;
  input vin23_v_p;
  input vin30_v_n;
  input vin30_v_p;
  input vin31_v_n;
  input vin31_v_p;
  input vin32_v_n;
  input vin32_v_p;
  input vin33_v_n;
  input vin33_v_p;
  output vout00_v_n;
  output vout00_v_p;
  output vout01_v_n;
  output vout01_v_p;
  output vout02_v_n;
  output vout02_v_p;
  output vout03_v_n;
  output vout03_v_p;
  output vout10_v_n;
  output vout10_v_p;
  output vout11_v_n;
  output vout11_v_p;
  output vout12_v_n;
  output vout12_v_p;
  output vout13_v_n;
  output vout13_v_p;
  output vout20_v_n;
  output vout20_v_p;
  output vout21_v_n;
  output vout21_v_p;
  output vout22_v_n;
  output vout22_v_p;
  output vout23_v_n;
  output vout23_v_p;
  output vout30_v_n;
  output vout30_v_p;
  output vout31_v_n;
  output vout31_v_p;
  output vout32_v_n;
  output vout32_v_p;
  output vout33_v_n;
  output vout33_v_p;

  wire adc0_clk_clk_n;
  wire adc0_clk_clk_p;
  wire adc1_clk_clk_n;
  wire adc1_clk_clk_p;
  wire adc2_clk_clk_n;
  wire adc2_clk_clk_p;
  wire adc3_clk_clk_n;
  wire adc3_clk_clk_p;
  wire dac0_clk_clk_n;
  wire dac0_clk_clk_p;
  wire dac1_clk_clk_n;
  wire dac1_clk_clk_p;
  wire dac2_clk_clk_n;
  wire dac2_clk_clk_p;
  wire dac3_clk_clk_n;
  wire dac3_clk_clk_p;
  wire sysref_in_diff_n;
  wire sysref_in_diff_p;
  wire vin00_v_n;
  wire vin00_v_p;
  wire vin01_v_n;
  wire vin01_v_p;
  wire vin02_v_n;
  wire vin02_v_p;
  wire vin03_v_n;
  wire vin03_v_p;
  wire vin10_v_n;
  wire vin10_v_p;
  wire vin11_v_n;
  wire vin11_v_p;
  wire vin12_v_n;
  wire vin12_v_p;
  wire vin13_v_n;
  wire vin13_v_p;
  wire vin20_v_n;
  wire vin20_v_p;
  wire vin21_v_n;
  wire vin21_v_p;
  wire vin22_v_n;
  wire vin22_v_p;
  wire vin23_v_n;
  wire vin23_v_p;
  wire vin30_v_n;
  wire vin30_v_p;
  wire vin31_v_n;
  wire vin31_v_p;
  wire vin32_v_n;
  wire vin32_v_p;
  wire vin33_v_n;
  wire vin33_v_p;
  wire vout00_v_n;
  wire vout00_v_p;
  wire vout01_v_n;
  wire vout01_v_p;
  wire vout02_v_n;
  wire vout02_v_p;
  wire vout03_v_n;
  wire vout03_v_p;
  wire vout10_v_n;
  wire vout10_v_p;
  wire vout11_v_n;
  wire vout11_v_p;
  wire vout12_v_n;
  wire vout12_v_p;
  wire vout13_v_n;
  wire vout13_v_p;
  wire vout20_v_n;
  wire vout20_v_p;
  wire vout21_v_n;
  wire vout21_v_p;
  wire vout22_v_n;
  wire vout22_v_p;
  wire vout23_v_n;
  wire vout23_v_p;
  wire vout30_v_n;
  wire vout30_v_p;
  wire vout31_v_n;
  wire vout31_v_p;
  wire vout32_v_n;
  wire vout32_v_p;
  wire vout33_v_n;
  wire vout33_v_p;

  top_level top_level_i
       (.adc0_clk_clk_n(adc0_clk_clk_n),
        .adc0_clk_clk_p(adc0_clk_clk_p),
        .adc1_clk_clk_n(adc1_clk_clk_n),
        .adc1_clk_clk_p(adc1_clk_clk_p),
        .adc2_clk_clk_n(adc2_clk_clk_n),
        .adc2_clk_clk_p(adc2_clk_clk_p),
        .adc3_clk_clk_n(adc3_clk_clk_n),
        .adc3_clk_clk_p(adc3_clk_clk_p),
        .dac0_clk_clk_n(dac0_clk_clk_n),
        .dac0_clk_clk_p(dac0_clk_clk_p),
        .dac1_clk_clk_n(dac1_clk_clk_n),
        .dac1_clk_clk_p(dac1_clk_clk_p),
        .dac2_clk_clk_n(dac2_clk_clk_n),
        .dac2_clk_clk_p(dac2_clk_clk_p),
        .dac3_clk_clk_n(dac3_clk_clk_n),
        .dac3_clk_clk_p(dac3_clk_clk_p),
        .sysref_in_diff_n(sysref_in_diff_n),
        .sysref_in_diff_p(sysref_in_diff_p),
        .vin00_v_n(vin00_v_n),
        .vin00_v_p(vin00_v_p),
        .vin01_v_n(vin01_v_n),
        .vin01_v_p(vin01_v_p),
        .vin02_v_n(vin02_v_n),
        .vin02_v_p(vin02_v_p),
        .vin03_v_n(vin03_v_n),
        .vin03_v_p(vin03_v_p),
        .vin10_v_n(vin10_v_n),
        .vin10_v_p(vin10_v_p),
        .vin11_v_n(vin11_v_n),
        .vin11_v_p(vin11_v_p),
        .vin12_v_n(vin12_v_n),
        .vin12_v_p(vin12_v_p),
        .vin13_v_n(vin13_v_n),
        .vin13_v_p(vin13_v_p),
        .vin20_v_n(vin20_v_n),
        .vin20_v_p(vin20_v_p),
        .vin21_v_n(vin21_v_n),
        .vin21_v_p(vin21_v_p),
        .vin22_v_n(vin22_v_n),
        .vin22_v_p(vin22_v_p),
        .vin23_v_n(vin23_v_n),
        .vin23_v_p(vin23_v_p),
        .vin30_v_n(vin30_v_n),
        .vin30_v_p(vin30_v_p),
        .vin31_v_n(vin31_v_n),
        .vin31_v_p(vin31_v_p),
        .vin32_v_n(vin32_v_n),
        .vin32_v_p(vin32_v_p),
        .vin33_v_n(vin33_v_n),
        .vin33_v_p(vin33_v_p),
        .vout00_v_n(vout00_v_n),
        .vout00_v_p(vout00_v_p),
        .vout01_v_n(vout01_v_n),
        .vout01_v_p(vout01_v_p),
        .vout02_v_n(vout02_v_n),
        .vout02_v_p(vout02_v_p),
        .vout03_v_n(vout03_v_n),
        .vout03_v_p(vout03_v_p),
        .vout10_v_n(vout10_v_n),
        .vout10_v_p(vout10_v_p),
        .vout11_v_n(vout11_v_n),
        .vout11_v_p(vout11_v_p),
        .vout12_v_n(vout12_v_n),
        .vout12_v_p(vout12_v_p),
        .vout13_v_n(vout13_v_n),
        .vout13_v_p(vout13_v_p),
        .vout20_v_n(vout20_v_n),
        .vout20_v_p(vout20_v_p),
        .vout21_v_n(vout21_v_n),
        .vout21_v_p(vout21_v_p),
        .vout22_v_n(vout22_v_n),
        .vout22_v_p(vout22_v_p),
        .vout23_v_n(vout23_v_n),
        .vout23_v_p(vout23_v_p),
        .vout30_v_n(vout30_v_n),
        .vout30_v_p(vout30_v_p),
        .vout31_v_n(vout31_v_n),
        .vout31_v_p(vout31_v_p),
        .vout32_v_n(vout32_v_n),
        .vout32_v_p(vout32_v_p),
        .vout33_v_n(vout33_v_n),
        .vout33_v_p(vout33_v_p));
endmodule
