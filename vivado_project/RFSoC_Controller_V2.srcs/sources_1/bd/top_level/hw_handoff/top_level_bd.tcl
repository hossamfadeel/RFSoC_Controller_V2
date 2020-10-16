
################################################################
# This is a generated script based on design: top_level
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source top_level_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# gpio_buffer, rfsoc_pl_ctrl_verilog_wrapper

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xczu29dr-ffvf1760-2-e
   set_property BOARD_PART xilinx.com:zcu1275:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name top_level

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set adc0_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc0_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
   ] $adc0_clk

  set adc1_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc1_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
   ] $adc1_clk

  set adc2_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc2_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
   ] $adc2_clk

  set adc3_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 adc3_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
   ] $adc3_clk

  set dac0_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac0_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
   ] $dac0_clk

  set dac1_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac1_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
   ] $dac1_clk

  set dac2_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac2_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
   ] $dac2_clk

  set dac3_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 dac3_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
   ] $dac3_clk

  set sysref_in [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_usp_rf_data_converter:diff_pins_rtl:1.0 sysref_in ]

  set vin00 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin00 ]

  set vin01 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin01 ]

  set vin02 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin02 ]

  set vin03 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin03 ]

  set vin10 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin10 ]

  set vin11 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin11 ]

  set vin12 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin12 ]

  set vin13 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin13 ]

  set vin20 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin20 ]

  set vin21 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin21 ]

  set vin22 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin22 ]

  set vin23 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin23 ]

  set vin30 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin30 ]

  set vin31 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin31 ]

  set vin32 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin32 ]

  set vin33 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vin33 ]

  set vout00 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout00 ]

  set vout01 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout01 ]

  set vout02 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout02 ]

  set vout03 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout03 ]

  set vout10 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout10 ]

  set vout11 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout11 ]

  set vout12 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout12 ]

  set vout13 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout13 ]

  set vout20 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout20 ]

  set vout21 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout21 ]

  set vout22 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout22 ]

  set vout23 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout23 ]

  set vout30 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout30 ]

  set vout31 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout31 ]

  set vout32 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout32 ]

  set vout33 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:diff_analog_io_rtl:1.0 vout33 ]


  # Create ports

  # Create instance: axi_dma_0, and set properties
  set axi_dma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0 ]
  set_property -dict [ list \
   CONFIG.c_sg_include_stscntrl_strm {0} \
 ] $axi_dma_0

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {16} \
 ] $axi_gpio_0

  # Create instance: axi_smc, and set properties
  set axi_smc [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc ]
  set_property -dict [ list \
   CONFIG.NUM_SI {3} \
 ] $axi_smc

  # Create instance: axis_data_pl_to_ps_fifo, and set properties
  set axis_data_pl_to_ps_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_pl_to_ps_fifo ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {16} \
   CONFIG.IS_ACLK_ASYNC {1} \
 ] $axis_data_pl_to_ps_fifo

  # Create instance: axis_data_ps_to_pl_fifo, and set properties
  set axis_data_ps_to_pl_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_ps_to_pl_fifo ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {16} \
   CONFIG.IS_ACLK_ASYNC {1} \
 ] $axis_data_ps_to_pl_fifo

  # Create instance: axis_gpio_async_fifo, and set properties
  set axis_gpio_async_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_gpio_async_fifo ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {16} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.TDATA_NUM_BYTES {2} \
 ] $axis_gpio_async_fifo

  # Create instance: gpio_buffer_0, and set properties
  set block_name gpio_buffer
  set block_cell_name gpio_buffer_0
  if { [catch {set gpio_buffer_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $gpio_buffer_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ps8_0_axi_periph, and set properties
  set ps8_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps8_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {3} \
 ] $ps8_0_axi_periph

  # Create instance: rfsoc_pl_ctrl_verilo_0, and set properties
  set block_name rfsoc_pl_ctrl_verilog_wrapper
  set block_cell_name rfsoc_pl_ctrl_verilo_0
  if { [catch {set rfsoc_pl_ctrl_verilo_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $rfsoc_pl_ctrl_verilo_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: rst_ps8_0_100M, and set properties
  set rst_ps8_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps8_0_100M ]

  # Create instance: rst_ps8_0_100M1, and set properties
  set rst_ps8_0_100M1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps8_0_100M1 ]

  # Create instance: usp_rf_data_converter_0, and set properties
  set usp_rf_data_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:usp_rf_data_converter:2.3 usp_rf_data_converter_0 ]
  set_property -dict [ list \
   CONFIG.ADC0_Multi_Tile_Sync {true} \
   CONFIG.ADC0_PLL_Enable {true} \
   CONFIG.ADC0_Refclk_Freq {250.000} \
   CONFIG.ADC1_Enable {1} \
   CONFIG.ADC1_Fabric_Freq {250.000} \
   CONFIG.ADC1_Multi_Tile_Sync {true} \
   CONFIG.ADC1_Outclk_Freq {250.000} \
   CONFIG.ADC1_PLL_Enable {true} \
   CONFIG.ADC1_Refclk_Freq {250.000} \
   CONFIG.ADC2_Enable {1} \
   CONFIG.ADC2_Fabric_Freq {250.000} \
   CONFIG.ADC2_Multi_Tile_Sync {true} \
   CONFIG.ADC2_Outclk_Freq {250.000} \
   CONFIG.ADC2_PLL_Enable {true} \
   CONFIG.ADC2_Refclk_Freq {250.000} \
   CONFIG.ADC3_Enable {1} \
   CONFIG.ADC3_Fabric_Freq {250.000} \
   CONFIG.ADC3_Multi_Tile_Sync {true} \
   CONFIG.ADC3_Outclk_Freq {250.000} \
   CONFIG.ADC3_PLL_Enable {true} \
   CONFIG.ADC3_Refclk_Freq {250.000} \
   CONFIG.ADC_Decimation_Mode01 {1} \
   CONFIG.ADC_Decimation_Mode02 {1} \
   CONFIG.ADC_Decimation_Mode03 {1} \
   CONFIG.ADC_Decimation_Mode10 {1} \
   CONFIG.ADC_Decimation_Mode11 {1} \
   CONFIG.ADC_Decimation_Mode12 {1} \
   CONFIG.ADC_Decimation_Mode13 {1} \
   CONFIG.ADC_Decimation_Mode20 {1} \
   CONFIG.ADC_Decimation_Mode21 {1} \
   CONFIG.ADC_Decimation_Mode22 {1} \
   CONFIG.ADC_Decimation_Mode23 {1} \
   CONFIG.ADC_Decimation_Mode30 {1} \
   CONFIG.ADC_Decimation_Mode31 {1} \
   CONFIG.ADC_Decimation_Mode32 {1} \
   CONFIG.ADC_Decimation_Mode33 {1} \
   CONFIG.ADC_Dither00 {false} \
   CONFIG.ADC_Dither01 {false} \
   CONFIG.ADC_Dither02 {false} \
   CONFIG.ADC_Dither03 {false} \
   CONFIG.ADC_Dither10 {false} \
   CONFIG.ADC_Dither11 {false} \
   CONFIG.ADC_Dither12 {false} \
   CONFIG.ADC_Dither13 {false} \
   CONFIG.ADC_Dither20 {false} \
   CONFIG.ADC_Dither21 {false} \
   CONFIG.ADC_Dither22 {false} \
   CONFIG.ADC_Dither23 {false} \
   CONFIG.ADC_Dither30 {false} \
   CONFIG.ADC_Dither31 {false} \
   CONFIG.ADC_Dither32 {false} \
   CONFIG.ADC_Dither33 {false} \
   CONFIG.ADC_Mixer_Type01 {0} \
   CONFIG.ADC_Mixer_Type02 {0} \
   CONFIG.ADC_Mixer_Type03 {0} \
   CONFIG.ADC_Mixer_Type10 {0} \
   CONFIG.ADC_Mixer_Type11 {0} \
   CONFIG.ADC_Mixer_Type12 {0} \
   CONFIG.ADC_Mixer_Type13 {0} \
   CONFIG.ADC_Mixer_Type20 {0} \
   CONFIG.ADC_Mixer_Type21 {0} \
   CONFIG.ADC_Mixer_Type22 {0} \
   CONFIG.ADC_Mixer_Type23 {0} \
   CONFIG.ADC_Mixer_Type30 {0} \
   CONFIG.ADC_Mixer_Type31 {0} \
   CONFIG.ADC_Mixer_Type32 {0} \
   CONFIG.ADC_Mixer_Type33 {0} \
   CONFIG.ADC_RESERVED_1_00 {false} \
   CONFIG.ADC_RESERVED_1_01 {false} \
   CONFIG.ADC_RESERVED_1_02 {false} \
   CONFIG.ADC_RESERVED_1_03 {false} \
   CONFIG.ADC_RESERVED_1_10 {false} \
   CONFIG.ADC_RESERVED_1_11 {false} \
   CONFIG.ADC_RESERVED_1_12 {false} \
   CONFIG.ADC_RESERVED_1_13 {false} \
   CONFIG.ADC_RESERVED_1_20 {false} \
   CONFIG.ADC_RESERVED_1_21 {false} \
   CONFIG.ADC_RESERVED_1_22 {false} \
   CONFIG.ADC_RESERVED_1_23 {false} \
   CONFIG.ADC_RESERVED_1_30 {false} \
   CONFIG.ADC_RESERVED_1_31 {false} \
   CONFIG.ADC_RESERVED_1_32 {false} \
   CONFIG.ADC_RESERVED_1_33 {false} \
   CONFIG.ADC_Slice01_Enable {true} \
   CONFIG.ADC_Slice02_Enable {true} \
   CONFIG.ADC_Slice03_Enable {true} \
   CONFIG.ADC_Slice10_Enable {true} \
   CONFIG.ADC_Slice11_Enable {true} \
   CONFIG.ADC_Slice12_Enable {true} \
   CONFIG.ADC_Slice13_Enable {true} \
   CONFIG.ADC_Slice20_Enable {true} \
   CONFIG.ADC_Slice21_Enable {true} \
   CONFIG.ADC_Slice22_Enable {true} \
   CONFIG.ADC_Slice23_Enable {true} \
   CONFIG.ADC_Slice30_Enable {true} \
   CONFIG.ADC_Slice31_Enable {true} \
   CONFIG.ADC_Slice32_Enable {true} \
   CONFIG.ADC_Slice33_Enable {true} \
   CONFIG.DAC0_Enable {1} \
   CONFIG.DAC0_Fabric_Freq {250.000} \
   CONFIG.DAC0_Multi_Tile_Sync {true} \
   CONFIG.DAC0_Outclk_Freq {250.000} \
   CONFIG.DAC0_PLL_Enable {true} \
   CONFIG.DAC0_Refclk_Freq {250.000} \
   CONFIG.DAC0_Sampling_Rate {4} \
   CONFIG.DAC1_Enable {1} \
   CONFIG.DAC1_Fabric_Freq {250.000} \
   CONFIG.DAC1_Multi_Tile_Sync {true} \
   CONFIG.DAC1_Outclk_Freq {250.000} \
   CONFIG.DAC1_PLL_Enable {true} \
   CONFIG.DAC1_Refclk_Freq {250.000} \
   CONFIG.DAC1_Sampling_Rate {4} \
   CONFIG.DAC2_Enable {1} \
   CONFIG.DAC2_Fabric_Freq {250.000} \
   CONFIG.DAC2_Multi_Tile_Sync {true} \
   CONFIG.DAC2_Outclk_Freq {250.000} \
   CONFIG.DAC2_PLL_Enable {true} \
   CONFIG.DAC2_Refclk_Freq {250.000} \
   CONFIG.DAC2_Sampling_Rate {4} \
   CONFIG.DAC3_Enable {1} \
   CONFIG.DAC3_Fabric_Freq {250.000} \
   CONFIG.DAC3_Outclk_Freq {250.000} \
   CONFIG.DAC3_PLL_Enable {true} \
   CONFIG.DAC3_Refclk_Freq {250.000} \
   CONFIG.DAC3_Sampling_Rate {4} \
   CONFIG.DAC_Interpolation_Mode00 {1} \
   CONFIG.DAC_Interpolation_Mode01 {1} \
   CONFIG.DAC_Interpolation_Mode02 {1} \
   CONFIG.DAC_Interpolation_Mode03 {1} \
   CONFIG.DAC_Interpolation_Mode10 {1} \
   CONFIG.DAC_Interpolation_Mode11 {1} \
   CONFIG.DAC_Interpolation_Mode12 {1} \
   CONFIG.DAC_Interpolation_Mode13 {1} \
   CONFIG.DAC_Interpolation_Mode20 {1} \
   CONFIG.DAC_Interpolation_Mode21 {1} \
   CONFIG.DAC_Interpolation_Mode22 {1} \
   CONFIG.DAC_Interpolation_Mode23 {1} \
   CONFIG.DAC_Interpolation_Mode30 {1} \
   CONFIG.DAC_Interpolation_Mode31 {1} \
   CONFIG.DAC_Interpolation_Mode32 {1} \
   CONFIG.DAC_Interpolation_Mode33 {1} \
   CONFIG.DAC_Mixer_Type00 {0} \
   CONFIG.DAC_Mixer_Type01 {0} \
   CONFIG.DAC_Mixer_Type02 {0} \
   CONFIG.DAC_Mixer_Type03 {0} \
   CONFIG.DAC_Mixer_Type10 {0} \
   CONFIG.DAC_Mixer_Type11 {0} \
   CONFIG.DAC_Mixer_Type12 {0} \
   CONFIG.DAC_Mixer_Type13 {0} \
   CONFIG.DAC_Mixer_Type20 {0} \
   CONFIG.DAC_Mixer_Type21 {0} \
   CONFIG.DAC_Mixer_Type22 {0} \
   CONFIG.DAC_Mixer_Type23 {0} \
   CONFIG.DAC_Mixer_Type30 {0} \
   CONFIG.DAC_Mixer_Type31 {0} \
   CONFIG.DAC_Mixer_Type32 {0} \
   CONFIG.DAC_Mixer_Type33 {0} \
   CONFIG.DAC_RESERVED_1_00 {false} \
   CONFIG.DAC_RESERVED_1_01 {false} \
   CONFIG.DAC_RESERVED_1_02 {false} \
   CONFIG.DAC_RESERVED_1_03 {false} \
   CONFIG.DAC_RESERVED_1_10 {false} \
   CONFIG.DAC_RESERVED_1_11 {false} \
   CONFIG.DAC_RESERVED_1_12 {false} \
   CONFIG.DAC_RESERVED_1_13 {false} \
   CONFIG.DAC_RESERVED_1_20 {false} \
   CONFIG.DAC_RESERVED_1_21 {false} \
   CONFIG.DAC_RESERVED_1_22 {false} \
   CONFIG.DAC_RESERVED_1_23 {false} \
   CONFIG.DAC_RESERVED_1_30 {false} \
   CONFIG.DAC_RESERVED_1_31 {false} \
   CONFIG.DAC_RESERVED_1_32 {false} \
   CONFIG.DAC_RESERVED_1_33 {false} \
   CONFIG.DAC_Slice00_Enable {true} \
   CONFIG.DAC_Slice01_Enable {true} \
   CONFIG.DAC_Slice02_Enable {true} \
   CONFIG.DAC_Slice03_Enable {true} \
   CONFIG.DAC_Slice10_Enable {true} \
   CONFIG.DAC_Slice11_Enable {true} \
   CONFIG.DAC_Slice12_Enable {true} \
   CONFIG.DAC_Slice13_Enable {true} \
   CONFIG.DAC_Slice20_Enable {true} \
   CONFIG.DAC_Slice21_Enable {true} \
   CONFIG.DAC_Slice22_Enable {true} \
   CONFIG.DAC_Slice23_Enable {true} \
   CONFIG.DAC_Slice30_Enable {true} \
   CONFIG.DAC_Slice31_Enable {true} \
   CONFIG.DAC_Slice32_Enable {true} \
   CONFIG.DAC_Slice33_Enable {true} \
 ] $usp_rf_data_converter_0

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]

  # Create instance: zynq_ultra_ps_e_0, and set properties
  set zynq_ultra_ps_e_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.3 zynq_ultra_ps_e_0 ]
  set_property -dict [ list \
   CONFIG.PSU_BANK_0_IO_STANDARD {LVCMOS18} \
   CONFIG.PSU_BANK_1_IO_STANDARD {LVCMOS18} \
   CONFIG.PSU_BANK_2_IO_STANDARD {LVCMOS18} \
   CONFIG.PSU_DDR_RAM_HIGHADDR {0x7FFFFFFF} \
   CONFIG.PSU_DDR_RAM_HIGHADDR_OFFSET {0x00000002} \
   CONFIG.PSU_DDR_RAM_LOWADDR_OFFSET {0x80000000} \
   CONFIG.PSU_DYNAMIC_DDR_CONFIG_EN {0} \
   CONFIG.PSU_MIO_0_DIRECTION {out} \
   CONFIG.PSU_MIO_0_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_0_POLARITY {Default} \
   CONFIG.PSU_MIO_1_DIRECTION {inout} \
   CONFIG.PSU_MIO_1_POLARITY {Default} \
   CONFIG.PSU_MIO_2_DIRECTION {inout} \
   CONFIG.PSU_MIO_2_POLARITY {Default} \
   CONFIG.PSU_MIO_34_DIRECTION {in} \
   CONFIG.PSU_MIO_34_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_34_POLARITY {Default} \
   CONFIG.PSU_MIO_34_SLEW {fast} \
   CONFIG.PSU_MIO_35_DIRECTION {out} \
   CONFIG.PSU_MIO_35_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_35_POLARITY {Default} \
   CONFIG.PSU_MIO_39_DIRECTION {inout} \
   CONFIG.PSU_MIO_39_POLARITY {Default} \
   CONFIG.PSU_MIO_3_DIRECTION {inout} \
   CONFIG.PSU_MIO_3_POLARITY {Default} \
   CONFIG.PSU_MIO_40_DIRECTION {inout} \
   CONFIG.PSU_MIO_40_POLARITY {Default} \
   CONFIG.PSU_MIO_41_DIRECTION {inout} \
   CONFIG.PSU_MIO_41_POLARITY {Default} \
   CONFIG.PSU_MIO_42_DIRECTION {inout} \
   CONFIG.PSU_MIO_42_POLARITY {Default} \
   CONFIG.PSU_MIO_43_DIRECTION {out} \
   CONFIG.PSU_MIO_43_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_43_POLARITY {Default} \
   CONFIG.PSU_MIO_44_DIRECTION {in} \
   CONFIG.PSU_MIO_44_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_44_POLARITY {Default} \
   CONFIG.PSU_MIO_44_SLEW {fast} \
   CONFIG.PSU_MIO_45_DIRECTION {in} \
   CONFIG.PSU_MIO_45_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_45_POLARITY {Default} \
   CONFIG.PSU_MIO_45_SLEW {fast} \
   CONFIG.PSU_MIO_46_DIRECTION {inout} \
   CONFIG.PSU_MIO_46_POLARITY {Default} \
   CONFIG.PSU_MIO_47_DIRECTION {inout} \
   CONFIG.PSU_MIO_47_POLARITY {Default} \
   CONFIG.PSU_MIO_48_DIRECTION {inout} \
   CONFIG.PSU_MIO_48_POLARITY {Default} \
   CONFIG.PSU_MIO_49_DIRECTION {inout} \
   CONFIG.PSU_MIO_49_POLARITY {Default} \
   CONFIG.PSU_MIO_4_DIRECTION {inout} \
   CONFIG.PSU_MIO_4_POLARITY {Default} \
   CONFIG.PSU_MIO_50_DIRECTION {inout} \
   CONFIG.PSU_MIO_50_POLARITY {Default} \
   CONFIG.PSU_MIO_51_DIRECTION {out} \
   CONFIG.PSU_MIO_51_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_51_POLARITY {Default} \
   CONFIG.PSU_MIO_5_DIRECTION {out} \
   CONFIG.PSU_MIO_5_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_5_POLARITY {Default} \
   CONFIG.PSU_MIO_6_DIRECTION {out} \
   CONFIG.PSU_MIO_6_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_6_POLARITY {Default} \
   CONFIG.PSU_MIO_TREE_PERIPHERALS {Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Feedback Clk############################UART 0#UART 0####SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1##########################} \
   CONFIG.PSU_MIO_TREE_SIGNALS {sclk_out#miso_mo1#mo2#mo3#mosi_mi0#n_ss_out#clk_for_lpbk############################rxd#txd####sdio1_data_out[4]#sdio1_data_out[5]#sdio1_data_out[6]#sdio1_data_out[7]#sdio1_bus_pow#sdio1_wp#sdio1_cd_n#sdio1_data_out[0]#sdio1_data_out[1]#sdio1_data_out[2]#sdio1_data_out[3]#sdio1_cmd_out#sdio1_clk_out##########################} \
   CONFIG.PSU_SD1_INTERNAL_BUS_WIDTH {8} \
   CONFIG.PSU__ACT_DDR_FREQ_MHZ {1050.000000} \
   CONFIG.PSU__AFI0_COHERENCY {0} \
   CONFIG.PSU__CAN1__GRP_CLK__ENABLE {0} \
   CONFIG.PSU__CAN1__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__ACT_FREQMHZ {1200.000000} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__DIVISOR0 {1} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__FREQMHZ {1200} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__SRCSEL {APLL} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__FBDIV {72} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRF_APB__APLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__APLL_TO_LPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__ACT_FREQMHZ {250.000000} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__ACT_FREQMHZ {250.000000} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__ACT_FREQMHZ {525.000000} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__FREQMHZ {1067} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__ACT_FREQMHZ {600.000000} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__FREQMHZ {600} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__SRCSEL {APLL} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__FBDIV {63} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRF_APB__DPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__DPLL_TO_LPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR0 {63} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR1 {10} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__SRCSEL {VPLL} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__ACT_FREQMHZ {600.000000} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__FREQMHZ {600} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__SRCSEL {APLL} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__FREQMHZ {500} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__ACT_FREQMHZ {525.000000} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__FREQMHZ {533.33} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__FBDIV {90} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRF_APB__VPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__VPLL_TO_LPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__ACT_FREQMHZ {500.000000} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__FREQMHZ {500} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__AFI6_REF_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__ACT_FREQMHZ {50.000000} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR0 {30} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__ACT_FREQMHZ {500.000000} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__FREQMHZ {500} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__ACT_FREQMHZ {250.000000} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__DLL_REF_CTRL__ACT_FREQMHZ {1500.000000} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__FREQMHZ {125} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__FBDIV {90} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRL_APB__IOPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRL_APB__IOPLL_TO_FPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__ACT_FREQMHZ {250.000000} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__ACT_FREQMHZ {500.000000} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__FREQMHZ {500} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__ACT_FREQMHZ {187.500000} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__DIVISOR0 {8} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__FREQMHZ {200} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__ACT_FREQMHZ {125.000000} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__FREQMHZ {125} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__FBDIV {90} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRL_APB__RPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRL_APB__RPLL_TO_FPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__ACT_FREQMHZ {187.500000} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR0 {8} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__FREQMHZ {200} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR1 {15} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__FREQMHZ {20} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__DDRC__ADDR_MIRROR {0} \
   CONFIG.PSU__DDRC__BANK_ADDR_COUNT {3} \
   CONFIG.PSU__DDRC__BG_ADDR_COUNT {NA} \
   CONFIG.PSU__DDRC__BRC_MAPPING {ROW_BANK_COL} \
   CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
   CONFIG.PSU__DDRC__CL {14} \
   CONFIG.PSU__DDRC__CLOCK_STOP_EN {0} \
   CONFIG.PSU__DDRC__COL_ADDR_COUNT {10} \
   CONFIG.PSU__DDRC__COMPONENTS {Components} \
   CONFIG.PSU__DDRC__CWL {10} \
   CONFIG.PSU__DDRC__DDR3L_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__DDR3_T_REF_RANGE {Normal (0-85)} \
   CONFIG.PSU__DDRC__DDR4_ADDR_MAPPING {NA} \
   CONFIG.PSU__DDRC__DDR4_CAL_MODE_ENABLE {NA} \
   CONFIG.PSU__DDRC__DDR4_CRC_CONTROL {NA} \
   CONFIG.PSU__DDRC__DDR4_MAXPWR_SAVING_EN {NA} \
   CONFIG.PSU__DDRC__DDR4_T_REF_MODE {NA} \
   CONFIG.PSU__DDRC__DDR4_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__DEEP_PWR_DOWN_EN {0} \
   CONFIG.PSU__DDRC__DEVICE_CAPACITY {4096 MBits} \
   CONFIG.PSU__DDRC__DIMM_ADDR_MIRROR {0} \
   CONFIG.PSU__DDRC__DM_DBI {DM_NO_DBI} \
   CONFIG.PSU__DDRC__DQMAP_0_3 {0} \
   CONFIG.PSU__DDRC__DQMAP_12_15 {0} \
   CONFIG.PSU__DDRC__DQMAP_16_19 {0} \
   CONFIG.PSU__DDRC__DQMAP_20_23 {0} \
   CONFIG.PSU__DDRC__DQMAP_24_27 {0} \
   CONFIG.PSU__DDRC__DQMAP_28_31 {0} \
   CONFIG.PSU__DDRC__DQMAP_32_35 {0} \
   CONFIG.PSU__DDRC__DQMAP_36_39 {0} \
   CONFIG.PSU__DDRC__DQMAP_40_43 {0} \
   CONFIG.PSU__DDRC__DQMAP_44_47 {0} \
   CONFIG.PSU__DDRC__DQMAP_48_51 {0} \
   CONFIG.PSU__DDRC__DQMAP_4_7 {0} \
   CONFIG.PSU__DDRC__DQMAP_52_55 {0} \
   CONFIG.PSU__DDRC__DQMAP_56_59 {0} \
   CONFIG.PSU__DDRC__DQMAP_60_63 {0} \
   CONFIG.PSU__DDRC__DQMAP_64_67 {0} \
   CONFIG.PSU__DDRC__DQMAP_68_71 {0} \
   CONFIG.PSU__DDRC__DQMAP_8_11 {0} \
   CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
   CONFIG.PSU__DDRC__ECC {Disabled} \
   CONFIG.PSU__DDRC__ENABLE_LP4_HAS_ECC_COMP {0} \
   CONFIG.PSU__DDRC__ENABLE_LP4_SLOWBOOT {0} \
   CONFIG.PSU__DDRC__EN_2ND_CLK {0} \
   CONFIG.PSU__DDRC__FGRM {NA} \
   CONFIG.PSU__DDRC__LPDDR3_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__LPDDR4_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__LP_ASR {NA} \
   CONFIG.PSU__DDRC__MEMORY_TYPE {DDR 3} \
   CONFIG.PSU__DDRC__PARITY_ENABLE {NA} \
   CONFIG.PSU__DDRC__PER_BANK_REFRESH {0} \
   CONFIG.PSU__DDRC__PHY_DBI_MODE {NA} \
   CONFIG.PSU__DDRC__RANK_ADDR_COUNT {0} \
   CONFIG.PSU__DDRC__ROW_ADDR_COUNT {15} \
   CONFIG.PSU__DDRC__SB_TARGET {14-14-14} \
   CONFIG.PSU__DDRC__SELF_REF_ABORT {0} \
   CONFIG.PSU__DDRC__SPEED_BIN {DDR3_2133N} \
   CONFIG.PSU__DDRC__STATIC_RD_MODE {0} \
   CONFIG.PSU__DDRC__TRAIN_DATA_EYE {1} \
   CONFIG.PSU__DDRC__TRAIN_READ_GATE {1} \
   CONFIG.PSU__DDRC__TRAIN_WRITE_LEVEL {1} \
   CONFIG.PSU__DDRC__T_FAW {30.0} \
   CONFIG.PSU__DDRC__T_RAS_MIN {33} \
   CONFIG.PSU__DDRC__T_RC {47.06} \
   CONFIG.PSU__DDRC__T_RCD {14} \
   CONFIG.PSU__DDRC__T_RP {14} \
   CONFIG.PSU__DDRC__VENDOR_PART {OTHERS} \
   CONFIG.PSU__DDRC__VREF {1} \
   CONFIG.PSU__DDR_HIGH_ADDRESS_GUI_ENABLE {0} \
   CONFIG.PSU__DDR__INTERFACE__FREQMHZ {533.500} \
   CONFIG.PSU__DISPLAYPORT__LANE0__ENABLE {0} \
   CONFIG.PSU__DLL__ISUSED {1} \
   CONFIG.PSU__ENET3__FIFO__ENABLE {0} \
   CONFIG.PSU__ENET3__GRP_MDIO__ENABLE {0} \
   CONFIG.PSU__ENET3__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__ENET3__PTP__ENABLE {0} \
   CONFIG.PSU__ENET3__TSU__ENABLE {0} \
   CONFIG.PSU__FPD_SLCR__WDT1__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__FPD_SLCR__WDT1__FREQMHZ {100.000000} \
   CONFIG.PSU__FPD_SLCR__WDT_CLK_SEL__SELECT {APB} \
   CONFIG.PSU__FPGA_PL0_ENABLE {1} \
   CONFIG.PSU__GEM3_COHERENCY {0} \
   CONFIG.PSU__GEM3_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__GEM__TSU__ENABLE {0} \
   CONFIG.PSU__GPIO0_MIO__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__GPIO1_MIO__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__HIGH_ADDRESS__ENABLE {0} \
   CONFIG.PSU__I2C0__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__I2C1__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC0_SEL {APB} \
   CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC1_SEL {APB} \
   CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC2_SEL {APB} \
   CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC3_SEL {APB} \
   CONFIG.PSU__IOU_SLCR__TTC0__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC0__FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC1__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC1__FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC2__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC2__FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC3__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC3__FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__WDT0__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__WDT0__FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__WDT_CLK_SEL__SELECT {APB} \
   CONFIG.PSU__MAXIGP0__DATA_WIDTH {128} \
   CONFIG.PSU__MAXIGP1__DATA_WIDTH {128} \
   CONFIG.PSU__MAXIGP2__DATA_WIDTH {32} \
   CONFIG.PSU__OVERRIDE__BASIC_CLOCK {0} \
   CONFIG.PSU__PL_CLK0_BUF {TRUE} \
   CONFIG.PSU__PMU_COHERENCY {0} \
   CONFIG.PSU__PMU__AIBACK__ENABLE {0} \
   CONFIG.PSU__PMU__EMIO_GPI__ENABLE {0} \
   CONFIG.PSU__PMU__EMIO_GPO__ENABLE {0} \
   CONFIG.PSU__PMU__GPI0__ENABLE {0} \
   CONFIG.PSU__PMU__GPI1__ENABLE {0} \
   CONFIG.PSU__PMU__GPI2__ENABLE {0} \
   CONFIG.PSU__PMU__GPI3__ENABLE {0} \
   CONFIG.PSU__PMU__GPI4__ENABLE {0} \
   CONFIG.PSU__PMU__GPI5__ENABLE {0} \
   CONFIG.PSU__PMU__GPO0__ENABLE {0} \
   CONFIG.PSU__PMU__GPO1__ENABLE {0} \
   CONFIG.PSU__PMU__GPO2__ENABLE {0} \
   CONFIG.PSU__PMU__GPO3__ENABLE {0} \
   CONFIG.PSU__PMU__GPO4__ENABLE {0} \
   CONFIG.PSU__PMU__GPO5__ENABLE {0} \
   CONFIG.PSU__PMU__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__PMU__PLERROR__ENABLE {0} \
   CONFIG.PSU__PRESET_APPLIED {1} \
   CONFIG.PSU__PROTECTION__MASTERS {USB1:NonSecure;0|USB0:NonSecure;0|S_AXI_LPD:NA;0|S_AXI_HPC1_FPD:NA;0|S_AXI_HPC0_FPD:NA;1|S_AXI_HP3_FPD:NA;0|S_AXI_HP2_FPD:NA;0|S_AXI_HP1_FPD:NA;0|S_AXI_HP0_FPD:NA;0|S_AXI_ACP:NA;0|S_AXI_ACE:NA;0|SD1:NonSecure;1|SD0:NonSecure;0|SATA1:NonSecure;0|SATA0:NonSecure;0|RPU1:Secure;1|RPU0:Secure;1|QSPI:NonSecure;1|PMU:NA;1|PCIe:NonSecure;0|NAND:NonSecure;0|LDMA:NonSecure;1|GPU:NonSecure;1|GEM3:NonSecure;0|GEM2:NonSecure;0|GEM1:NonSecure;0|GEM0:NonSecure;0|FDMA:NonSecure;1|DP:NonSecure;0|DAP:NA;1|Coresight:NA;1|CSU:NA;1|APU:NA;1} \
   CONFIG.PSU__PROTECTION__SLAVES {LPD;USB3_1_XHCI;FE300000;FE3FFFFF;0|LPD;USB3_1;FF9E0000;FF9EFFFF;0|LPD;USB3_0_XHCI;FE200000;FE2FFFFF;0|LPD;USB3_0;FF9D0000;FF9DFFFF;0|LPD;UART1;FF010000;FF01FFFF;0|LPD;UART0;FF000000;FF00FFFF;1|LPD;TTC3;FF140000;FF14FFFF;1|LPD;TTC2;FF130000;FF13FFFF;1|LPD;TTC1;FF120000;FF12FFFF;1|LPD;TTC0;FF110000;FF11FFFF;1|FPD;SWDT1;FD4D0000;FD4DFFFF;1|LPD;SWDT0;FF150000;FF15FFFF;1|LPD;SPI1;FF050000;FF05FFFF;0|LPD;SPI0;FF040000;FF04FFFF;0|FPD;SMMU_REG;FD5F0000;FD5FFFFF;1|FPD;SMMU;FD800000;FDFFFFFF;1|FPD;SIOU;FD3D0000;FD3DFFFF;1|FPD;SERDES;FD400000;FD47FFFF;1|LPD;SD1;FF170000;FF17FFFF;1|LPD;SD0;FF160000;FF16FFFF;0|FPD;SATA;FD0C0000;FD0CFFFF;0|LPD;RTC;FFA60000;FFA6FFFF;1|LPD;RSA_CORE;FFCE0000;FFCEFFFF;1|LPD;RPU;FF9A0000;FF9AFFFF;1|LPD;R5_TCM_RAM_GLOBAL;FFE00000;FFE3FFFF;1|LPD;R5_1_Instruction_Cache;FFEC0000;FFECFFFF;1|LPD;R5_1_Data_Cache;FFED0000;FFEDFFFF;1|LPD;R5_1_BTCM_GLOBAL;FFEB0000;FFEBFFFF;1|LPD;R5_1_ATCM_GLOBAL;FFE90000;FFE9FFFF;1|LPD;R5_0_Instruction_Cache;FFE40000;FFE4FFFF;1|LPD;R5_0_Data_Cache;FFE50000;FFE5FFFF;1|LPD;R5_0_BTCM_GLOBAL;FFE20000;FFE2FFFF;1|LPD;R5_0_ATCM_GLOBAL;FFE00000;FFE0FFFF;1|LPD;QSPI_Linear_Address;C0000000;DFFFFFFF;1|LPD;QSPI;FF0F0000;FF0FFFFF;1|LPD;PMU_RAM;FFDC0000;FFDDFFFF;1|LPD;PMU_GLOBAL;FFD80000;FFDBFFFF;1|FPD;PCIE_MAIN;FD0E0000;FD0EFFFF;0|FPD;PCIE_LOW;E0000000;EFFFFFFF;0|FPD;PCIE_HIGH2;8000000000;BFFFFFFFFF;0|FPD;PCIE_HIGH1;600000000;7FFFFFFFF;0|FPD;PCIE_DMA;FD0F0000;FD0FFFFF;0|FPD;PCIE_ATTRIB;FD480000;FD48FFFF;0|LPD;OCM_XMPU_CFG;FFA70000;FFA7FFFF;1|LPD;OCM_SLCR;FF960000;FF96FFFF;1|OCM;OCM;FFFC0000;FFFFFFFF;1|LPD;NAND;FF100000;FF10FFFF;0|LPD;MBISTJTAG;FFCF0000;FFCFFFFF;1|LPD;LPD_XPPU_SINK;FF9C0000;FF9CFFFF;1|LPD;LPD_XPPU;FF980000;FF98FFFF;1|LPD;LPD_SLCR_SECURE;FF4B0000;FF4DFFFF;1|LPD;LPD_SLCR;FF410000;FF4AFFFF;1|LPD;LPD_GPV;FE100000;FE1FFFFF;1|LPD;LPD_DMA_7;FFAF0000;FFAFFFFF;1|LPD;LPD_DMA_6;FFAE0000;FFAEFFFF;1|LPD;LPD_DMA_5;FFAD0000;FFADFFFF;1|LPD;LPD_DMA_4;FFAC0000;FFACFFFF;1|LPD;LPD_DMA_3;FFAB0000;FFABFFFF;1|LPD;LPD_DMA_2;FFAA0000;FFAAFFFF;1|LPD;LPD_DMA_1;FFA90000;FFA9FFFF;1|LPD;LPD_DMA_0;FFA80000;FFA8FFFF;1|LPD;IPI_CTRL;FF380000;FF3FFFFF;1|LPD;IOU_SLCR;FF180000;FF23FFFF;1|LPD;IOU_SECURE_SLCR;FF240000;FF24FFFF;1|LPD;IOU_SCNTRS;FF260000;FF26FFFF;1|LPD;IOU_SCNTR;FF250000;FF25FFFF;1|LPD;IOU_GPV;FE000000;FE0FFFFF;1|LPD;I2C1;FF030000;FF03FFFF;0|LPD;I2C0;FF020000;FF02FFFF;0|FPD;GPU;FD4B0000;FD4BFFFF;0|LPD;GPIO;FF0A0000;FF0AFFFF;1|LPD;GEM3;FF0E0000;FF0EFFFF;0|LPD;GEM2;FF0D0000;FF0DFFFF;0|LPD;GEM1;FF0C0000;FF0CFFFF;0|LPD;GEM0;FF0B0000;FF0BFFFF;0|FPD;FPD_XMPU_SINK;FD4F0000;FD4FFFFF;1|FPD;FPD_XMPU_CFG;FD5D0000;FD5DFFFF;1|FPD;FPD_SLCR_SECURE;FD690000;FD6CFFFF;1|FPD;FPD_SLCR;FD610000;FD68FFFF;1|FPD;FPD_GPV;FD700000;FD7FFFFF;1|FPD;FPD_DMA_CH7;FD570000;FD57FFFF;1|FPD;FPD_DMA_CH6;FD560000;FD56FFFF;1|FPD;FPD_DMA_CH5;FD550000;FD55FFFF;1|FPD;FPD_DMA_CH4;FD540000;FD54FFFF;1|FPD;FPD_DMA_CH3;FD530000;FD53FFFF;1|FPD;FPD_DMA_CH2;FD520000;FD52FFFF;1|FPD;FPD_DMA_CH1;FD510000;FD51FFFF;1|FPD;FPD_DMA_CH0;FD500000;FD50FFFF;1|LPD;EFUSE;FFCC0000;FFCCFFFF;1|FPD;Display Port;FD4A0000;FD4AFFFF;0|FPD;DPDMA;FD4C0000;FD4CFFFF;0|FPD;DDR_XMPU5_CFG;FD050000;FD05FFFF;1|FPD;DDR_XMPU4_CFG;FD040000;FD04FFFF;1|FPD;DDR_XMPU3_CFG;FD030000;FD03FFFF;1|FPD;DDR_XMPU2_CFG;FD020000;FD02FFFF;1|FPD;DDR_XMPU1_CFG;FD010000;FD01FFFF;1|FPD;DDR_XMPU0_CFG;FD000000;FD00FFFF;1|FPD;DDR_QOS_CTRL;FD090000;FD09FFFF;1|FPD;DDR_PHY;FD080000;FD08FFFF;1|DDR;DDR_LOW;0;7FFFFFFF;1|DDR;DDR_HIGH;800000000;800000000;0|FPD;DDDR_CTRL;FD070000;FD070FFF;1|LPD;Coresight;FE800000;FEFFFFFF;1|LPD;CSU_DMA;FFC80000;FFC9FFFF;1|LPD;CSU;FFCA0000;FFCAFFFF;1|LPD;CRL_APB;FF5E0000;FF85FFFF;1|FPD;CRF_APB;FD1A0000;FD2DFFFF;1|FPD;CCI_REG;FD5E0000;FD5EFFFF;1|FPD;CCI_GPV;FD6E0000;FD6EFFFF;1|LPD;CAN1;FF070000;FF07FFFF;0|LPD;CAN0;FF060000;FF06FFFF;0|FPD;APU;FD5C0000;FD5CFFFF;1|LPD;APM_INTC_IOU;FFA20000;FFA2FFFF;1|LPD;APM_FPD_LPD;FFA30000;FFA3FFFF;1|FPD;APM_5;FD490000;FD49FFFF;1|FPD;APM_0;FD0B0000;FD0BFFFF;1|LPD;APM2;FFA10000;FFA1FFFF;1|LPD;APM1;FFA00000;FFA0FFFF;1|LPD;AMS;FFA50000;FFA5FFFF;1|FPD;AFI_5;FD3B0000;FD3BFFFF;1|FPD;AFI_4;FD3A0000;FD3AFFFF;1|FPD;AFI_3;FD390000;FD39FFFF;1|FPD;AFI_2;FD380000;FD38FFFF;1|FPD;AFI_1;FD370000;FD37FFFF;1|FPD;AFI_0;FD360000;FD36FFFF;1|LPD;AFIFM6;FF9B0000;FF9BFFFF;1|FPD;ACPU_GIC;F9010000;F907FFFF;1} \
   CONFIG.PSU__PSS_REF_CLK__FREQMHZ {33.333333} \
   CONFIG.PSU__QSPI_COHERENCY {0} \
   CONFIG.PSU__QSPI_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__QSPI__GRP_FBCLK__ENABLE {1} \
   CONFIG.PSU__QSPI__GRP_FBCLK__IO {MIO 6} \
   CONFIG.PSU__QSPI__PERIPHERAL__DATA_MODE {x4} \
   CONFIG.PSU__QSPI__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__QSPI__PERIPHERAL__IO {MIO 0 .. 5} \
   CONFIG.PSU__QSPI__PERIPHERAL__MODE {Single} \
   CONFIG.PSU__SATA__LANE0__ENABLE {0} \
   CONFIG.PSU__SATA__LANE1__ENABLE {0} \
   CONFIG.PSU__SATA__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__SAXIGP0__DATA_WIDTH {128} \
   CONFIG.PSU__SD1_COHERENCY {0} \
   CONFIG.PSU__SD1_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__SD1__DATA_TRANSFER_MODE {8Bit} \
   CONFIG.PSU__SD1__GRP_CD__ENABLE {1} \
   CONFIG.PSU__SD1__GRP_CD__IO {MIO 45} \
   CONFIG.PSU__SD1__GRP_POW__ENABLE {1} \
   CONFIG.PSU__SD1__GRP_POW__IO {MIO 43} \
   CONFIG.PSU__SD1__GRP_WP__ENABLE {1} \
   CONFIG.PSU__SD1__GRP_WP__IO {MIO 44} \
   CONFIG.PSU__SD1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SD1__PERIPHERAL__IO {MIO 39 .. 51} \
   CONFIG.PSU__SD1__RESET__ENABLE {0} \
   CONFIG.PSU__SD1__SLOT_TYPE {SD 3.0} \
   CONFIG.PSU__SWDT0__CLOCK__ENABLE {0} \
   CONFIG.PSU__SWDT0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SWDT0__RESET__ENABLE {0} \
   CONFIG.PSU__SWDT1__CLOCK__ENABLE {0} \
   CONFIG.PSU__SWDT1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SWDT1__RESET__ENABLE {0} \
   CONFIG.PSU__TSU__BUFG_PORT_PAIR {0} \
   CONFIG.PSU__TTC0__CLOCK__ENABLE {0} \
   CONFIG.PSU__TTC0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__TTC0__WAVEOUT__ENABLE {0} \
   CONFIG.PSU__TTC1__CLOCK__ENABLE {0} \
   CONFIG.PSU__TTC1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__TTC1__WAVEOUT__ENABLE {0} \
   CONFIG.PSU__TTC2__CLOCK__ENABLE {0} \
   CONFIG.PSU__TTC2__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__TTC2__WAVEOUT__ENABLE {0} \
   CONFIG.PSU__TTC3__CLOCK__ENABLE {0} \
   CONFIG.PSU__TTC3__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__TTC3__WAVEOUT__ENABLE {0} \
   CONFIG.PSU__UART0__BAUD_RATE {115200} \
   CONFIG.PSU__UART0__MODEM__ENABLE {0} \
   CONFIG.PSU__UART0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__UART0__PERIPHERAL__IO {MIO 34 .. 35} \
   CONFIG.PSU__UART1__MODEM__ENABLE {0} \
   CONFIG.PSU__UART1__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__USB0_COHERENCY {0} \
   CONFIG.PSU__USB0__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__USB2_0__EMIO__ENABLE {0} \
   CONFIG.PSU__USB3_0__EMIO__ENABLE {0} \
   CONFIG.PSU__USB3_0__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__USE__IRQ0 {1} \
   CONFIG.PSU__USE__M_AXI_GP0 {1} \
   CONFIG.PSU__USE__M_AXI_GP1 {0} \
   CONFIG.PSU__USE__M_AXI_GP2 {0} \
   CONFIG.PSU__USE__S_AXI_GP0 {1} \
   CONFIG.SUBPRESET1 {Custom} \
 ] $zynq_ultra_ps_e_0

  # Create interface connections
  connect_bd_intf_net -intf_net adc0_clk_1 [get_bd_intf_ports adc0_clk] [get_bd_intf_pins usp_rf_data_converter_0/adc0_clk]
  connect_bd_intf_net -intf_net adc1_clk_1 [get_bd_intf_ports adc1_clk] [get_bd_intf_pins usp_rf_data_converter_0/adc1_clk]
  connect_bd_intf_net -intf_net adc2_clk_1 [get_bd_intf_ports adc2_clk] [get_bd_intf_pins usp_rf_data_converter_0/adc2_clk]
  connect_bd_intf_net -intf_net adc3_clk_1 [get_bd_intf_ports adc3_clk] [get_bd_intf_pins usp_rf_data_converter_0/adc3_clk]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXIS_MM2S [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] [get_bd_intf_pins axis_data_ps_to_pl_fifo/S_AXIS]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_MM2S [get_bd_intf_pins axi_dma_0/M_AXI_MM2S] [get_bd_intf_pins axi_smc/S01_AXI]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_S2MM [get_bd_intf_pins axi_dma_0/M_AXI_S2MM] [get_bd_intf_pins axi_smc/S02_AXI]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_SG [get_bd_intf_pins axi_dma_0/M_AXI_SG] [get_bd_intf_pins axi_smc/S00_AXI]
  connect_bd_intf_net -intf_net axi_smc_M00_AXI [get_bd_intf_pins axi_smc/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HPC0_FPD]
  connect_bd_intf_net -intf_net axis_data_fifo_0_M_AXIS [get_bd_intf_pins axis_gpio_async_fifo/M_AXIS] [get_bd_intf_pins gpio_buffer_0/s_axis]
  connect_bd_intf_net -intf_net axis_data_fifo_1_M_AXIS [get_bd_intf_pins axis_data_ps_to_pl_fifo/M_AXIS] [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s_axis]
  connect_bd_intf_net -intf_net axis_data_fifo_2_M_AXIS [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM] [get_bd_intf_pins axis_data_pl_to_ps_fifo/M_AXIS]
  connect_bd_intf_net -intf_net dac0_clk_1 [get_bd_intf_ports dac0_clk] [get_bd_intf_pins usp_rf_data_converter_0/dac0_clk]
  connect_bd_intf_net -intf_net dac1_clk_1 [get_bd_intf_ports dac1_clk] [get_bd_intf_pins usp_rf_data_converter_0/dac1_clk]
  connect_bd_intf_net -intf_net dac2_clk_1 [get_bd_intf_ports dac2_clk] [get_bd_intf_pins usp_rf_data_converter_0/dac2_clk]
  connect_bd_intf_net -intf_net dac3_clk_1 [get_bd_intf_ports dac3_clk] [get_bd_intf_pins usp_rf_data_converter_0/dac3_clk]
  connect_bd_intf_net -intf_net gpio_buffer_0_m_axis [get_bd_intf_pins axis_gpio_async_fifo/S_AXIS] [get_bd_intf_pins gpio_buffer_0/m_axis]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_M00_AXI [get_bd_intf_pins axi_dma_0/S_AXI_LITE] [get_bd_intf_pins ps8_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_M01_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins ps8_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net ps8_0_axi_periph_M02_AXI [get_bd_intf_pins ps8_0_axi_periph/M02_AXI] [get_bd_intf_pins usp_rf_data_converter_0/s_axi]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m0_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m0_axis] [get_bd_intf_pins usp_rf_data_converter_0/s00_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m10_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m10_axis] [get_bd_intf_pins usp_rf_data_converter_0/s22_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m11_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m11_axis] [get_bd_intf_pins usp_rf_data_converter_0/s23_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m12_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m12_axis] [get_bd_intf_pins usp_rf_data_converter_0/s30_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m13_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m13_axis] [get_bd_intf_pins usp_rf_data_converter_0/s31_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m14_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m14_axis] [get_bd_intf_pins usp_rf_data_converter_0/s32_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m15_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m15_axis] [get_bd_intf_pins usp_rf_data_converter_0/s33_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m16_axis [get_bd_intf_pins axis_data_pl_to_ps_fifo/S_AXIS] [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m16_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m1_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m1_axis] [get_bd_intf_pins usp_rf_data_converter_0/s01_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m2_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m2_axis] [get_bd_intf_pins usp_rf_data_converter_0/s02_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m3_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m3_axis] [get_bd_intf_pins usp_rf_data_converter_0/s03_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m4_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m4_axis] [get_bd_intf_pins usp_rf_data_converter_0/s10_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m5_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m5_axis] [get_bd_intf_pins usp_rf_data_converter_0/s11_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m6_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m6_axis] [get_bd_intf_pins usp_rf_data_converter_0/s12_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m7_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m7_axis] [get_bd_intf_pins usp_rf_data_converter_0/s13_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m8_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m8_axis] [get_bd_intf_pins usp_rf_data_converter_0/s20_axis]
  connect_bd_intf_net -intf_net rfsoc_pl_ctrl_verilo_0_m9_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/m9_axis] [get_bd_intf_pins usp_rf_data_converter_0/s21_axis]
  connect_bd_intf_net -intf_net sysref_in_1 [get_bd_intf_ports sysref_in] [get_bd_intf_pins usp_rf_data_converter_0/sysref_in]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m00_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s0_axis] [get_bd_intf_pins usp_rf_data_converter_0/m00_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m01_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s1_axis] [get_bd_intf_pins usp_rf_data_converter_0/m01_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m02_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s2_axis] [get_bd_intf_pins usp_rf_data_converter_0/m02_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m03_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s3_axis] [get_bd_intf_pins usp_rf_data_converter_0/m03_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m10_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s4_axis] [get_bd_intf_pins usp_rf_data_converter_0/m10_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m11_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s5_axis] [get_bd_intf_pins usp_rf_data_converter_0/m11_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m12_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s6_axis] [get_bd_intf_pins usp_rf_data_converter_0/m12_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m13_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s7_axis] [get_bd_intf_pins usp_rf_data_converter_0/m13_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m20_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s8_axis] [get_bd_intf_pins usp_rf_data_converter_0/m20_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m21_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s9_axis] [get_bd_intf_pins usp_rf_data_converter_0/m21_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m22_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s10_axis] [get_bd_intf_pins usp_rf_data_converter_0/m22_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m23_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s11_axis] [get_bd_intf_pins usp_rf_data_converter_0/m23_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m30_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s12_axis] [get_bd_intf_pins usp_rf_data_converter_0/m30_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m31_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s13_axis] [get_bd_intf_pins usp_rf_data_converter_0/m31_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m32_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s14_axis] [get_bd_intf_pins usp_rf_data_converter_0/m32_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_m33_axis [get_bd_intf_pins rfsoc_pl_ctrl_verilo_0/s15_axis] [get_bd_intf_pins usp_rf_data_converter_0/m33_axis]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout00 [get_bd_intf_ports vout00] [get_bd_intf_pins usp_rf_data_converter_0/vout00]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout01 [get_bd_intf_ports vout01] [get_bd_intf_pins usp_rf_data_converter_0/vout01]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout02 [get_bd_intf_ports vout02] [get_bd_intf_pins usp_rf_data_converter_0/vout02]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout03 [get_bd_intf_ports vout03] [get_bd_intf_pins usp_rf_data_converter_0/vout03]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout10 [get_bd_intf_ports vout10] [get_bd_intf_pins usp_rf_data_converter_0/vout10]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout11 [get_bd_intf_ports vout11] [get_bd_intf_pins usp_rf_data_converter_0/vout11]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout12 [get_bd_intf_ports vout12] [get_bd_intf_pins usp_rf_data_converter_0/vout12]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout13 [get_bd_intf_ports vout13] [get_bd_intf_pins usp_rf_data_converter_0/vout13]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout20 [get_bd_intf_ports vout20] [get_bd_intf_pins usp_rf_data_converter_0/vout20]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout21 [get_bd_intf_ports vout21] [get_bd_intf_pins usp_rf_data_converter_0/vout21]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout22 [get_bd_intf_ports vout22] [get_bd_intf_pins usp_rf_data_converter_0/vout22]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout23 [get_bd_intf_ports vout23] [get_bd_intf_pins usp_rf_data_converter_0/vout23]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout30 [get_bd_intf_ports vout30] [get_bd_intf_pins usp_rf_data_converter_0/vout30]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout31 [get_bd_intf_ports vout31] [get_bd_intf_pins usp_rf_data_converter_0/vout31]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout32 [get_bd_intf_ports vout32] [get_bd_intf_pins usp_rf_data_converter_0/vout32]
  connect_bd_intf_net -intf_net usp_rf_data_converter_0_vout33 [get_bd_intf_ports vout33] [get_bd_intf_pins usp_rf_data_converter_0/vout33]
  connect_bd_intf_net -intf_net vin00_1 [get_bd_intf_ports vin00] [get_bd_intf_pins usp_rf_data_converter_0/vin00]
  connect_bd_intf_net -intf_net vin01_1 [get_bd_intf_ports vin01] [get_bd_intf_pins usp_rf_data_converter_0/vin01]
  connect_bd_intf_net -intf_net vin02_1 [get_bd_intf_ports vin02] [get_bd_intf_pins usp_rf_data_converter_0/vin02]
  connect_bd_intf_net -intf_net vin03_1 [get_bd_intf_ports vin03] [get_bd_intf_pins usp_rf_data_converter_0/vin03]
  connect_bd_intf_net -intf_net vin10_1 [get_bd_intf_ports vin10] [get_bd_intf_pins usp_rf_data_converter_0/vin10]
  connect_bd_intf_net -intf_net vin11_1 [get_bd_intf_ports vin11] [get_bd_intf_pins usp_rf_data_converter_0/vin11]
  connect_bd_intf_net -intf_net vin12_1 [get_bd_intf_ports vin12] [get_bd_intf_pins usp_rf_data_converter_0/vin12]
  connect_bd_intf_net -intf_net vin13_1 [get_bd_intf_ports vin13] [get_bd_intf_pins usp_rf_data_converter_0/vin13]
  connect_bd_intf_net -intf_net vin20_1 [get_bd_intf_ports vin20] [get_bd_intf_pins usp_rf_data_converter_0/vin20]
  connect_bd_intf_net -intf_net vin21_1 [get_bd_intf_ports vin21] [get_bd_intf_pins usp_rf_data_converter_0/vin21]
  connect_bd_intf_net -intf_net vin22_1 [get_bd_intf_ports vin22] [get_bd_intf_pins usp_rf_data_converter_0/vin22]
  connect_bd_intf_net -intf_net vin23_1 [get_bd_intf_ports vin23] [get_bd_intf_pins usp_rf_data_converter_0/vin23]
  connect_bd_intf_net -intf_net vin30_1 [get_bd_intf_ports vin30] [get_bd_intf_pins usp_rf_data_converter_0/vin30]
  connect_bd_intf_net -intf_net vin31_1 [get_bd_intf_ports vin31] [get_bd_intf_pins usp_rf_data_converter_0/vin31]
  connect_bd_intf_net -intf_net vin32_1 [get_bd_intf_ports vin32] [get_bd_intf_pins usp_rf_data_converter_0/vin32]
  connect_bd_intf_net -intf_net vin33_1 [get_bd_intf_ports vin33] [get_bd_intf_pins usp_rf_data_converter_0/vin33]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM0_FPD [get_bd_intf_pins ps8_0_axi_periph/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_FPD]

  # Create port connections
  connect_bd_net -net axi_dma_0_mm2s_introut [get_bd_pins axi_dma_0/mm2s_introut] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net axi_dma_0_s2mm_introut [get_bd_pins axi_dma_0/s2mm_introut] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net axi_gpio_0_gpio_io_o [get_bd_pins axi_gpio_0/gpio_io_o] [get_bd_pins gpio_buffer_0/gpio_in]
  connect_bd_net -net gpio_buffer_0_gpio_out [get_bd_pins gpio_buffer_0/gpio_out] [get_bd_pins rfsoc_pl_ctrl_verilo_0/gpio_ctrl]
  connect_bd_net -net rst_ps8_0_100M1_peripheral_aresetn [get_bd_pins axis_data_pl_to_ps_fifo/s_axis_aresetn] [get_bd_pins rfsoc_pl_ctrl_verilo_0/rst] [get_bd_pins rst_ps8_0_100M1/peripheral_aresetn] [get_bd_pins usp_rf_data_converter_0/m0_axis_aresetn] [get_bd_pins usp_rf_data_converter_0/m1_axis_aresetn] [get_bd_pins usp_rf_data_converter_0/m2_axis_aresetn] [get_bd_pins usp_rf_data_converter_0/m3_axis_aresetn] [get_bd_pins usp_rf_data_converter_0/s0_axis_aresetn] [get_bd_pins usp_rf_data_converter_0/s1_axis_aresetn] [get_bd_pins usp_rf_data_converter_0/s2_axis_aresetn] [get_bd_pins usp_rf_data_converter_0/s3_axis_aresetn]
  connect_bd_net -net rst_ps8_0_100M_peripheral_aresetn [get_bd_pins axi_dma_0/axi_resetn] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_smc/aresetn] [get_bd_pins axis_data_ps_to_pl_fifo/s_axis_aresetn] [get_bd_pins axis_gpio_async_fifo/s_axis_aresetn] [get_bd_pins ps8_0_axi_periph/ARESETN] [get_bd_pins ps8_0_axi_periph/M00_ARESETN] [get_bd_pins ps8_0_axi_periph/M01_ARESETN] [get_bd_pins ps8_0_axi_periph/M02_ARESETN] [get_bd_pins ps8_0_axi_periph/S00_ARESETN] [get_bd_pins rst_ps8_0_100M/peripheral_aresetn] [get_bd_pins rst_ps8_0_100M1/ext_reset_in] [get_bd_pins usp_rf_data_converter_0/s_axi_aresetn]
  connect_bd_net -net usp_rf_data_converter_0_clk_dac0 [get_bd_pins axis_data_pl_to_ps_fifo/s_axis_aclk] [get_bd_pins axis_data_ps_to_pl_fifo/m_axis_aclk] [get_bd_pins axis_gpio_async_fifo/m_axis_aclk] [get_bd_pins rfsoc_pl_ctrl_verilo_0/clk] [get_bd_pins rst_ps8_0_100M1/slowest_sync_clk] [get_bd_pins usp_rf_data_converter_0/clk_dac0] [get_bd_pins usp_rf_data_converter_0/m0_axis_aclk] [get_bd_pins usp_rf_data_converter_0/m1_axis_aclk] [get_bd_pins usp_rf_data_converter_0/m2_axis_aclk] [get_bd_pins usp_rf_data_converter_0/m3_axis_aclk] [get_bd_pins usp_rf_data_converter_0/s0_axis_aclk] [get_bd_pins usp_rf_data_converter_0/s1_axis_aclk] [get_bd_pins usp_rf_data_converter_0/s2_axis_aclk] [get_bd_pins usp_rf_data_converter_0/s3_axis_aclk]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins xlconcat_0/dout] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq0]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_clk0 [get_bd_pins axi_dma_0/m_axi_mm2s_aclk] [get_bd_pins axi_dma_0/m_axi_s2mm_aclk] [get_bd_pins axi_dma_0/m_axi_sg_aclk] [get_bd_pins axi_dma_0/s_axi_lite_aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_smc/aclk] [get_bd_pins axis_data_pl_to_ps_fifo/m_axis_aclk] [get_bd_pins axis_data_ps_to_pl_fifo/s_axis_aclk] [get_bd_pins axis_gpio_async_fifo/s_axis_aclk] [get_bd_pins ps8_0_axi_periph/ACLK] [get_bd_pins ps8_0_axi_periph/M00_ACLK] [get_bd_pins ps8_0_axi_periph/M01_ACLK] [get_bd_pins ps8_0_axi_periph/M02_ACLK] [get_bd_pins ps8_0_axi_periph/S00_ACLK] [get_bd_pins rst_ps8_0_100M/slowest_sync_clk] [get_bd_pins usp_rf_data_converter_0/s_axi_aclk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/pl_clk0] [get_bd_pins zynq_ultra_ps_e_0/saxihpc0_fpd_aclk]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_resetn0 [get_bd_pins rst_ps8_0_100M/ext_reset_in] [get_bd_pins zynq_ultra_ps_e_0/pl_resetn0]

  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_DDR_LOW] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_DDR_LOW] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_QSPI] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_QSPI] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_QSPI] -force
  assign_bd_address -offset 0xA0000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA0010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] -force
  assign_bd_address -offset 0xA0040000 -range 0x00040000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs usp_rf_data_converter_0/s_axi/Reg] -force

  # Exclude Address Segments
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP0/HPC0_LPS_OCM]


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


