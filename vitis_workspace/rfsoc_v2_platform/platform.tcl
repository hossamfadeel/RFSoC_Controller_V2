# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\repos\RFSoC_Controller_V2\vitis_workspace\rfsoc_v2_platform\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\repos\RFSoC_Controller_V2\vitis_workspace\rfsoc_v2_platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {rfsoc_v2_platform}\
-hw {D:\repos\RFSoC_Controller_V2\vivado_project\top_level_wrapper.xsa}\
-proc {psu_cortexa53_0} -os {standalone} -arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {D:/repos/RFSoC_Controller_V2/vitis_workspace}

platform write
platform generate -domains 
bsp reload
bsp config stdin "psu_coresight_0"
bsp config stdout "psu_coresight_0"
bsp write
bsp reload
catch {bsp regenerate}
platform generate
platform config -updatehw {D:/repos/RFSoC_Controller_V2/vivado_project/top_level_wrapper.xsa}
platform generate -domains 
platform generate -domains standalone_domain 
platform generate -domains standalone_domain 
domain active {zynqmp_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
platform generate -domains 
platform active {rfsoc_v2_platform}
platform config -updatehw {D:/repos/RFSoC_Controller_V2/vivado_project/top_level_wrapper.xsa}
platform generate -domains 
domain active {zynqmp_fsbl}
bsp reload
platform config -updatehw {D:/repos/RFSoC_Controller_V2/vivado_project/top_level_wrapper.xsa}
platform generate -domains 
platform config -updatehw {D:/repos/RFSoC_Controller_V2/vivado_project/top_level_wrapper.xsa}
platform generate -domains 
platform config -updatehw {D:/repos/RFSoC_Controller_V2/vivado_project/top_level_wrapper.xsa}
platform generate -domains 
platform config -updatehw {D:/repos/RFSoC_Controller_V2/vivado_project/top_level_wrapper.xsa}
platform generate -domains 
platform config -updatehw {D:/repos/RFSoC_Controller_V2/vivado_project/top_level_wrapper.xsa}
platform generate -domains 
