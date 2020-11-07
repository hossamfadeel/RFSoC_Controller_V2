

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
CMD_TRIGGER = 0x11

#########################################
#Low-level hardware driver for the board#
#########################################
class rfsoc_board_driver:


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
    
    #Returns 1 on success
    def trigger(self):
        self.port.write([CMD_PREAMBLE, CMD_TRIGGER])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1
        
    #Word is 32-bit dac word
    #Returns 0 on success
    def write_axis_word(self, word):
        
        bytes_list = list((word).to_bytes(4, byteorder='little', signed = False))
        self.port.write([CMD_PREAMBLE, CMD_WRITE_AXIS, bytes_list])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1
 
 
#####################################################################################
#class for the high level driver which implements channel configuration and whatnot##
#####################################################################################
class rfsoc_board:

    #instance of rfsoc_board_driver
    board_driver = None
    
    #list of channel objects used to configure the board
    channel_list = None
    
    #Used for keeping track of how many times an ADC channel has been triggered
    class adc_tracker:
    
        shift_val = 0
        num_triggers = 0
    
    #List of ADC tracker objects
    adc_trackers = []
    
    def __init__(self):
        
        #Initialize the list of ADC channels being tracked
        for i in range(0, 16):
            at = adc_tracker.adc_tracker()
            at.shift_val = 0
            at.num_triggers = -1 #If we see this value we know the channel was never configured
            adc_trackers.append(at)
            
    
        return
        
    #Returns 0 on success
    #If dummy data is set, ADCs will return dummy data
    def configure_all_channels(self, dummy_adc = 0):

        #Flush the buffers and disable adc readout
        

    
    #Returns 0 on success, channel should be an instance of rfsoc_channel of type DAC
    def configure_dac_channel(self, channel):
    
        #Select the channel number first
        if(self.board_driver.select_channel(channel.channel_num)):
            print("Error while trying to select channel, aborting DAC channel configuration")
            return 1
        #Set the mux select to 0 to permit uploaded
        if(self.board_driver.set_mux_sel(0)):
            print("Error while trying to clear DAC mux sel, aborting DAC channel configuration")
            return 1
            
        #Set mask enable
        if(self.board_driver.set_mask_enable(channel.mask_enable)):
            print("Error while trying to set mask enable, aborting DAC channel configuration")
            return 1
            
        #If we need to, upload the mask
        if(channel.mask_enable):
            if(self.board_driver.set_mask(channel.mask_samples)):
                print("Error while trying to upload mask, aborting DAC channel configuration")
                return 1
        
        #Set the locking waveform
        if(self.board_driver.set_locking_waveform(channel.locking_waveform_samples)):
            print("Error while trying to set locking waveform, aborting DAC channel configuration")
            return 1
            
        #Set the pre_delay cycles
        if(self.board_driver.set_pre_delay(channel.pre_delay_cycles)):
            print("Error while trying to set pre delay cycles, aborting DAC channel configuration")
            return 1
            
        #Set the post delay cycles 
        if(self.board_driver.set_post_delay()):
            print("Error while trying to set post delay cycles, aborting DAC channel, configuration")
            return 1
        
        #Now we load the waveform in by putting samples together
        i = 0
        axis_words = [] #32-bit entries to be written to axis bus
        while(i < len(channel.waveform_samples)-1):
            
            #Swap i and i+1 if this is backwards
            new_sample = (channel.waveform_samples[i] << 16) | (channel.waveform_samples[i+1]
            axis_words.append(new_sample)
            i += 2;
        
        for a in axis_words:
            if(self.board_driver.write_word(a)):
                print("Error while trying to write DAC word to AXIS, aborting DAC channel configuration")
                return 1
                
        #Set the mux select to 1 to permit normal operation
        if(self.board_driver.set_mux_sel(1)):
            print("Error while trying to set DAC mux sel, aborting DAC channel configuration")
            return 1
            
        #success
        return 0
        
    
    def configure_adc_channel(self, channel):
        
        #Set up the tracker object for this channel
        self.adc_trackers[channel.channel_num].shift_val = channel.shift_val
        self.adc_trackers[channel.channel_num].num_triggers = 0
        
        #Select the channel number first
        if(self.board_driver.select_channel(channel.channel_num)):
            print("Error while trying to select channel, aborting ADC channel configuration")
            return 1
        #Then set the run cycles
        if(self.board_driver.set_adc_run_cycles(channel.adc_run_cycles)):
            print("Error while trying to set adc run cycles, aborting ADC channel configuration")
            return 1
        #Finally set the shift val
        if(self.board_driver.set_adc_shift(channel.adc_shift)):
            print("Error while trying to set adc shift val, aborting ADC channel configuration")
            return 1
        
        #success
        return 0
            
    #Triggers the FPGA once, returns 0 on success
    def trigger(self):

        #Trigger the board once
        if(self.board_driver.trigger()):
            print("Error while triggering board")
            return 1
        
        #Update the counters
        for at in self.adc_trackers
            at.num_triggers += 1
        return 0
    
    def readout_adc(self, channel):
    
        
    
class rfsoc_channel:

    #type is either "DAC" or "ADC"
    type = "DAC"

    #Parameters for DAC and ADC channels
    channel_num = 0 #between 0 and 15

    #Parameters to be set for this DAC channel on the FPGA
    mask_samples = [] #List of samples to be uploaded as the mask
    locking_waveform_samples = [] #list of samples to be uploaded as locking waveform
    mask_enable = 0 #Either 1 or 0, decides if we need the mask in the first place
    run_cycles = 0
    pre_delay_cycles = 0
    post_delay_cycles = 0
    waveform_samples = [] #16 bit entries

    #Parameters for ADC type channels
    shift_val = 0 #Used for doing 2 ^ shift_val averages when capturing
    adc_run_cycles = 0 #Sets how many cycles the ADC will record for

    