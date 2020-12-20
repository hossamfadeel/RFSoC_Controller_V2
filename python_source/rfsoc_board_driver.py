

#Low level driver used to communicate with RFSoC firmware over UART


import serial #Used to open serial ports for board communication
import pickle #Used for object serialization
import re #Used for waveform file readout
import numpy as np #Used for waveform formatting
import time

#Configuration file this object is saved to between script calls
config_filename = "rfsoc_config_file.dat"

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
CMD_DMA_DEBUG = 0x12 # debug purposes only

#########################################
#Low-level hardware driver for the board#
#########################################
class rfsoc_board_driver:


    port = None
    dummy_mode = 0 #If set to 0, all function succeed regardless of board state
    

    def __init__(self, portname, dm = 0):
    
        self.port = serial.Serial()
        self.port.baudrate = BAUDRATE
        self.port.port = portname
        self.port.timeout = UART_TIMEOUT
        self.dummy_mode = dm

        if(dm):
            print("WARNING: Initializing board driver in dummy mode!")

            
    def open_board(self):
        if(self.dummy_mode == 0):
            attempts = 0
            while(attempts < 100):
                try:
                    self.port.open()
                    return
                except:
                    if(attempts%10 == 0):
                        print("Failed to open serial port, trying attempt " + str(attempts+1))
                    time.sleep(0.1)
                    attempts += 1
            raise RuntimeError("Unable to open serial port for communication with FPGA.")
                
    def close_board(self):
        if(self.dummy_mode == 0):
            self.port.close()
        
    #Waits for a single byte to be received and returns it
    def wait_ack(self):
    
        retval = self.port.read(1)
        return retval[0]

    
    #Returns 0 if board is up, 1 otherwise
    def ping_board(self):
        
        if(self.dummy_mode):
            return 0
        
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
        
        if(self.dummy_mode):
            return 0
        
        self.port.write([CMD_PREAMBLE, CMD_SELECT_CHANNEL, channel_num & 0xFF])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1
        
    #Run cycles in clock cycles (1 cycle = 4ns)
    #Returns 0 on success
    def set_run_cycles(self, num_cycles):
    
        if(self.dummy_mode):
            return 0
    
        bytes_list = list((num_cycles).to_bytes(8, byteorder='little', signed = False))
        self.port.write([CMD_PREAMBLE, CMD_SET_RUN_CYCLES])
        self.port.write(bytes_list)
        
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #mask_sample is a 16 entry list of 16-bit samples
    def set_mask(self, mask_samples):
    
        if(self.dummy_mode):
            return 0
    
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
        
        if(self.dummy_mode):
            return 0
    
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
    
        if(self.dummy_mode):
            return 0
    
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
        
        if(self.dummy_mode):
            return 0
        
        bytes_list = []
        
        #Create the array of mask bytes to be sent to the FPGA
        for m in locking_samples:
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
    
        if(self.dummy_mode):
            return 0
    
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
    
        if(self.dummy_mode):
            return 0
    
        mask_en_byte = 0x00
        if(mask_en):
            mask_en_byte = 0xFF
            
        self.port.write([CMD_PREAMBLE, CMD_SET_MASK_ENABLE, mask_en_byte])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #Returns 0 on success
    def set_adc_run_cycles(self, adc_run_cycles):
    
        if(self.dummy_mode):
            return 0
    
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
    
        if(self.dummy_mode):
            return 0

        bytes_list = list((adc_shift).to_bytes(8, byteorder='little', signed = False))
        self.port.write([CMD_PREAMBLE, CMD_SET_ADC_SHIFT])
        self.port.write(bytes_list)
        
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #Flushes all ADC and DAC buffers
    def flush_buffers(self):
    
        if(self.dummy_mode):
            return 0
    
        self.port.write([CMD_PREAMBLE, CMD_FLUSH_BUFFERS])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #Returns dac clock status (0 if ok) and then adc clock status (0 if ok)
    def check_clocks(self):
    
        if(self.dummy_mode):
            return 0, 0
        
        self.port.write([CMD_PREAMBLE, CMD_CHECK_CLOCKS])
        
        res = self.port.read(1)
        clock_byte = res[0]
        dac_status = clock_byte & 0x01
        adc_status = clock_byte & 0x02
        
        return dac_status, adc_status
    
    #If set, all ADC data will be a known pattern (see adc_driver.sv)
    #Returns 0 on success
    def set_adc_dummy_data(self, val):
    
        if(self.dummy_mode):
            return 0
    
        self.port.write([CMD_PREAMBLE, CMD_SET_ADC_DUMMY_DATA, val & 0xFF])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1

    #If set, ADC readout is enabled
    #Returns 0 on success
    def set_adc_readout(self, val):
    
        if(self.dummy_mode):
            return 0
    
        self.port.write([CMD_PREAMBLE, CMD_SET_ADC_READOUT, val & 0xFF])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1
    
    #Returns 1 on success
    def trigger(self):
    
        if(self.dummy_mode):
            return 0
    
        self.port.write([CMD_PREAMBLE, CMD_TRIGGER])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1
        
    #Word is 32-bit dac word
    #Returns 0 on success
    def write_axis_word(self, word):
    
        if(self.dummy_mode):
            return 0
        
        bytes_list = list((word).to_bytes(4, byteorder='little', signed = False))
        self.port.write([CMD_PREAMBLE, CMD_WRITE_AXIS, bytes_list])
        res = self.wait_ack()
        if(res == CMD_ACK):
            return 0
        return 1
        
    #returns status(0 for success), value
    def read_axis_word(self):
    
        if(self.dummy_mode):
            return 0, 0
    
        self.port.write([CMD_PREAMBLE, CMD_READ_AXIS])
        axis_word_bytes = self.port.read(4)
        axis_status = self.port.read(1)
        astat = 0
        try:
            astat = axis_status[0]
        except:
            astat = 1
        return astat, int.from_bytes(axis_word_bytes, byteorder = 'little', signed = False)
        
 
