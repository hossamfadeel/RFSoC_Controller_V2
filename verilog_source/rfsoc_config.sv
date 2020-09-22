
//Package with parameters for RFSoC RLT compoents


package rfsoc_config;

//Flags for determining where to load/store things from
localparam [7:0] 
zero = 0,//source
a_reg = 1,//source/dest
x_reg = 2,//source/dest
y_reg = 3,//source/dest
mem_load = 4,//source
mem_store = 5,//dest
imm = 6,//source
one = 7,//Source
status_reg = 8,
stack_reg = 9;

localparam [7:0]
sdata = 0,//Shared between all configuration registers
mask_clk = 1;//Serial clk used to set masking register for beginning / end of waveform



endpackage