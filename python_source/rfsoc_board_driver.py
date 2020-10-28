

#Low level driver used to communicate with RFSoC firmware over UART


import serial


#Constants
UART_TIMEOUT = 3 #in seconds
BAUDRATE = 115200

#Command definitions
CMD_PREAMBLE = 0xAA
CMD_ACK = 0x00
CMD_SELECT_CHANNEL = 0x00 #next 1 byte is channel number
CMD_SET_RUN_CYCLES = 0x01 #next 8 bytes are the number of run cycles, lsb first
CMD_SET_MASK = 0x02 #next 32 bytes are the mask, loaded in the order in which they arrived
CMD_SET_PRE_DELAY = 0x03 #next 8 bytes are the number of run cycles, lsb first
CMD_SET_POST_DELAY = 0x04 #next 8 bytes are the number of run cycles, lsb first
CMD_SET_LOCKING_WAVEFORM = 0x05 #next 32 bytes are the mask, loaded in the order in which they arrived
CMD_SET_MUX_SEL = 0x06 #next 1 byte is loaded into mux sel register, should be 0 or = 0xFF
CMD_SET_MASK_ENABLE = 0x07 #next 1 byte is loaded into mask enable register, should be 0 or = 0xFF
CMD_SET_ADC_RUN_CYCLES = 0x08 #next 8 bytes are the number of run cycles, lsb first
CMD_SET_ADC_SHIFT = 0x09 #next 8 bytes is shift value, lsb first
CMD_FLUSH_BUFFERS = 0x0A #Flushes all DAC and ADC buffers immediately
CMD_WRITE_AXIS = 0x0B #Next 4 bytes are assembled into 32-bit word and written out to DACs
CMD_READ_AXIS = 0x0C #One 32-bit ADC word is read from selected ADC and retuned as 4 bytes
CMD_CHECK_CLOCKS = 0x0D #Returns 1 byte containing status of DAC clocks in first bit and status of ADC clocks in second bit
CMD_SET_ADC_DUMMY_DATA = 0x0E #Turns on dummy data mode for ADC
CMD_SET_ADC_READOUT = 0x0F
CMD_PING_BOARD = 0x10