#Static functions for loading instances of rfsoc_board from file

def load_rfsoc_board():
    f = open(config_filename, 'rb')
    ob = pickle.load(f)
    f.close()
    return ob 
def save_rfsoc_board(board_obj):
    try:
        f = open(config_filename, 'wb')
        f.truncate(0)
        pickle.dump(board_obj, f, pickle.HIGHEST_PROTOCOL)
        f.close()
    except FileNotFoundError:
        f = open(config_filename, 'wb+')
        f.truncate(0)
        pickle.dump(board_obj, f, pickle.HIGHEST_PROTOCOL)
        f.close()
 
#####################################################################################
#class for the high level driver which implements channel configuration and whatnot##
#####################################################################################
class rfsoc_board:

    #instance of rfsoc_board_driver
    board_driver = None
    
    #list of channel objects used to configure the board
    channel_list = []
    
    #Port name is the name of the serial port
    def __init__(self, portname, dm = 0):
        
        self.channel_list = []
        
        #Initialize the board driver
        self.board_driver = rfsoc_board_driver(portname, dm)
        
        #Try to ping the board
        if(self.board_driver.ping_board()):
            print("Could not communicate with FPGA board!")
        else:
            print("Connection to FPGA board is up!")
        
        return
    
    #Returns 0 on success
    def configure_all_channels(self, dummy_adc = 0):

        #Open the serial port
        self.board_driver.open_board()
        
        #Flush the buffers and disable adc readout
        if(self.board_driver.set_adc_readout(0)):
            return 1
        if(self.board_driver.flush_buffers()):
            return 1
        
        #Turn off ADC dummy data in case it is on
        if(self.board_driver.set_adc_dummy_data(dummy_adc)):
            return 1
        
        #Loop through the channels and configure then
        for c in self. channel_list:
            if(c.type == "ADC"):
                if(self.configure_adc_channel(c)):
                    return 1
            else:
                if(self.configure_adc_channel(c)):
                    return 1
        #Success
        self.board_driver.close_board()
        return 0

    
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
            new_sample = (channel.waveform_samples[i] << 16) | (channel.waveform_samples[i+1])
            axis_words.append(new_sample)
            i += 2
        
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
        channel.num_triggers = 0
        
        #Select the channel number first
        if(self.board_driver.select_channel(channel.channel_num)):
            print("Error while trying to select channel, aborting ADC channel configuration")
            return 1
        #Then set the run cycles
        if(self.board_driver.set_adc_run_cycles(channel.adc_run_cycles)):
            print("Error while trying to set adc run cycles, aborting ADC channel configuration")
            return 1
        #Finally set the shift val
        if(self.board_driver.set_adc_shift(channel.shift_val)):
            print("Error while trying to set adc shift val, aborting ADC channel configuration")
            return 1
        
        #success
        return 0
            
    #Triggers the FPGA once, returns 0 on success
    def trigger(self):

        #Open the serial port
        self.board_driver.open_board()
        
        #Trigger the board once
        if(self.board_driver.trigger()):
            print("Error while triggering board")
            return 1
        
        #Update the counters
        for c in self.channel_list:
            c.num_triggers += 1

        self.board_driver.close_board()
        return 0
    
    #Where channel_num is the integer 0-15
    #Returns a list of sample read out (may be empty)
    def readout_adc(self, channel_num):
        
        
        #Find the matching ADC channel object in our channel list
        adc_obj = None
        for c in self.channel_list:
            if(c.type == "ADC" and c.channel_num == channel_num):
                adc_obj = c
                break
    
        if(adc_obj == None):
            raise ValueError("Error, could not locate ADC channel #" + str(channel_num) + " in channel list, cannot perform readout!")
    
    
        if(not adc_obj.is_done()):
            raise RuntimeError("Error, ADC channel #" + str(channel_num) + " has not been triggered enough times, must be triggered " + str(2**adc_obj.shift_val) + " times, has only been triggered " + str(adc_obj.num_triggers) + " times, cannot readout")
            return []
        
        #Open the serial port
        self.board_driver.open_board()
        
            
        #Write the shift value for this channel as 0 so we can enable readout
        self.board_driver.select_channel(channel_num)
        self.board_driver.set_adc_shift(0)
        self.board_driver.set_adc_readout(1)
        
        #Figure out how many times we need to read the axis bus
        num_axis_reads = int(adc_obj.adc_run_cycles)
        
        sample_list = []
        for i in range(0, num_axis_reads):
            
            #Read out an AXIS 32-bit word
            status, word = self.board_driver.read_axis_word()
            if(status):
                print("Error while reading AXIS word during ADC readout, read " + str(i) + " out of " + str(num_axis_reads) + " expected reads")
                self.board_driver.close_board()
                return sample_list
            #Otherwise break it into two samples and add it to the list
            sample_0 = (word  >> 16) & 0xFFFF
            sample_1 = word & 0xFFFF
            
            #Change this order if the samples are in the wrong order
            sample_list.append(sample_0)
            sample_list.append(sample_1)
            
        
        #Reset the shift and readout values
        self.board_driver.set_adc_readout(0)
        self.board_driver.set_adc_shift(adc_obj.shift_val)
        
        self.board_driver.close_board()
        return sample_list
        
   
