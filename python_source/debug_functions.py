


import rfsoc_board_driver as rbd


portname = "COM6"

def adc_readout_test():

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
    run_cycles = 2
    if(board_driver.set_adc_run_cycles(run_cycles)):
        raise RuntimeError("Error, adc readout test was unable to set adc shift")
    if(board_driver.set_adc_shift(0)):
        raise RuntimeError("Error, adc readout test was unable to set adc shift")
        
    
    #Turn on ADC dummy data
    if(board_driver.set_adc_dummy_data(1)):
        raise RuntimeError("Error, adc readout test was unable to turn on adc dummy data")
        
    #Flush the ADC buffers and disable adc readout
    if(board_driver.set_adc_readout(0)):
        raise RuntimeError("Error, adc readout test was unable to set adc readout")
    if(board_driver.flush_buffers()):
        raise RuntimeError("Error, adc readout test was unable to flush buffers")
        
    #Trigger the board once
    if(board_driver.trigger()):
        raise RuntimeError("Error, adc readout test could not trigger board")
        
    #Enable adc readout
    if(board_driver.set_adc_readout(1)):
        raise RuntimeError("Error, adc readout test was unable to set adc readout")
        
    #Run the DMA test
    #board_driver.port.write([rbd.CMD_PREAMBLE, rbd.CMD_DMA_DEBUG])
    #board_driver.wait_ack()
        
    #Read out exactly 8 AXIS words and see what we get
    for i in range(0, run_cycles*4):
        status, word = board_driver.read_axis_word()
        if(status):
            raise RuntimeError("Error while reading out AXIS word")
        
        print("Got: " + hex(word))
        
    
    #disable adc readout
    if(board_driver.set_adc_readout(0)):
        raise RuntimeError("Error, adc readout test was unable to set adc readout")
        
    #We're done
    
    board_driver.close_board()
    return 0
    
def dac_sawtooth_test():

    #Create a new high level board object and some channels
    board_obj = rbd.rfsoc_board(portname)
    

    c0 = rbd.rfsoc_channel("DAC",0,0,1,0,0,8,5,1,"test_waveforms\sawtooth.txt","",0,0)
    c1 = rbd.rfsoc_channel("DAC",0,0,1,0.25,0,8,5,1,"test_waveforms\sawtooth.txt","",0,0)
    c2 = rbd.rfsoc_channel("DAC",0,0,1,0.5,0,8,5,1,"test_waveforms\sawtooth.txt","",0,0)
    c3 = rbd.rfsoc_channel("DAC",0,0,1,0.75,0,8,5,1,"test_waveforms\sawtooth.txt","",0,0)
    c4 = rbd.rfsoc_channel("DAC",0,0,1,1,0,8,5,1,"test_waveforms\sawtooth.txt","",0,0)
    
    board_obj.channel_list.append(c0)
    board_obj.channel_list.append(c1)
    board_obj.channel_list.append(c2)
    board_obj.channel_list.append(c3)
    board_obj.channel_list.append(c4)
    
    #Check the status of the clocks
    dac_status, adc_status = board_obj.board_driver.check_clocks()
    if(dac_status):
        raise RuntimeError("Error, the DAC RF clock for the FPGA was not detected, cannot upload waveforms without an RF clock present")
        
    #Configure the board
    if(board_obj.configure_all_channels()):
        raise RuntimeError("Error, could not configure channels for DAC test")
        
    #Trigger the board once
    if(board_obj.trigger()):
        raise RuntimeError("Error triggering board")
    
    return 0
    
    

adc_readout_test() 