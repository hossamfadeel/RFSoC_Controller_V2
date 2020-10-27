
#ifndef _GPIO_H_
#define _GPIO_H_

#include "xgpio.h"

//GPIO pinout definitions
#define sdata 0 //Shared between all configuration registers
#define mask_clk 1 //Serial clk used to set masking register for beginning / end of waveform
#define channel_sel_clk 2 //16-bit 1 hot selection register used to talk to a specific channel
#define cycle_count_clk 3 //counts how many cycles we run for  256 bits
#define mux_set_clk 4 //1-bit shift register to set the state of the mux for this channel
#define pl_rst 5 //GPIO line used to hard-reset FPGA fabric
#define trigger_line 6 //Used to trigger DACs and ADCs from PS
#define adc_shift_val_clk 7  //Used to set how many averages the ADC will perform
#define adc_num_cycle_count_clk 8 //Used to set how many cycles the ADC will run for
#define pre_delay_cycle_clk 9 //used to set how many clock cycles dac ctrl will wait after being triggered
#define post_delay_cycle_clk 10 //used to set how many clock cycles dac ctrl will wait after being triggered
#define locking_waveform_clk 11 //Used to set locking cycle waveform
#define mask_enable_clk 12 //Enables or disables mask
#define adc_buffer_flush 13 //Forces flush on all ADC buffers and DAC buffers
#define adc_use_dummy_data 14 //Causes ADC to return known data pattern
#define adc_readout_enable 15//Must be 1 for CPU to be able to read data from ADC buffers

#define config_reg_width 32



//Function Headers///////////////////////////
u8 gpio_init();
void gpio_set_pin(u8 pin_num, u8 value);

void gpio_select_channel(u8 channel_num);
void gpio_set_run_cycles(u64 num_cycles);
void gpio_set_mask(u16* mask_samples);
void gpio_set_pre_delay_cycles(u64 num_cycles);
void gpio_set_post_delay_cycles(u64 num_cycles);
void gpio_set_locking_waveform(u16* locking_samples);
void gpio_set_mux_sel(u8 val);
void gpio_set_mask_en(u8 val);
void gpio_set_adc_run_cycles(u64 num_cycles);
void gpio_set_adc_shift_val(u64 val);
void gpio_flush_buffers();
void gpio_set_adc_dummy_data(u8 val);
void gpio_set_adc_readout_enable(u8 val);

/////////////////////////////////////////////

#endif
