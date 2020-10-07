
//Package with parameters for RFSoC RLT compoents


package rfsoc_config;


parameter dac_stop_channel = 17;//Any channels higher than this number will receive reduced FIFO memory
parameter dac_fifo_mem_width = 16;
parameter adc_fifo_mem_width = 16;
parameter config_reg_width = 256;//changes width of run cycle count, delay cycle count
parameter gpio_bus_width = 16;//Width of GPIO control bus
parameter ps_axis_width = 32;//Width of AXIS bus used to load/unload data to/from PL


//GPIO bus definitions
localparam [7:0]
sdata = 0,//Shared between all configuration registers
mask_clk = 1,//Serial clk used to set masking register for beginning / end of waveform
channel_sel_clk = 2,//16-bit 1 hot selection register used to talk to a specific channel
cycle_count_clk = 3,//counts how many cycles we run for, 256 bits
mux_set_clk = 4,//1-bit shift register to set the state of the mux for this channel
pl_rst = 5,//GPIO line used to hard-reset FPGA fabric
trigger_line = 6,//Used to trigger DACs and ADCs from PS
adc_shift_val_clk = 7, //Used to set how many averages the ADC will perform
adc_num_cycle_count_clk = 8,//Used to set how many cycles the ADC will run for
pre_delay_cycle_clk = 9,//used to set how many clock cycles dac ctrl will wait after being triggered
post_delay_cycle_clk = 10,//used to set how many clock cycles dac ctrl will wait after being triggered
locking_waveform_clk = 11,//Used to set locking cycle waveform
mask_enable_clk = 12,//Enables or disables mask
adc_buffer_flush = 13;//Forces flush on all ADC buffers


endpackage