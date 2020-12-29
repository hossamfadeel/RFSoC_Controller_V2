


import rfsoc_board_driver as rbd
import waveform_plotter as wp


portname = "COM6"

def adc_readout_test():
    
    num_test_trigs = 5 #Number of times to re-trigger and run the test again without a buffer flush
    
    run_cycles = 64
    shift_val = 2

    #Create a board driver object
    board_driver = rbd.rfsoc_board_driver(portname)
    
    #Open the board serial port
    board_driver.open_board()
    
    #Check if the connection to the board is update
    if(board_driver.ping_board()):
        raise RuntimeError("Error, adc readout test could not communicate with board")
    print("Connection to board is up!")
    
    #Check if the clocks are running
    dac, adc = board_driver.check_clocks()
    if(dac):
        raise RuntimeError("Error, DAC clock not detected, aborting adc readout test")
    if(adc):
        print("Warning, ADC clock not detected")
        #raise RuntimeError("Error, ADC clock not detected, aborting adc readout test")
    
    #Select channel 0
    if(board_driver.select_channel(0)):
        raise RuntimeError("Error, adc readout test was unable to select board channel")
    
    #Set the shift to 0 and the run cycles to 2
    
    if(board_driver.set_adc_run_cycles(run_cycles)):
        raise RuntimeError("Error, adc readout test was unable to set adc shift")
    if(board_driver.set_adc_shift(shift_val)):
        raise RuntimeError("Error, adc readout test was unable to set adc shift")
        
    
    #Turn on ADC dummy data
    if(board_driver.set_adc_dummy_data(1)):
        raise RuntimeError("Error, adc readout test was unable to turn on adc dummy data")
        
    #Flush the ADC buffers and disable adc readout
    if(board_driver.set_adc_readout(0)):
        raise RuntimeError("Error, adc readout test was unable to set adc readout")
    if(board_driver.flush_buffers()):
        raise RuntimeError("Error, adc readout test was unable to flush buffers")
        
        
    for j in range(0, num_test_trigs):
        
        print("Test number: " + str(j))
        
        #Trigger the board once
        for i in range(0, pow(2, shift_val)):
            if(board_driver.trigger()):
                raise RuntimeError("Error, adc readout test could not trigger board")
        
        
        #Set shift value back to 0
        if(board_driver.set_adc_shift(0)):
            raise RuntimeError("Error, adc readout test was unable to set adc shift")
        #Enable adc readout
        if(board_driver.set_adc_readout(1)):
            raise RuntimeError("Error, adc readout test was unable to set adc readout")
        
        #make 4 garbage reads first
        for i in range(0, 4):
            status, word = board_driver.read_axis_word()
            print("Garbage read was " + hex(word))
            
        #Read out exactly 8 AXIS words and see what we get
        expected_vals = [0x70008000, 0x50006000, 0x30004000, 0x10002000]
        errs = 0
        for i in range(0, run_cycles*4):
            status, word = board_driver.read_axis_word()
            if(status):
                raise RuntimeError("Error while reading out AXIS word")
            
            print("Got: " + hex(word))
            
            if(word != expected_vals[i%4]):
                print("Bad ADC value, expected " + hex(expected_vals[i%4]) + ", got " + hex(word) + ", i was " + str(i))
                errs += 1
            
        
        #disable adc readout
        if(board_driver.set_adc_readout(0)):
            raise RuntimeError("Error, adc readout test was unable to set adc readout")
        #Reset shift val back to its normal value
        if(board_driver.set_adc_shift(shift_val)):
            raise RuntimeError("Error, adc readout test was unable to set adc shift")
            
        #If we have any errors just stop here
        if(errs):
            break
        
    #We're done
    
    board_driver.close_board()
    
    print("ADC readout test complete, errors: " + str(errs))
    
    return 0
    
def dac_sawtooth_test():

    #Create a new high level board object and some channels
    board_obj = rbd.rfsoc_board(portname)
    locking_filename = "test_waveforms\\tdcsq.txt"
    waveform_filename = "test_waveforms\\testw2.txt"
    c0 = rbd.rfsoc_channel("DAC",0,0,1,8+   0,32,4,5,1,waveform_filename,locking_filename,0,0)
    c1 = rbd.rfsoc_channel("DAC",1,0,1,8+0.25,32,4,5,1,waveform_filename,locking_filename,0,0)
    c2 = rbd.rfsoc_channel("DAC",2,0,1,8+ 0.5,32,4,5,1,waveform_filename,locking_filename,0,0)
    c3 = rbd.rfsoc_channel("DAC",3,0,1,8+0.75,32,4,5,1,waveform_filename,locking_filename,0,0)
    c4 = rbd.rfsoc_channel("DAC",4,0,1,8+   1,32,4,5,1,waveform_filename,locking_filename,0,0)

    board_obj.channel_list.append(c0)
    board_obj.channel_list.append(c1)
    board_obj.channel_list.append(c2)
    board_obj.channel_list.append(c3)
    board_obj.channel_list.append(c4)
    
    #wp.plot_dac_waveforms(board_obj.channel_list)
    
    #Check the status of the clocks
    board_obj.board_driver.open_board()
    dac_status, adc_status = board_obj.board_driver.check_clocks()
    board_obj.board_driver.close_board()
    if(dac_status):
        raise RuntimeError("Error, the DAC RF clock for the FPGA was not detected, cannot upload waveforms without an RF clock present")
        
    #Configure the board
    if(board_obj.configure_all_channels()):
        raise RuntimeError("Error, could not configure channels for DAC test")
        
    #Trigger the board once
    if(board_obj.trigger()):
        raise RuntimeError("Error triggering board")
        
    if(board_obj.trigger()):
        raise RuntimeError("Error triggering board")
    
    return 0
    
    

#adc_readout_test() 
dac_sawtooth_test()