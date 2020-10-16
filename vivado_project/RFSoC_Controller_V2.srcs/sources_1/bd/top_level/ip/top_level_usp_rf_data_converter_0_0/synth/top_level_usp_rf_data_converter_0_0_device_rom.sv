//----------------------------------------------------------------------------
// Title : ROM for tile configuration
// Project : Ultrascale+ RF Data Converter Subsystem
//----------------------------------------------------------------------------
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

`timescale 1ps/1ps

module top_level_usp_rf_data_converter_0_0_device_rom (
    aux_clk,
    data_index,
    data_out,
    addr_out,
    tile_out
  );

    input aux_clk;

    input [10:0] data_index;

    output [15:0] data_out;
    output [10:0] addr_out;
    output [2:0]  tile_out;

    reg [29:0] data;

    // The 30-bit data in the array follows the format below:
    // 29:27 |  26:24  |    23:16    |    15:0
    // Tile  |  Slice  | DRP Address |  DRP Data

    (* rom_style = "distributed" *) reg [29:0] data_array [0:608] = '{
       30'h07230000,  // Clock Network Control 0 (ADC0)
       30'h07240001,  // Clock Network Control 1(ADC0)
       30'h0717002e,  // PLL FB Div (ADC0)
       30'h070c00c1,  // PLL Output Divide (ADC0)
       30'h07100010,  // PLL Ref clock divide (ADC0)
       30'h07000080,  // PLL SDM CONFIG0 (ADC0)
       30'h07060111,  // PLL SDM seed (ADC0)
       30'h07070011,  // PLL SDM seed setup (ADC0)
       30'h070e0507,  // PLL ChargePump setup (ADC0)
       30'h0712ffff,  // PLL ChargePump setup (ADC0)
       30'h07137f9c,  // PLL loop filter setup (ADC0)
       30'h07140006,  // PLL loop filter setup (ADC0)
       30'h07155800,  // PLL VCO setup (ADC0)
       30'h07160008,  // PLL VCO setup (ADC0)
       30'h070a7a3e,  // PLL Coarse Frequency setup (ADC0)
       30'h070b7008,  // PLL Coarse Frequency setup (ADC0)
       30'h0711003d,  // PLL Voltage Regulator setup (ADC0)
       30'h072c0022,  // CLK_DIV (ADC0)
       30'h07280280,  // SYSREF Distribution (ADC0)
       30'h072dffc0,  // HSCOM_PWR_MASK (ADC0)
       30'h00020804,  // ADC00 Data Width
       30'h00100000,  // ADC00 Decimation Config
       30'h00110001,  // ADC00 Decimation Mode
       30'h00200000,  // ADC00 Mixer Config 0
       30'h00210924,  // ADC00 Mixer Config 1
       30'h003a0000,  // ADC00 Switch Matrix Config
       30'h007101c1,  // ADC00 RX MC Config 0
       30'h00518243,  // ADC00 TI_DCB_CTRL0
       30'h00559048,  // ADC00 TI_TIME_SKEW_CTRL0
       30'h0005000f,  // ADC00 FABRIC_IMR
       30'h000f00ff,  // ADC00 DATAPATH_IMR
       30'h000d00ff,  // ADC00 DECODER_IMR
       30'h00060008,  // ADC00 FABRIC_DEBUG
       30'h01020804,  // ADC01 Data Width
       30'h01100000,  // ADC01 Decimation Config
       30'h01110001,  // ADC01 Decimation Mode
       30'h01200000,  // ADC01 Mixer Config 0
       30'h01210924,  // ADC01 Mixer Config 1
       30'h013a0004,  // ADC01 Switch Matrix Config
       30'h017101c1,  // ADC01 RX MC Config 0
       30'h01518243,  // ADC01 TI_DCB_CTRL0
       30'h01559048,  // ADC01 TI_TIME_SKEW_CTRL0
       30'h0105000f,  // ADC01 FABRIC_IMR
       30'h010f00ff,  // ADC01 DATAPATH_IMR
       30'h010d00ff,  // ADC01 DECODER_IMR
       30'h01060008,  // ADC01 FABRIC_DEBUG
       30'h02020804,  // ADC02 Data Width
       30'h02100000,  // ADC02 Decimation Config
       30'h02110001,  // ADC02 Decimation Mode
       30'h02200000,  // ADC02 Mixer Config 0
       30'h02210924,  // ADC02 Mixer Config 1
       30'h023a0008,  // ADC02 Switch Matrix Config
       30'h027101c1,  // ADC02 RX MC Config 0
       30'h02518243,  // ADC02 TI_DCB_CTRL0
       30'h02559048,  // ADC02 TI_TIME_SKEW_CTRL0
       30'h0205000f,  // ADC02 FABRIC_IMR
       30'h020f00ff,  // ADC02 DATAPATH_IMR
       30'h020d00ff,  // ADC02 DECODER_IMR
       30'h02060008,  // ADC02 FABRIC_DEBUG
       30'h03020804,  // ADC03 Data Width
       30'h03100000,  // ADC03 Decimation Config
       30'h03110001,  // ADC03 Decimation Mode
       30'h03200000,  // ADC03 Mixer Config 0
       30'h03210924,  // ADC03 Mixer Config 1
       30'h033a000c,  // ADC03 Switch Matrix Config
       30'h037101c1,  // ADC03 RX MC Config 0
       30'h03518243,  // ADC03 TI_DCB_CTRL0
       30'h03559048,  // ADC03 TI_TIME_SKEW_CTRL0
       30'h0305000f,  // ADC03 FABRIC_IMR
       30'h030f00ff,  // ADC03 DATAPATH_IMR
       30'h030d00ff,  // ADC03 DECODER_IMR
       30'h03060008,  // ADC03 FABRIC_DEBUG
       30'h0f230000,  // Clock Network Control 0 (ADC1)
       30'h0f240001,  // Clock Network Control 1(ADC1)
       30'h0f17002e,  // PLL FB Div (ADC1)
       30'h0f0c00c1,  // PLL Output Divide (ADC1)
       30'h0f100010,  // PLL Ref clock divide (ADC1)
       30'h0f000080,  // PLL SDM CONFIG0 (ADC1)
       30'h0f060111,  // PLL SDM seed (ADC1)
       30'h0f070011,  // PLL SDM seed setup (ADC1)
       30'h0f0e0507,  // PLL ChargePump setup (ADC1)
       30'h0f12ffff,  // PLL ChargePump setup (ADC1)
       30'h0f137f9c,  // PLL loop filter setup (ADC1)
       30'h0f140006,  // PLL loop filter setup (ADC1)
       30'h0f155800,  // PLL VCO setup (ADC1)
       30'h0f160008,  // PLL VCO setup (ADC1)
       30'h0f0a7a3e,  // PLL Coarse Frequency setup (ADC1)
       30'h0f0b7008,  // PLL Coarse Frequency setup (ADC1)
       30'h0f11003d,  // PLL Voltage Regulator setup (ADC1)
       30'h0f2c0022,  // CLK_DIV (ADC1)
       30'h0f280600,  // SYSREF Distribution (ADC1)
       30'h0f2dffc0,  // HSCOM_PWR_MASK (ADC1)
       30'h08020804,  // ADC10 Data Width
       30'h08100000,  // ADC10 Decimation Config
       30'h08110001,  // ADC10 Decimation Mode
       30'h08200000,  // ADC10 Mixer Config 0
       30'h08210924,  // ADC10 Mixer Config 1
       30'h083a0000,  // ADC10 Switch Matrix Config
       30'h087101c1,  // ADC10 RX MC Config 0
       30'h08518243,  // ADC10 TI_DCB_CTRL0
       30'h08559048,  // ADC10 TI_TIME_SKEW_CTRL0
       30'h0805000f,  // ADC10 FABRIC_IMR
       30'h080f00ff,  // ADC10 DATAPATH_IMR
       30'h080d00ff,  // ADC10 DECODER_IMR
       30'h08060008,  // ADC10 FABRIC_DEBUG
       30'h09020804,  // ADC11 Data Width
       30'h09100000,  // ADC11 Decimation Config
       30'h09110001,  // ADC11 Decimation Mode
       30'h09200000,  // ADC11 Mixer Config 0
       30'h09210924,  // ADC11 Mixer Config 1
       30'h093a0004,  // ADC11 Switch Matrix Config
       30'h097101c1,  // ADC11 RX MC Config 0
       30'h09518243,  // ADC11 TI_DCB_CTRL0
       30'h09559048,  // ADC11 TI_TIME_SKEW_CTRL0
       30'h0905000f,  // ADC11 FABRIC_IMR
       30'h090f00ff,  // ADC11 DATAPATH_IMR
       30'h090d00ff,  // ADC11 DECODER_IMR
       30'h09060008,  // ADC11 FABRIC_DEBUG
       30'h0a020804,  // ADC12 Data Width
       30'h0a100000,  // ADC12 Decimation Config
       30'h0a110001,  // ADC12 Decimation Mode
       30'h0a200000,  // ADC12 Mixer Config 0
       30'h0a210924,  // ADC12 Mixer Config 1
       30'h0a3a0008,  // ADC12 Switch Matrix Config
       30'h0a7101c1,  // ADC12 RX MC Config 0
       30'h0a518243,  // ADC12 TI_DCB_CTRL0
       30'h0a559048,  // ADC12 TI_TIME_SKEW_CTRL0
       30'h0a05000f,  // ADC12 FABRIC_IMR
       30'h0a0f00ff,  // ADC12 DATAPATH_IMR
       30'h0a0d00ff,  // ADC12 DECODER_IMR
       30'h0a060008,  // ADC12 FABRIC_DEBUG
       30'h0b020804,  // ADC13 Data Width
       30'h0b100000,  // ADC13 Decimation Config
       30'h0b110001,  // ADC13 Decimation Mode
       30'h0b200000,  // ADC13 Mixer Config 0
       30'h0b210924,  // ADC13 Mixer Config 1
       30'h0b3a000c,  // ADC13 Switch Matrix Config
       30'h0b7101c1,  // ADC13 RX MC Config 0
       30'h0b518243,  // ADC13 TI_DCB_CTRL0
       30'h0b559048,  // ADC13 TI_TIME_SKEW_CTRL0
       30'h0b05000f,  // ADC13 FABRIC_IMR
       30'h0b0f00ff,  // ADC13 DATAPATH_IMR
       30'h0b0d00ff,  // ADC13 DECODER_IMR
       30'h0b060008,  // ADC13 FABRIC_DEBUG
       30'h17230000,  // Clock Network Control 0 (ADC2)
       30'h17240001,  // Clock Network Control 1(ADC2)
       30'h1717002e,  // PLL FB Div (ADC2)
       30'h170c00c1,  // PLL Output Divide (ADC2)
       30'h17100010,  // PLL Ref clock divide (ADC2)
       30'h17000080,  // PLL SDM CONFIG0 (ADC2)
       30'h17060111,  // PLL SDM seed (ADC2)
       30'h17070011,  // PLL SDM seed setup (ADC2)
       30'h170e0507,  // PLL ChargePump setup (ADC2)
       30'h1712ffff,  // PLL ChargePump setup (ADC2)
       30'h17137f9c,  // PLL loop filter setup (ADC2)
       30'h17140006,  // PLL loop filter setup (ADC2)
       30'h17155800,  // PLL VCO setup (ADC2)
       30'h17160008,  // PLL VCO setup (ADC2)
       30'h170a7a3e,  // PLL Coarse Frequency setup (ADC2)
       30'h170b7008,  // PLL Coarse Frequency setup (ADC2)
       30'h1711003d,  // PLL Voltage Regulator setup (ADC2)
       30'h172c0022,  // CLK_DIV (ADC2)
       30'h17288880,  // SYSREF Distribution (ADC2)
       30'h172dffc0,  // HSCOM_PWR_MASK (ADC2)
       30'h10020804,  // ADC20 Data Width
       30'h10100000,  // ADC20 Decimation Config
       30'h10110001,  // ADC20 Decimation Mode
       30'h10200000,  // ADC20 Mixer Config 0
       30'h10210924,  // ADC20 Mixer Config 1
       30'h103a0000,  // ADC20 Switch Matrix Config
       30'h107101c1,  // ADC20 RX MC Config 0
       30'h10518243,  // ADC20 TI_DCB_CTRL0
       30'h10559048,  // ADC20 TI_TIME_SKEW_CTRL0
       30'h1005000f,  // ADC20 FABRIC_IMR
       30'h100f00ff,  // ADC20 DATAPATH_IMR
       30'h100d00ff,  // ADC20 DECODER_IMR
       30'h10060008,  // ADC20 FABRIC_DEBUG
       30'h11020804,  // ADC21 Data Width
       30'h11100000,  // ADC21 Decimation Config
       30'h11110001,  // ADC21 Decimation Mode
       30'h11200000,  // ADC21 Mixer Config 0
       30'h11210924,  // ADC21 Mixer Config 1
       30'h113a0004,  // ADC21 Switch Matrix Config
       30'h117101c1,  // ADC21 RX MC Config 0
       30'h11518243,  // ADC21 TI_DCB_CTRL0
       30'h11559048,  // ADC21 TI_TIME_SKEW_CTRL0
       30'h1105000f,  // ADC21 FABRIC_IMR
       30'h110f00ff,  // ADC21 DATAPATH_IMR
       30'h110d00ff,  // ADC21 DECODER_IMR
       30'h11060008,  // ADC21 FABRIC_DEBUG
       30'h12020804,  // ADC22 Data Width
       30'h12100000,  // ADC22 Decimation Config
       30'h12110001,  // ADC22 Decimation Mode
       30'h12200000,  // ADC22 Mixer Config 0
       30'h12210924,  // ADC22 Mixer Config 1
       30'h123a0008,  // ADC22 Switch Matrix Config
       30'h127101c1,  // ADC22 RX MC Config 0
       30'h12518243,  // ADC22 TI_DCB_CTRL0
       30'h12559048,  // ADC22 TI_TIME_SKEW_CTRL0
       30'h1205000f,  // ADC22 FABRIC_IMR
       30'h120f00ff,  // ADC22 DATAPATH_IMR
       30'h120d00ff,  // ADC22 DECODER_IMR
       30'h12060008,  // ADC22 FABRIC_DEBUG
       30'h13020804,  // ADC23 Data Width
       30'h13100000,  // ADC23 Decimation Config
       30'h13110001,  // ADC23 Decimation Mode
       30'h13200000,  // ADC23 Mixer Config 0
       30'h13210924,  // ADC23 Mixer Config 1
       30'h133a000c,  // ADC23 Switch Matrix Config
       30'h137101c1,  // ADC23 RX MC Config 0
       30'h13518243,  // ADC23 TI_DCB_CTRL0
       30'h13559048,  // ADC23 TI_TIME_SKEW_CTRL0
       30'h1305000f,  // ADC23 FABRIC_IMR
       30'h130f00ff,  // ADC23 DATAPATH_IMR
       30'h130d00ff,  // ADC23 DECODER_IMR
       30'h13060008,  // ADC23 FABRIC_DEBUG
       30'h1f230000,  // Clock Network Control 0 (ADC3)
       30'h1f240001,  // Clock Network Control 1(ADC3)
       30'h1f17002e,  // PLL FB Div (ADC3)
       30'h1f0c00c1,  // PLL Output Divide (ADC3)
       30'h1f100010,  // PLL Ref clock divide (ADC3)
       30'h1f000080,  // PLL SDM CONFIG0 (ADC3)
       30'h1f060111,  // PLL SDM seed (ADC3)
       30'h1f070011,  // PLL SDM seed setup (ADC3)
       30'h1f0e0507,  // PLL ChargePump setup (ADC3)
       30'h1f12ffff,  // PLL ChargePump setup (ADC3)
       30'h1f137f9c,  // PLL loop filter setup (ADC3)
       30'h1f140006,  // PLL loop filter setup (ADC3)
       30'h1f155800,  // PLL VCO setup (ADC3)
       30'h1f160008,  // PLL VCO setup (ADC3)
       30'h1f0a7a3e,  // PLL Coarse Frequency setup (ADC3)
       30'h1f0b7008,  // PLL Coarse Frequency setup (ADC3)
       30'h1f11003d,  // PLL Voltage Regulator setup (ADC3)
       30'h1f2c0022,  // CLK_DIV (ADC3)
       30'h1f280700,  // SYSREF Distribution (ADC3)
       30'h1f2dffc0,  // HSCOM_PWR_MASK (ADC3)
       30'h18020804,  // ADC30 Data Width
       30'h18100000,  // ADC30 Decimation Config
       30'h18110001,  // ADC30 Decimation Mode
       30'h18200000,  // ADC30 Mixer Config 0
       30'h18210924,  // ADC30 Mixer Config 1
       30'h183a0000,  // ADC30 Switch Matrix Config
       30'h187101c1,  // ADC30 RX MC Config 0
       30'h18518243,  // ADC30 TI_DCB_CTRL0
       30'h18559048,  // ADC30 TI_TIME_SKEW_CTRL0
       30'h1805000f,  // ADC30 FABRIC_IMR
       30'h180f00ff,  // ADC30 DATAPATH_IMR
       30'h180d00ff,  // ADC30 DECODER_IMR
       30'h18060008,  // ADC30 FABRIC_DEBUG
       30'h19020804,  // ADC31 Data Width
       30'h19100000,  // ADC31 Decimation Config
       30'h19110001,  // ADC31 Decimation Mode
       30'h19200000,  // ADC31 Mixer Config 0
       30'h19210924,  // ADC31 Mixer Config 1
       30'h193a0004,  // ADC31 Switch Matrix Config
       30'h197101c1,  // ADC31 RX MC Config 0
       30'h19518243,  // ADC31 TI_DCB_CTRL0
       30'h19559048,  // ADC31 TI_TIME_SKEW_CTRL0
       30'h1905000f,  // ADC31 FABRIC_IMR
       30'h190f00ff,  // ADC31 DATAPATH_IMR
       30'h190d00ff,  // ADC31 DECODER_IMR
       30'h19060008,  // ADC31 FABRIC_DEBUG
       30'h1a020804,  // ADC32 Data Width
       30'h1a100000,  // ADC32 Decimation Config
       30'h1a110001,  // ADC32 Decimation Mode
       30'h1a200000,  // ADC32 Mixer Config 0
       30'h1a210924,  // ADC32 Mixer Config 1
       30'h1a3a0008,  // ADC32 Switch Matrix Config
       30'h1a7101c1,  // ADC32 RX MC Config 0
       30'h1a518243,  // ADC32 TI_DCB_CTRL0
       30'h1a559048,  // ADC32 TI_TIME_SKEW_CTRL0
       30'h1a05000f,  // ADC32 FABRIC_IMR
       30'h1a0f00ff,  // ADC32 DATAPATH_IMR
       30'h1a0d00ff,  // ADC32 DECODER_IMR
       30'h1a060008,  // ADC32 FABRIC_DEBUG
       30'h1b020804,  // ADC33 Data Width
       30'h1b100000,  // ADC33 Decimation Config
       30'h1b110001,  // ADC33 Decimation Mode
       30'h1b200000,  // ADC33 Mixer Config 0
       30'h1b210924,  // ADC33 Mixer Config 1
       30'h1b3a000c,  // ADC33 Switch Matrix Config
       30'h1b7101c1,  // ADC33 RX MC Config 0
       30'h1b518243,  // ADC33 TI_DCB_CTRL0
       30'h1b559048,  // ADC33 TI_TIME_SKEW_CTRL0
       30'h1b05000f,  // ADC33 FABRIC_IMR
       30'h1b0f00ff,  // ADC33 DATAPATH_IMR
       30'h1b0d00ff,  // ADC33 DECODER_IMR
       30'h1b060008,  // ADC33 FABRIC_DEBUG
       30'h27230000,  // Clock Network Control 0 (DAC0)
       30'h27240001,  // Clock Network Control 1 (DAC0)
       30'h2717002e,  // PLL FB Div (DAC0)
       30'h270c0081,  // PLL Output Divide (DAC0)
       30'h27100010,  // PLL Ref clock divide (DAC0)
       30'h27000080,  // PLL SDM CONFIG0 (DAC0)
       30'h27060111,  // PLL SDM seed (DAC0)
       30'h27070011,  // PLL SDM seed setup (DAC0)
       30'h270e0507,  // PLL ChargePump setup (DAC0)
       30'h2712ffff,  // PLL ChargePump setup (DAC0)
       30'h27137f9c,  // PLL loop filter setup (DAC0)
       30'h27140006,  // PLL loop filter setup (DAC0)
       30'h27155800,  // PLL VCO setup (DAC0)
       30'h27160008,  // PLL VCO setup (DAC0)
       30'h270a7a3e,  // PLL Coarse Frequency setup (DAC0)
       30'h270b7008,  // PLL Coarse Frequency setup (DAC0)
       30'h2711003d,  // PLL Voltage Regulator setup (DAC0)
       30'h272c0012,  // CLK_DIV (DAC0)
       30'h2728ca80,  // SYSREF Distribution (DAC0)
       30'h272dffc0,  // HSCOM_PWR_MASK (DAC0)
       30'h20020810,  // DAC00 Data Width
       30'h20100001,  // DAC00 Interpolation Control
       30'h20110000,  // DAC00 Interpolation Data
       30'h20200000,  // DAC00 Mixer Config 0
       30'h20210924,  // DAC00 Mixer Config 1
       30'h20300000,  // DAC00 Inv Sinc Filter
       30'h20310040,  // DAC00 Multiband Config
       30'h20600001,  // DAC00 Decoder Control
       30'h20610001,  // DAC00 Decoder Clock Enable
       30'h20710000,  // DAC00 MC_CONFIG0
       30'h20734858,  // DAC00 MC_CONFIG2
       30'h207487c0,  // DAC00 MC_CONFIG3
       30'h2006000f,  // DAC00 FABRIC_IMR
       30'h200f0fff,  // DAC00 DATAPATH_IMR
       30'h20070008,  // DAC00 FABRIC_DEBUG
       30'h21020810,  // DAC01 Data Width
       30'h21100001,  // DAC01 Interpolation Control
       30'h21110000,  // DAC01 Interpolation Data
       30'h21200000,  // DAC01 Mixer Config 0
       30'h21210924,  // DAC01 Mixer Config 1
       30'h21300000,  // DAC01 Inv Sinc Filter
       30'h21310040,  // DAC01 Multiband Config
       30'h21600001,  // DAC01 Decoder Control
       30'h21610001,  // DAC01 Decoder Clock Enable
       30'h21710000,  // DAC01 MC_CONFIG0
       30'h21734858,  // DAC01 MC_CONFIG2
       30'h217487c0,  // DAC01 MC_CONFIG3
       30'h2106000f,  // DAC01 FABRIC_IMR
       30'h210f0fff,  // DAC01 DATAPATH_IMR
       30'h21070008,  // DAC01 FABRIC_DEBUG
       30'h22020810,  // DAC02 Data Width
       30'h22100001,  // DAC02 Interpolation Control
       30'h22110000,  // DAC02 Interpolation Data
       30'h22200000,  // DAC02 Mixer Config 0
       30'h22210924,  // DAC02 Mixer Config 1
       30'h22300000,  // DAC02 Inv Sinc Filter
       30'h22310040,  // DAC02 Multiband Config
       30'h22600001,  // DAC02 Decoder Control
       30'h22610001,  // DAC02 Decoder Clock Enable
       30'h22710000,  // DAC02 MC_CONFIG0
       30'h22734858,  // DAC02 MC_CONFIG2
       30'h227487c0,  // DAC02 MC_CONFIG3
       30'h2206000f,  // DAC02 FABRIC_IMR
       30'h220f0fff,  // DAC02 DATAPATH_IMR
       30'h22070008,  // DAC02 FABRIC_DEBUG
       30'h23020810,  // DAC03 Data Width
       30'h23100001,  // DAC03 Interpolation Control
       30'h23110000,  // DAC03 Interpolation Data
       30'h23200000,  // DAC03 Mixer Config 0
       30'h23210924,  // DAC03 Mixer Config 1
       30'h23300000,  // DAC03 Inv Sinc Filter
       30'h23310040,  // DAC03 Multiband Config
       30'h23600001,  // DAC03 Decoder Control
       30'h23610001,  // DAC03 Decoder Clock Enable
       30'h23710000,  // DAC03 MC_CONFIG0
       30'h23734858,  // DAC03 MC_CONFIG2
       30'h237487c0,  // DAC03 MC_CONFIG3
       30'h2306000f,  // DAC03 FABRIC_IMR
       30'h230f0fff,  // DAC03 DATAPATH_IMR
       30'h23070008,  // DAC03 FABRIC_DEBUG
       30'h2f230000,  // Clock Network Control 0 (DAC1)
       30'h2f240001,  // Clock Network Control 1 (DAC1)
       30'h2f17002e,  // PLL FB Div (DAC1)
       30'h2f0c0081,  // PLL Output Divide (DAC1)
       30'h2f100010,  // PLL Ref clock divide (DAC1)
       30'h2f000080,  // PLL SDM CONFIG0 (DAC1)
       30'h2f060111,  // PLL SDM seed (DAC1)
       30'h2f070011,  // PLL SDM seed setup (DAC1)
       30'h2f0e0507,  // PLL ChargePump setup (DAC1)
       30'h2f12ffff,  // PLL ChargePump setup (DAC1)
       30'h2f137f9c,  // PLL loop filter setup (DAC1)
       30'h2f140006,  // PLL loop filter setup (DAC1)
       30'h2f155800,  // PLL VCO setup (DAC1)
       30'h2f160008,  // PLL VCO setup (DAC1)
       30'h2f0a7a3e,  // PLL Coarse Frequency setup (DAC1)
       30'h2f0b7008,  // PLL Coarse Frequency setup (DAC1)
       30'h2f11003d,  // PLL Voltage Regulator setup (DAC1)
       30'h2f2c0012,  // CLK_DIV (DAC1)
       30'h2f282400,  // SYSREF Distribution (DAC1)
       30'h2f2dffc0,  // HSCOM_PWR_MASK (DAC1)
       30'h28020810,  // DAC10 Data Width
       30'h28100001,  // DAC10 Interpolation Control
       30'h28110000,  // DAC10 Interpolation Data
       30'h28200000,  // DAC10 Mixer Config 0
       30'h28210924,  // DAC10 Mixer Config 1
       30'h28300000,  // DAC10 Inv Sinc Filter
       30'h28310040,  // DAC10 Multiband Config
       30'h28600001,  // DAC10 Decoder Control
       30'h28610001,  // DAC10 Decoder Clock Enable
       30'h28710000,  // DAC10 MC_CONFIG0
       30'h28734858,  // DAC10 MC_CONFIG2
       30'h287487c0,  // DAC10 MC_CONFIG3
       30'h2806000f,  // DAC10 FABRIC_IMR
       30'h280f0fff,  // DAC10 DATAPATH_IMR
       30'h28070008,  // DAC10 FABRIC_DEBUG
       30'h29020810,  // DAC11 Data Width
       30'h29100001,  // DAC11 Interpolation Control
       30'h29110000,  // DAC11 Interpolation Data
       30'h29200000,  // DAC11 Mixer Config 0
       30'h29210924,  // DAC11 Mixer Config 1
       30'h29300000,  // DAC11 Inv Sinc Filter
       30'h29310040,  // DAC11 Multiband Config
       30'h29600001,  // DAC11 Decoder Control
       30'h29610001,  // DAC11 Decoder Clock Enable
       30'h29710000,  // DAC11 MC_CONFIG0
       30'h29734858,  // DAC11 MC_CONFIG2
       30'h297487c0,  // DAC11 MC_CONFIG3
       30'h2906000f,  // DAC11 FABRIC_IMR
       30'h290f0fff,  // DAC11 DATAPATH_IMR
       30'h29070008,  // DAC11 FABRIC_DEBUG
       30'h2a020810,  // DAC12 Data Width
       30'h2a100001,  // DAC12 Interpolation Control
       30'h2a110000,  // DAC12 Interpolation Data
       30'h2a200000,  // DAC12 Mixer Config 0
       30'h2a210924,  // DAC12 Mixer Config 1
       30'h2a300000,  // DAC12 Inv Sinc Filter
       30'h2a310040,  // DAC12 Multiband Config
       30'h2a600001,  // DAC12 Decoder Control
       30'h2a610001,  // DAC12 Decoder Clock Enable
       30'h2a710000,  // DAC12 MC_CONFIG0
       30'h2a734858,  // DAC12 MC_CONFIG2
       30'h2a7487c0,  // DAC12 MC_CONFIG3
       30'h2a06000f,  // DAC12 FABRIC_IMR
       30'h2a0f0fff,  // DAC12 DATAPATH_IMR
       30'h2a070008,  // DAC12 FABRIC_DEBUG
       30'h2b020810,  // DAC13 Data Width
       30'h2b100001,  // DAC13 Interpolation Control
       30'h2b110000,  // DAC13 Interpolation Data
       30'h2b200000,  // DAC13 Mixer Config 0
       30'h2b210924,  // DAC13 Mixer Config 1
       30'h2b300000,  // DAC13 Inv Sinc Filter
       30'h2b310040,  // DAC13 Multiband Config
       30'h2b600001,  // DAC13 Decoder Control
       30'h2b610001,  // DAC13 Decoder Clock Enable
       30'h2b710000,  // DAC13 MC_CONFIG0
       30'h2b734858,  // DAC13 MC_CONFIG2
       30'h2b7487c0,  // DAC13 MC_CONFIG3
       30'h2b06000f,  // DAC13 FABRIC_IMR
       30'h2b0f0fff,  // DAC13 DATAPATH_IMR
       30'h2b070008,  // DAC13 FABRIC_DEBUG
       30'h37230000,  // Clock Network Control 0 (DAC2)
       30'h37240001,  // Clock Network Control 1 (DAC2)
       30'h3717002e,  // PLL FB Div (DAC2)
       30'h370c0081,  // PLL Output Divide (DAC2)
       30'h37100010,  // PLL Ref clock divide (DAC2)
       30'h37000080,  // PLL SDM CONFIG0 (DAC2)
       30'h37060111,  // PLL SDM seed (DAC2)
       30'h37070011,  // PLL SDM seed setup (DAC2)
       30'h370e0507,  // PLL ChargePump setup (DAC2)
       30'h3712ffff,  // PLL ChargePump setup (DAC2)
       30'h37137f9c,  // PLL loop filter setup (DAC2)
       30'h37140006,  // PLL loop filter setup (DAC2)
       30'h37155800,  // PLL VCO setup (DAC2)
       30'h37160008,  // PLL VCO setup (DAC2)
       30'h370a7a3e,  // PLL Coarse Frequency setup (DAC2)
       30'h370b7008,  // PLL Coarse Frequency setup (DAC2)
       30'h3711003d,  // PLL Voltage Regulator setup (DAC2)
       30'h372c0012,  // CLK_DIV (DAC2)
       30'h37280980,  // SYSREF Distribution (DAC2)
       30'h372dffc0,  // HSCOM_PWR_MASK (DAC2)
       30'h30020810,  // DAC20 Data Width
       30'h30100001,  // DAC20 Interpolation Control
       30'h30110000,  // DAC20 Interpolation Data
       30'h30200000,  // DAC20 Mixer Config 0
       30'h30210924,  // DAC20 Mixer Config 1
       30'h30300000,  // DAC20 Inv Sinc Filter
       30'h30310040,  // DAC20 Multiband Config
       30'h30600001,  // DAC20 Decoder Control
       30'h30610001,  // DAC20 Decoder Clock Enable
       30'h30710000,  // DAC20 MC_CONFIG0
       30'h30734858,  // DAC20 MC_CONFIG2
       30'h307487c0,  // DAC20 MC_CONFIG3
       30'h3006000f,  // DAC20 FABRIC_IMR
       30'h300f0fff,  // DAC20 DATAPATH_IMR
       30'h30070008,  // DAC20 FABRIC_DEBUG
       30'h31020810,  // DAC21 Data Width
       30'h31100001,  // DAC21 Interpolation Control
       30'h31110000,  // DAC21 Interpolation Data
       30'h31200000,  // DAC21 Mixer Config 0
       30'h31210924,  // DAC21 Mixer Config 1
       30'h31300000,  // DAC21 Inv Sinc Filter
       30'h31310040,  // DAC21 Multiband Config
       30'h31600001,  // DAC21 Decoder Control
       30'h31610001,  // DAC21 Decoder Clock Enable
       30'h31710000,  // DAC21 MC_CONFIG0
       30'h31734858,  // DAC21 MC_CONFIG2
       30'h317487c0,  // DAC21 MC_CONFIG3
       30'h3106000f,  // DAC21 FABRIC_IMR
       30'h310f0fff,  // DAC21 DATAPATH_IMR
       30'h31070008,  // DAC21 FABRIC_DEBUG
       30'h32020810,  // DAC22 Data Width
       30'h32100001,  // DAC22 Interpolation Control
       30'h32110000,  // DAC22 Interpolation Data
       30'h32200000,  // DAC22 Mixer Config 0
       30'h32210924,  // DAC22 Mixer Config 1
       30'h32300000,  // DAC22 Inv Sinc Filter
       30'h32310040,  // DAC22 Multiband Config
       30'h32600001,  // DAC22 Decoder Control
       30'h32610001,  // DAC22 Decoder Clock Enable
       30'h32710000,  // DAC22 MC_CONFIG0
       30'h32734858,  // DAC22 MC_CONFIG2
       30'h327487c0,  // DAC22 MC_CONFIG3
       30'h3206000f,  // DAC22 FABRIC_IMR
       30'h320f0fff,  // DAC22 DATAPATH_IMR
       30'h32070008,  // DAC22 FABRIC_DEBUG
       30'h33020810,  // DAC23 Data Width
       30'h33100001,  // DAC23 Interpolation Control
       30'h33110000,  // DAC23 Interpolation Data
       30'h33200000,  // DAC23 Mixer Config 0
       30'h33210924,  // DAC23 Mixer Config 1
       30'h33300000,  // DAC23 Inv Sinc Filter
       30'h33310040,  // DAC23 Multiband Config
       30'h33600001,  // DAC23 Decoder Control
       30'h33610001,  // DAC23 Decoder Clock Enable
       30'h33710000,  // DAC23 MC_CONFIG0
       30'h33734858,  // DAC23 MC_CONFIG2
       30'h337487c0,  // DAC23 MC_CONFIG3
       30'h3306000f,  // DAC23 FABRIC_IMR
       30'h330f0fff,  // DAC23 DATAPATH_IMR
       30'h33070008,  // DAC23 FABRIC_DEBUG
       30'h3f230000,  // Clock Network Control 0 (DAC3)
       30'h3f240001,  // Clock Network Control 1 (DAC3)
       30'h3f17002e,  // PLL FB Div (DAC3)
       30'h3f0c0081,  // PLL Output Divide (DAC3)
       30'h3f100010,  // PLL Ref clock divide (DAC3)
       30'h3f000080,  // PLL SDM CONFIG0 (DAC3)
       30'h3f060111,  // PLL SDM seed (DAC3)
       30'h3f070011,  // PLL SDM seed setup (DAC3)
       30'h3f0e0507,  // PLL ChargePump setup (DAC3)
       30'h3f12ffff,  // PLL ChargePump setup (DAC3)
       30'h3f137f9c,  // PLL loop filter setup (DAC3)
       30'h3f140006,  // PLL loop filter setup (DAC3)
       30'h3f155800,  // PLL VCO setup (DAC3)
       30'h3f160008,  // PLL VCO setup (DAC3)
       30'h3f0a7a3e,  // PLL Coarse Frequency setup (DAC3)
       30'h3f0b7008,  // PLL Coarse Frequency setup (DAC3)
       30'h3f11003d,  // PLL Voltage Regulator setup (DAC3)
       30'h3f2c0012,  // CLK_DIV (DAC3)
       30'h3f280100,  // SYSREF Distribution (DAC3)
       30'h3f2dffc0,  // HSCOM_PWR_MASK (DAC3)
       30'h38020810,  // DAC30 Data Width
       30'h38100001,  // DAC30 Interpolation Control
       30'h38110000,  // DAC30 Interpolation Data
       30'h38200000,  // DAC30 Mixer Config 0
       30'h38210924,  // DAC30 Mixer Config 1
       30'h38300000,  // DAC30 Inv Sinc Filter
       30'h38310040,  // DAC30 Multiband Config
       30'h38600001,  // DAC30 Decoder Control
       30'h38610001,  // DAC30 Decoder Clock Enable
       30'h38710000,  // DAC30 MC_CONFIG0
       30'h38734858,  // DAC30 MC_CONFIG2
       30'h387487c0,  // DAC30 MC_CONFIG3
       30'h3806000f,  // DAC30 FABRIC_IMR
       30'h380f0fff,  // DAC30 DATAPATH_IMR
       30'h38070008,  // DAC30 FABRIC_DEBUG
       30'h39020810,  // DAC31 Data Width
       30'h39100001,  // DAC31 Interpolation Control
       30'h39110000,  // DAC31 Interpolation Data
       30'h39200000,  // DAC31 Mixer Config 0
       30'h39210924,  // DAC31 Mixer Config 1
       30'h39300000,  // DAC31 Inv Sinc Filter
       30'h39310040,  // DAC31 Multiband Config
       30'h39600001,  // DAC31 Decoder Control
       30'h39610001,  // DAC31 Decoder Clock Enable
       30'h39710000,  // DAC31 MC_CONFIG0
       30'h39734858,  // DAC31 MC_CONFIG2
       30'h397487c0,  // DAC31 MC_CONFIG3
       30'h3906000f,  // DAC31 FABRIC_IMR
       30'h390f0fff,  // DAC31 DATAPATH_IMR
       30'h39070008,  // DAC31 FABRIC_DEBUG
       30'h3a020810,  // DAC32 Data Width
       30'h3a100001,  // DAC32 Interpolation Control
       30'h3a110000,  // DAC32 Interpolation Data
       30'h3a200000,  // DAC32 Mixer Config 0
       30'h3a210924,  // DAC32 Mixer Config 1
       30'h3a300000,  // DAC32 Inv Sinc Filter
       30'h3a310040,  // DAC32 Multiband Config
       30'h3a600001,  // DAC32 Decoder Control
       30'h3a610001,  // DAC32 Decoder Clock Enable
       30'h3a710000,  // DAC32 MC_CONFIG0
       30'h3a734858,  // DAC32 MC_CONFIG2
       30'h3a7487c0,  // DAC32 MC_CONFIG3
       30'h3a06000f,  // DAC32 FABRIC_IMR
       30'h3a0f0fff,  // DAC32 DATAPATH_IMR
       30'h3a070008,  // DAC32 FABRIC_DEBUG
       30'h3b020810,  // DAC33 Data Width
       30'h3b100001,  // DAC33 Interpolation Control
       30'h3b110000,  // DAC33 Interpolation Data
       30'h3b200000,  // DAC33 Mixer Config 0
       30'h3b210924,  // DAC33 Mixer Config 1
       30'h3b300000,  // DAC33 Inv Sinc Filter
       30'h3b310040,  // DAC33 Multiband Config
       30'h3b600001,  // DAC33 Decoder Control
       30'h3b610001,  // DAC33 Decoder Clock Enable
       30'h3b710000,  // DAC33 MC_CONFIG0
       30'h3b734858,  // DAC33 MC_CONFIG2
       30'h3b7487c0,  // DAC33 MC_CONFIG3
       30'h3b06000f,  // DAC33 FABRIC_IMR
       30'h3b0f0fff,  // DAC33 DATAPATH_IMR
       30'h3b070008,  // DAC33 FABRIC_DEBUG
       30'h00000000};

    //-------------------------------------------------------------------------
    // Output the tile number, address and data for the DRP writes
    // depending on the data_index input
    //-------------------------------------------------------------------------
    always @(posedge aux_clk)
    begin
      data <= data_array[data_index];
    end

    assign data_out = data[15:0];
    assign addr_out = data[26:16];
    assign tile_out = data[29:27];

endmodule
