
#include "cmd_handler.h"
#include "xgpio.h"
#include "uart.h"
#include "gpio.h"
#include "dma.h"
#include "rf.h"

//Command definitions
#define CMD_PREAMBLE 0xAA
#define CMD_ACK 0x00
#define CMD_SELECT_CHANNEL 0x00 //next 1 byte is channel number
#define CMD_SET_RUN_CYCLES 0x01 //next 8 bytes are the number of run cycles, lsb first
#define CMD_SET_MASK 0x02 //next 32 bytes are the mask, loaded in the order in which they arrived
#define CMD_SET_PRE_DELAY 0x03 //next 8 bytes are the number of run cycles, lsb first
#define CMD_SET_POST_DELAY 0x04 //next 8 bytes are the number of run cycles, lsb first
#define CMD_SET_LOCKING_WAVEFORM 0x05 //next 32 bytes are the mask, loaded in the order in which they arrived
#define CMD_SET_MUX_SEL 0x06 //next 1 byte is loaded into mux sel register, should be 0 or 0xFF
#define CMD_SET_MASK_ENABLE 0x07 //next 1 byte is loaded into mask enable register, should be 0 or 0xFF
#define CMD_SET_ADC_RUN_CYCLES 0x08 //next 8 bytes are the number of run cycles, lsb first
#define CMD_SET_ADC_SHIFT 0x09 //next 8 bytes is shift value, lsb first
#define CMD_FLUSH_BUFFERS 0x0A //Flushes all DAC and ADC buffers immediately
#define CMD_WRITE_AXIS 0x0B //Next 4 bytes are assembled into 32-bit word and written out to DACs
#define CMD_READ_AXIS 0x0C //One 32-bit ADC word is read from selected ADC and retuned as 4 bytes
#define CMD_CHECK_CLOCKS 0x0D //Returns 1 byte containing status of DAC clocks in first bit and status of ADC clocks in second bit
#define CMD_SET_ADC_DUMMY_DATA 0x0E //Turns on dummy data mode for ADC
#define CMD_SET_ADC_READOUT 0x0F
#define CMD_PING_BOARD 0x10



//cmd handler state definitions
#define state_idle 0
#define state_wait_cmd_byte 1
#define state_wait_payload 2
#define state_send_payload 3//For reading out ADCs

u8 cmd_handler_state; //Current state of cmd handler state machine
u8 cmd_byte;
u8 bytes_to_receive;//Number of bytes to wait for after command byte

//Entry point for embedded ARM processor
void cmd_handler_handoff()
{
	cmd_init();
	
	while(1)
	{
		cmd_handle_command();
	}
}


