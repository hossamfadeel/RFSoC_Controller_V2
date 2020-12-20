# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\repos\RFSoC_Controller_V2\vitis_workspace\rfsoc_v2_application_system\_ide\scripts\systemdebugger_no_fpga_flash_standalone.tcl
# 
# 
# Usage with xsct:
# In an external shell use the below command and launch symbol server.
# symbol_server.bat -S -s tcp::1534
# To debug using xsct, launch xsct and run below command
# source D:\repos\RFSoC_Controller_V2\vitis_workspace\rfsoc_v2_application_system\_ide\scripts\systemdebugger_no_fpga_flash_standalone.tcl
# 
connect -path [list tcp::1534 tcp:192.168.3.2:3121]
source C:/Xilinx/Vitis/2020.2/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -nocase -filter {name =~"APU*"}
reset_apu
targets -set -nocase -filter {name =~"RPU*"}
clear_rpu_reset
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT2NC 210308A5F038" && level==0 && jtag_device_ctx=="jsn-JTAG-SMT2NC-210308A5F038-147e2093-0"}
fpga -file D:/repos/RFSoC_Controller_V2/vitis_workspace/rfsoc_v2_application/_ide/bitstream/top_level_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw D:/repos/RFSoC_Controller_V2/vitis_workspace/rfsoc_v2_platform/export/rfsoc_v2_platform/hw/top_level_wrapper.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow D:/repos/RFSoC_Controller_V2/vitis_workspace/rfsoc_v2_platform/export/rfsoc_v2_platform/sw/rfsoc_v2_platform/boot/fsbl.elf
set bp_19_9_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_19_9_fsbl_bp
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow D:/repos/RFSoC_Controller_V2/vitis_workspace/rfsoc_v2_application/Debug/rfsoc_v2_application.elf
configparams force-mem-access 0
bpadd -addr &main
