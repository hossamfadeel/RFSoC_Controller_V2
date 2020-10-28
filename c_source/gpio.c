

#include "gpio.h"
#include "xgpio.h"


#define GPIO_EXAMPLE_DEVICE_ID  XPAR_GPIO_0_DEVICE_ID

XGpio Gpio; /* The Instance of the GPIO Driver */


u32 gpio_state;

//Returns 0 on success
u8 gpio_init()
{

	gpio_state = 0;

	if (XGpio_Initialize(&Gpio, GPIO_EXAMPLE_DEVICE_ID) != XST_SUCCESS)
	{
		return 1;
	}

	//set channel 1 to be all outputs
	XGpio_SetDataDirection(&Gpio, 1, 0);


	//Turn all outputs off by default
	XGpio_DiscreteWrite(&Gpio, 1, 0);


	return 0;

}

void gpio_set_pin(u8 bit, u8 value)
{

	u32 new_gpio_state;
	if(value){
		new_gpio_state = gpio_state | (0x01 << bit);
	}
	else
	{
		new_gpio_state = gpio_state & ~(0x01 << bit);
	}

	XGpio_DiscreteWrite(&Gpio, 1, new_gpio_state);
	gpio_state = new_gpio_state;

}

//Selects a DAC or ADC channel for configuration over the GPIO bus
void gpio_select_channel(u8 channel_num)
{
	for(int i = 0; i < 16; i = i + 1)
	{
		gpio_set_pin(sdata, i == channel_num ? 1 : 0);
		gpio_set_pin(channel_sel_clk, 1);
		gpio_set_pin(channel_sel_clk, 0);
	}
}

//Sets the number of cycles to playback the waveform for 
void gpio_set_run_cycles(u64 num_cycles)
{
	for(int i = 0; i < config_reg_width; i = i + 1)
	{
		gpio_set_pin(sdata, num_cycles & (1 << i) ? 1 : 0);
		gpio_set_pin(cycle_count_clk, 1);
		gpio_set_pin(cycle_count_clk, 0);
	}
}

void gpio_set_mask(u16* mask_samples)
{
	for(int j = 0; j < 16; j = j + 1)
	{
		u16 curr_sample = mask_samples[j];
		for(int i = 0; i < 16; i = i + 1)
		{
			gpio_set_pin(sdata, curr_sample & (1 << i) ? 1 : 0);
			gpio_set_pin(mask_clk, 1);
			gpio_set_pin(mask_clk, 0);
		}
	}
}

void gpio_set_pre_delay_cycles(u64 num_cycles)
{
	for(int i = 0; i < config_reg_width; i = i + 1)
	{
		gpio_set_pin(sdata, num_cycles & (1 << i) ? 1 : 0);
		gpio_set_pin(pre_delay_cycle_clk, 1);
		gpio_set_pin(pre_delay_cycle_clk, 0);
	}
}


void gpio_set_post_delay_cycles(u64 num_cycles)
{
	for(int i = 0; i < config_reg_width; i = i + 1)
	{
		gpio_set_pin(sdata, num_cycles & (1 << i) ? 1 : 0);
		gpio_set_pin(post_delay_cycle_clk, 1);
		gpio_set_pin(post_delay_cycle_clk, 0);
	}
}

void gpio_set_locking_waveform(u16* locking_samples)
{
	for(int j = 0; j < 16; j = j + 1)
	{
		u16 curr_sample = locking_samples[j];
		for(int i = 0; i < 16; i = i + 1)
		{
			gpio_set_pin(sdata, curr_sample & (1 << i) ? 1 : 0);
			gpio_set_pin(locking_waveform_clk, 1);
			gpio_set_pin(locking_waveform_clk, 0);
		}
	}
}

void gpio_set_mux_sel(u8 val)
{
	gpio_set_pin(sdata, val);
	for(int i = 0; i < 8; i = i + 1)
	{
		gpio_set_pin(mux_set_clk, 1);
		gpio_set_pin(mux_set_clk, 0);
	}
}

void gpio_set_mask_en(u8 val)
{
	gpio_set_pin(sdata, val);
	for(int i = 0; i < 8; i = i + 1)
	{
		gpio_set_pin(mask_enable_clk, 1);
		gpio_set_pin(mask_enable_clk, 0);
	}
}

void gpio_set_adc_run_cycles(u64 num_cycles)
{
	for(int i = 0; i < config_reg_width; i = i + 1)
	{
		gpio_set_pin(sdata, num_cycles & (1 << i) ? 1 : 0);
		gpio_set_pin(adc_num_cycle_count_clk, 1);
		gpio_set_pin(adc_num_cycle_count_clk, 0);
	}
}

void gpio_set_adc_shift_val(u64 val)
{
	for(int i = 0; i < config_reg_width; i = i + 1)
	{
		gpio_set_pin(sdata, val & (1 << i) ? 1 : 0);
		gpio_set_pin(adc_shift_val_clk, 1);
		gpio_set_pin(adc_shift_val_clk, 0);
	}
}

void gpio_flush_buffers()
{
	for(int i = 0; i < 100; i = i + 1)
	{
		gpio_set_pin(adc_buffer_flush, 1);
	}
	gpio_set_pin(adc_buffer_flush, 0);
}


void gpio_set_adc_dummy_data(u8 val)
{
	gpio_set_pin(adc_use_dummy_data, val ? 1 : 0);
}

void gpio_set_adc_readout_enable(u8 val)
{
	gpio_set_pin(adc_readout_enable, val ? 1 : 0);
}