#Constants for this class
NANOSECONDS_PER_DAC_WORD = 4
DAC_MAX_VALUE = 32767 - 5#0x7FFF
DAC_MIN_VALUE = -32768 + 5#0x8000
DAC_FIFO_LEN = 4096 * 16 # in number of samples
            
class rfsoc_channel:

    
    #Parameters to be set for this DAC channel on the FPGA
    mask_samples = [] #List of samples to be uploaded as the mask
    mask_enable = 0 #If we need to use the mask
    locking_waveform_samples = [] #list of samples to be uploaded as locking waveform
    mask_enable = 0 #Either 1 or 0, decides if we need the mask in the first place
    run_cycles = 0 #Number of cycles DAC verilog module will run for in playback state
    pre_delay_cycles = 0
    post_delay_cycles = 0
    waveform_samples = [] #16 bit entries

    #Parameters for ADC type channels
    shift_val = 0 #Used for doing 2 ^ shift_val averages when capturing
    adc_run_cycles = 0 #Sets how many cycles the ADC will record for
    num_triggers = 0 # Counts number of times this channel has been triggered
    
    
    #Config parameters for waveform generation
    #These parameters are set by the user
    channel_num = 0 #between 0 and 15, set by user
    locking_shift = 0 #in ns
    locking_amp_factor = 1 #by default, used to adjust amplitude of locking waveform
    pre_delay = 0 # in ns before experiment
    post_delay = 0 # in ns after experiment
    period = 0 # of one cycle in nano seconds
    num_repeat_cycles = 0 #number of times to repeat this waveform
    waveform_amp_factor = 1
    type = "DAC" #type is either "DAC" or "ADC"
    
    #locking and waveform filenames
    waveform_filename = ""
    locking_filename = ""
    
    def __init__(self, tp, cn, ls, laf, pred, postd, per, num_rs, waf, wfn, lfn, adc_sv, adc_rc):
        
        self.type = tp
        self.channel_num = cn
        self.locking_shift = ls
        self.locking_amp_factor = laf
        self.pre_delay = pred
        self.post_delay = postd
        self.period = per
        self.num_repeat_cycles = num_rs
        self.waveform_amp_factor = waf
        self.waveform_filename = wfn
        self.locking_filename = lfn
        
        self.shift_val = adc_sv
        self.adc_run_cycles = adc_rc
        
        #Check our inputs
        self.check_parameters()
        #Set up the values passed to the board object
        self.generate_channel_data()
        
        return
    
    #ADC Checking functions
    #If we've triggered enough times for readout
    def is_done(self):
        if(self.num_triggers < 2 ** self.shift_val):
            return 0
        return 1
    #If we triggered too many times
    def has_overflown(self):
        if(self.num_triggers > 2 ** self.shift_val):
            return 1
        return 0

    #Raises an exception if any of the input parameters have issues
    def check_parameters(self):
    
        #Channel number check
        if(self.channel_num < 0 or self.channel_num > 15):
            raise ValueError('Error, channel number must be between 0 and 15')
        
        #type must be DAC or ADC
        if(self.type != "DAC" and self.type != "ADC"):
            raise NameError('Error, type of rfsoc_channel object must be DAC or ADC')
        
        #Amp factors must be between 0 and 1
        if(self.locking_amp_factor < 0 or self.locking_amp_factor > 1):
            raise ValueError('Error, locking amplitude factor must be between 0 and 1')
        if(self.waveform_amp_factor < 0 or self.waveform_amp_factor > 1):
            raise ValueError('Error, waveform amplitude factor must be between 0 and 1')
            
        #Pre and post delay cannot be negative
        if(self.pre_delay < 0):
            raise ValueError("Error, pre delay must be positive or 0")
        if(self.post_delay < 0):
            raise ValueError("Error, post delay must be positive or 0")
        
        #locking shift, period, num_repeat_cycles must all be positive
        if(self.locking_shift < 0):
            raise ValueError("Error, locking shift must be greater than 0")
        if(self.period < 0):
            raise ValueError("Error, waveform period must be greater than 0")
        if(self.num_repeat_cycles < 0):
            raise ValueError("Error, repeat cycles must be greater than 0")
            
        #ADC value checking
        if(self.adc_run_cycles < 0):
            raise ValueError("Error, ADC run cycles must be greater than 0")
        if(self.shift_val < 0):
            raise ValueError("Error, ADC shift must be positive")
        if(round(self.shift_val) != self.shift_val):
            raise ValueError("Error, number of ADC averages must be a power of 2")
        return
    
    #Returns a scaled stream, all scaling happens about 0
    def scale_stream(self, stream, new_min, new_max):
        
        scale = 0
        #If the largest magnitude value in a stream is positive we scale based on that and the new max
        #Otherwise we scale based on the min (most negative) and the new min
        if(abs(max(stream)) > abs(min(stream))):
            scale = new_max / max(stream)
        else:
            scale = abs(new_min / min(stream))
        
        out_stream = []
        for s in stream:
            out_stream.append(s * scale)
            
        return out_stream

    #Rotates the values within a stream by shift number of samples
    def rotate_stream(self, stream, shift):
        new_stream = []
        index = shift*-1
        
        #if we're just shifting back to where we started
        if(index >= len(stream)):
            index = index % len(stream)
        
        #fix the index
        if(index < 0):
            index += len(stream)
            
        for i in range(0, len(stream)):
            #append the current index to the new stream
            new_stream.append(stream[index])
            #find the next index value
            
            #Wrap around
            if(index == len(stream)-1):
                index = 0
            else:
                index += 1
                
        return new_stream
        
        
     
    #Takes in a filename and returns a list of the waveform samples that were in the file
    def read_waveform_file(self, filename):
    
    
        #read out the file as a string
        f = open(filename, "r")
        fileString = f.read()
        
        #parse out all of the numbers in the file stream
        prevals = re.findall(r'[-+]?[0-9]+\.?[0-9]*', fileString)
        
        vals = []
        
        #parse out the comma
        for i in range (0, len(prevals)):
            #get the string without the number
            string_val = prevals[i]
            vals.append(float(string_val))
            
        return vals
  
    
    #Takes in a list of samples and returns list of samples which is num_samples long
    def interpolate_sample_list(self, samp_list, num_samples):
    
        disc_time = list(range(0,len(samp_list)))
        scaled_time = np.arange(0,len(samp_list), len(samp_list)/num_samples)
        
        return np.interp(scaled_time, disc_time, samp_list)
    
    #Writes out the waveform sample lists to be uploaded to the FPGA and sets other parameters to be uploaded
    #Returns 0 on success
    def generate_channel_data(self):
    
        #If the locking filename is blank then skip this step
        if(self.locking_filename != ""):
    
            #Get the locking wordstream
            locking_wordstream = self.read_waveform_file(self.locking_filename)
            
            #First we interpolate the locking waveform so it's exactly 4ns long
            locking_wordstream = self.interpolate_sample_list(locking_wordstream, 16)
            #Then scale the locking wordstream so that it is between DAC_MAX_VALUE and DAC_MIN_VALUE
            locking_wordstream = self.scale_stream(locking_wordstream, DAC_MIN_VALUE, DAC_MAX_VALUE)
            #Then scale the locking wordstream
            if(self.locking_amp_factor != 1):
                for i in range(0, len(locking_wordstream)):
                    locking_wordstream[i] = locking_wordstream[i] * self.locking_amp_factor
            #Then shift the stream if need be
            if(self.locking_shift):
                locking_wordstream = self.rotate_stream(locking_wordstream, int(self.locking_shift*4))
            #Set up our outputs correctly so they can be sent to the board
            self.locking_waveform_samples = []
            for l in locking_wordstream:
                self.locking_waveform_samples.append(int(l))
        #Otherwise append 0s to locking waveform
        else:
            self.locking_waveform_samples = []
            for i in range(0, 16):
                self.locking_waveform_samples.append(0)
        
        #Now we turn our attention to the waveform
        
        #If our waveform filename is blank just return for now
        if(self.waveform_filename == ""):
            return 0
        
        #First we're going to scale the waveform timing so it is a user-defined length
        waveform_wordstream = self.read_waveform_file(self.waveform_filename)
        waveform_len_in_samples = self.period * 4
        
        if(waveform_len_in_samples % 16 != 0):
            raise ValueError("Error, the period of the waveform period of channel #"+str(self.channel_num)+" must be a multiple of 4ns, cannot upload waveform to FPGA")
            
        
        waveform_wordstream = self.interpolate_sample_list(waveform_wordstream, waveform_len_in_samples)
        #Then scale the amplitude of the wordstream and apply the amp factor
        waveform_wordstream = self.scale_stream(waveform_wordstream, DAC_MIN_VALUE, DAC_MAX_VALUE)
        if(self.waveform_amp_factor != 1):
            for i in range(0, len(waveform_wordstream)):
                waveform_wordstream[i] = waveform_wordstream[i] * self.waveform_amp_factor
        
        #Send out a warning if the delay is not a multiple of 250ps
        if(round(self.pre_delay * 4) != (self.pre_delay*4)):
            print("Warning, pre delay for channel #"+str(self.channel_num)+" is not a multiple of 250ps, delay will be rounded to nearest multiple!")
        
        #Now we figure out how to set up the fine and coarse delays
        coarse_delay = int(self.pre_delay / 4)
        fine_delay = int((self.pre_delay * 4) % 16)
        
        #Set up a preliminary number of run cycles
        self.run_cycles = (self.period/4) * self.num_repeat_cycles
        
        self.mask_samples = []
        #If the fine delay is not 0
        if(fine_delay):
            #Turn on the mask
            self.mask_enable = 1
            
            #Write out the mask bytes
            for i in range(0, 16):
                if(i < fine_delay):
                    self.mask_samples.append(0x0000)
                else:
                    self.mask_samples.append(0xFFFF)
            
            
            #Add one to the run cycles to account for the use of the mask
            self.run_cycles += 1
            
            #Shift the waveform wordstream by fine_delay samples
            waveform_wordstream = self.rotate_stream(waveform_wordstream, fine_delay)
        else:
            self.mask_enable = 0
            for i in range(0, 16):
                self.mask_samples.append(0xFFFF)#Set it to all Fs to make plot_waveform easier to implement
        
        #Write out the samples to waveform samples list
        self.waveform_samples = []
        for w in waveform_wordstream:
            self.waveform_samples.append(int(w))
        #Check if it's too long
        if(len(self.waveform_samples) > DAC_FIFO_LEN):
            raise ValueError("Error, waveform is larger than size of DAC fifo, waveform is " + str(len(self.waveform_samples)) + " samples long, DAC fifo can only hold " + str(DAC_FIFO_LEN) + " samples")
        
        #Set the post delay and pre_delay
        self.pre_delay_cycles = coarse_delay
        self.post_delay_cycles = round(self.post_delay /4)
        if(self.post_delay_cycles != self.post_delay / 4):
            print("Warning, post delay for channel #"+str(self.channel_num)+" is not a multiple of 4ns, delay will be rounded!")
        
        #Success
        return 0
        
        
        
        
#Tools for looking for serial ports to use
import serial.tools.list_ports


def get_port_list():
    ports = list(serial.tools.list_ports.comports())
    ps = []
    for p in ports:
        ps.append(p.device)
    return ps

def print_port_list():

    print("Searching for COM port...")

    ports = list(serial.tools.list_ports.comports())
    
    usable_ports = []
    
    for p in ports:
       
        ser = serial.Serial()
        ser.baudrate = 19200
        ser.port = p.device
        try:
            ser.open()
            print(p.description + " is " + "writable" if ser.writable() else "UNWRITABLE")
            if(ser.writable()):
                usable_ports.append(p)
            ser.close()
        except:
            print("Unable to open: " + p.description)
            
            
    print("List of usable COM ports:")   
    for p in ports:
        print(p.device)