void cmd_handle_command()
{
	u8 ret_val = 0;
	u8 ret_byte = CMD_ACK;
	u32 adc_word = 0;

	switch(cmd_handler_state)
	{
		case state_idle:
		
			//Check to see if there is a preamble byte waiting
			if(uart_get_buffer_size())
			{
				//Check to see if the byte is correct
				u8 p_b = uart_get_buffer_byte();
				if(p_b == CMD_PREAMBLE)
				{
					//Preamble byte is correct, we can move on to the next state
					cmd_handler_state = state_wait_cmd_byte;
				}
				else
				{
					xil_printf("Got bad preamble byte: 0x%x\r\n", p_b);
				}
			}
		
		break;
		
		case state_wait_cmd_byte:
		
			//If there's a byte waiting for us
			if(uart_get_buffer_size())
			{
				//Read the command byte out of the buffer
				cmd_byte = uart_get_buffer_byte();
				
				switch(cmd_byte)
				{
					//1 byte cases
					case CMD_SELECT_CHANNEL:
					case CMD_SET_MASK_ENABLE:
					case CMD_SET_MUX_SEL:
					case CMD_SET_ADC_DUMMY_DATA:
					case CMD_SET_ADC_READOUT:
						bytes_to_receive = 1;
						cmd_handler_state = state_wait_payload;
					break;
					//4 byte case
					case CMD_WRITE_AXIS:
						bytes_to_receive = 4;
						cmd_handler_state = state_wait_payload;
					break;
					//8 byte cases
					case CMD_SET_RUN_CYCLES:
					case CMD_SET_PRE_DELAY:
					case CMD_SET_POST_DELAY:
					case CMD_SET_ADC_RUN_CYCLES:
					case CMD_SET_ADC_SHIFT:
						bytes_to_receive = 8;
						cmd_handler_state = state_wait_payload;
					break;
					//32 byte cases
					case CMD_SET_MASK:
					case CMD_SET_LOCKING_WAVEFORM:
						bytes_to_receive = 8;
						cmd_handler_state = state_wait_payload;
						
					case CMD_FLUSH_BUFFERS:
						//Flush the buffers via GPIO
						gpio_flush_buffers();
						//Send an ACK
						uart_send_byte(CMD_ACK);
						cmd_handler_state = state_idle;
					break;
					
					case CMD_CHECK_CLOCKS:
						//Build the response byte
						ret_val = rf_get_dac_clock_status() & (rf_get_adc_clock_status() << 1);
						//Return the response
						uart_send_byte(ret_val);
						cmd_handler_state = state_idle;
					break;
						
					case CMD_READ_AXIS:
						
						ret_byte = CMD_ACK;
						//Read a single word from DMA
						if(dma_read_word(&adc_word))
						{
							ret_byte = 0x01;
						}
						//Send the ADC word first, lsb first
						for(int i = 0; i < 4; i = i + 1)
						{
							uart_send_byte((adc_word >> (i*8)) &0xFF);
						}
						uart_send_byte(ret_byte);
						cmd_handler_state = state_idle;
					break;
					
					case CMD_PING_BOARD:
						uart_send_byte(CMD_ACK);
						cmd_handler_state = state_idle;
					break;
					
					default:
						xil_printf("Unknown command byte: 0x%x\r\n", cmd_byte);
						cmd_handler_state = state_idle;
				}
			}
		
		break;
		
		
		
		
		case state_wait_payload:
		
			ret_byte = CMD_ACK;//To be set depending on command
		
			//If we've received the entire payload
			if(uart_get_buffer_size() >= bytes_to_receive)
			{
				//If we only need one byte
				if(bytes_to_receive == 1)
				{
					//Pull the single byte out of the buffer
					u8 payload_byte = uart_get_buffer_byte();
					switch(cmd_byte)
					{
						case CMD_SELECT_CHANNEL:
							gpio_select_channel(payload_byte);
						break;
						case CMD_SET_MASK_ENABLE:
							gpio_set_mask_en(payload_byte);
						break;
						case CMD_SET_MUX_SEL:
							gpio_set_mux_sel(payload_byte);
						break;
						case CMD_SET_ADC_DUMMY_DATA:
							gpio_set_adc_dummy_data(payload_byte);
						break;
						case CMD_SET_ADC_READOUT:
							gpio_set_adc_readout_enable(payload_byte);
						break;
					}
				}
				else if(bytes_to_receive == 4)
				{
					u32 dac_word = 0;
					for(int i = 0; i < 4; i = i + 1)
					{
						dac_word &= ((u32)uart_get_buffer_byte()) << (i*8);
					}
					//If we encounter an error writing to DMA
					if(dma_write_word(dac_word))
					{
						ret_byte = 0x01;//Make sure the python script knows it
					}
				}
				else if(bytes_to_receive == 8)
				{
					//Reassemble the 64-bit number
					u8 payload_64 = 0;
					for(int i = 0; i < 8; i = i + 1)
					{
						payload_64 &= ((u64)uart_get_buffer_byte()) << (i * 8);
					}
					
					switch(cmd_byte)
					{
						case CMD_SET_RUN_CYCLES:
							gpio_set_run_cycles(payload_64);
						break;
						case CMD_SET_PRE_DELAY:
							gpio_set_pre_delay_cycles(payload_64);
						break;
						case CMD_SET_POST_DELAY:
							gpio_set_post_delay_cycles(payload_64);
						break;
						case CMD_SET_ADC_RUN_CYCLES:
							gpio_set_adc_run_cycles(payload_64);
						break;
						case CMD_SET_ADC_SHIFT:
							gpio_set_adc_shift_val(payload_64);
						break;
					}
				}
				//Must have been a 32-byte payload
				else
				{
					//Assemble the payload into an array of samples
					u16 payload_array[16];
					for(int i = 0; i < 16; i = i + 1)
					{
						payload_array[i] = uart_get_buffer_byte();
						payload_array[i] &= (u16)uart_get_buffer_byte() << 8;
					}
					
					switch(cmd_byte)
					{
						case CMD_SET_MASK:
							gpio_set_mask(payload_array);
						break;
						case CMD_SET_LOCKING_WAVEFORM:
							gpio_set_locking_waveform(payload_array);
						break;
					}
				}
				
				//Send the ACK
				uart_send_byte(ret_byte);
				//Go back to waiting for the next command
				cmd_handler_state = state_idle;
			}
		
		break;
		
		default:
			cmd_handler_state = state_idle;
		break;
	}
	
	return;
}



//Initializes UART, GPIO and RFSOC
//Returns 0 on success
u8 cmd_init()
{
	cmd_handler_state = 0;
	cmd_byte = 0;
	bytes_to_receive = 0;

	print("Initializing peripherals...\r\n");

	if(gpio_init())
	{
		print("Failed to initialize GPIO!\r\n");
		return 1;
	}
	else
	{
		print("Successfully initialized GPIO!\r\n");
	}

	if(uart_init_interrupt() != 0)
	{
		print("Failed to initialize UART!\r\n");
		return 1;
	}
	else
	{
		print("Successfully initialized UART!\r\n");
	}

	if(rf_init())
	{
		print("Failed to initialize RF components!\r\n");
	}
	else
	{
		print("Successfully initialized RF components!\r\n");
	}

	print("Finished initializing peripherals\r\n");
	//Clear the buffer once
	uart_clear_buffer();

	if(rf_get_adc_clock_status())
	{
		print("No running clock detected for ADC!\r\n");
	}
	if(rf_get_dac_clock_status())
	{
		print("No running clock detected for DAC!\r\n");
	}

	return 0;

}


