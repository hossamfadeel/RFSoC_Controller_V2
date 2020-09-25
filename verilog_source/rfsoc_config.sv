
//Package with parameters for RFSoC RLT compoents


package rfsoc_config;

//GPIO bus definitions
localparam [7:0]
sdata = 0,//Shared between all configuration registers
mask_clk = 1,//Serial clk used to set masking register for beginning / end of waveform
sel_clk = 2,//16-bit 1 hot selection register used to talk to a specific channel
cycle_count_clk = 3,//counts how many cycles we run for, 256 bits
mux_set_clk = 4,//1-bit shift register to set the state of the mux for this channel
pl_rst = 5,//GPIO line used to hard-reset FPGA fabric



endpackage