class rfsoc_board:


    port = None
    

    def __init__(self, portname):
    
        self.port = serial.Serial()
        self.port.baudrate = BAUDRATE
        self.port.port = portname
        self.port.timeout = UART_TIMEOUT
        
        #Open the port here
        self.port.open()
    
    
    
    def __del__(self):
    
        self.port.close()
        
    #Waits for a single byte to be received and returns it, returns -1 on error
    def wait_ack(self):
        try:
            retval = self.port.read(1)
            return retval[0]
        except:
            print("Bad ACK received from FPGA board");
            return -1
    
    #Returns 0 if board is up, 1 otherwise
    def ping_board(self):
        
        self.port.write([CMD_PREAMBLE, CMD_PING_BOARD])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1
    
    #Returns 0 on success
    def select_channel(self, channel_num):
        
        if(channel_num < 0 or channel_num > 15):
            print("Error, channel number must be between 0 and 15")
            return 1
        
        self.port.write([CMD_PREAMBLE, CMD_SELECT_CHANNEL, channel_num & 0xFF])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1
        
    #Run cycles in clock cycles (1 cycle = 4ns)
    #Returns 0 on success
    def set_run_cycles(self, num_cycles):
    
        bytes_list = list((num_cycles).to_bytes(8, byteorder='little', signed = False))
        self.port.write([CMD_PREAMBLE, CMD_SET_RUN_CYCLES])
        self.port.write(bytes_list)
        
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #mask_sample is a 16 entry list of 16-bit samples
    def set_mask(self, mask_samples):
    
        if(len(mask_samples) != 16):
            print("Error, mask samples array must be exactly 16 samples long");
            return 1
        
        bytes_list = []
        
        #Create the array of mask bytes to be sent to the FPGA
        for m in mask_samples:
            high_byte = (m>>8)&0xFF
            low_byte = m&0xFF
            bytes_list.append(low_byte)
            bytes_list.append(high_byte)
            
        self.port.write([CMD_PREAMBLE, CMD_SET_MASK])
        self.port.write(bytes_list)
        
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #pre_delay is in clock cycles
    #Returns 0 on success
    def set_pre_delay(self, pre_delay):
    
        bytes_list = list((pre_delay).to_bytes(8, byteorder='little', signed = False))
        self.port.write([CMD_PREAMBLE, CMD_SET_PRE_DELAY])
        self.port.write(bytes_list)
        
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1
    
    #post_delay is in clock cycles
    #returns 0 on success
    def set_post_delay(self, post_delay):
    
        bytes_list = list((post_delay).to_bytes(8, byteorder='little', signed = False))
        self.port.write([CMD_PREAMBLE, CMD_SET_POST_DELAY])
        self.port.write(bytes_list)
        
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1
    
    #locking samples is a 16 entry list of 16-bit samples
    def set_locking_waveform(self, locking_samples):
    
        if(len(locking_samples) != 16):
            print("Error, mask samples array must be exactly 16 samples long");
            return 1
        
        bytes_list = []
        
        #Create the array of mask bytes to be sent to the FPGA
        for m in mask_locking:
            high_byte = (m>>8)&0xFF
            low_byte = m&0xFF
            bytes_list.append(low_byte)
            bytes_list.append(high_byte)
            
        self.port.write([CMD_PREAMBLE, CMD_SET_LOCKING_WAVEFORM])
        self.port.write(bytes_list)
        
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #returns 0 on success
    def set_mux_sel(self, mux_sel):
    
        mux_sel_byte = 0x00
        if(mux_sel):
            mux_sel_byte = 0xFF
            
        self.port.write([CMD_PREAMBLE, CMD_SET_MUX_SEL, mux_sel_byte])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #Returns 0 on success
    def set_mask_enable(self, mask_en):
    
        mask_en_byte = 0x00
        if(mask_en):
            mux_sel_byte = 0xFF
            
        self.port.write([CMD_PREAMBLE, CMD_SET_MASK_ENABLE, mux_sel_byte])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #Returns 0 on success
    def set_adc_run_cycles(self, adc_run_cycles):
    
        bytes_list = list((adc_run_cycles).to_bytes(8, byteorder='little', signed = False))
        self.port.write([CMD_PREAMBLE, CMD_SET_ADC_RUN_CYCLES])
        self.port.write(bytes_list)
        
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #ADC samples are averaged over 2^adc_shift captures
    #Returns 0 on success
    def set_adc_shift(self, adc_shift):

        bytes_list = list((adc_shift).to_bytes(8, byteorder='little', signed = False))
        self.port.write([CMD_PREAMBLE, CMD_SET_ADC_SHIFT])
        self.port.write(bytes_list)
        
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #Flushes all ADC and DAC buffers
    def flush_buffers(self):
    
        self.port.write([CMD_PREAMBLE, CMD_FLUSH_BUFFERS])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #Returns dac clock status (0 if ok) and then adc clock status (0 if ok)
    def check_clocks(self):
        
        self.port.write([CMD_PREAMBLE, CMD_CHECK_CLOCKS])
        
        res = self.port.read(1)
        clock_byte = res[0]
        dac_status = clock_byte & 0x01
        adc_status = clock_byte & 0x02
        
        return dac_status, adc_status
    
    #If set, all ADC data will be a known pattern (see adc_driver.sv)
    #Returns 0 on success
    def set_adc_dummy_data(self, val):
    
        self.port.write([CMD_PREAMBLE, CMD_SET_ADC_DUMMY_DATA, val & 0xFF])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #If set, ADC readout is enabled
    #Returns 0 on success
    def set_adc_readout(self, val):
    
        self.port.write([CMD_PREAMBLE, CMD_SET_ADC_READOUT, val & 0xFF])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1
    
    



