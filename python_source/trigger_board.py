


import rfsoc_board_driver as rbd
import sys
import numpy

def save_waveform(data):
    timestr = time.strftime("%Y-%m-%d--%H-%M-%S")
    numpy.savetxt(timestr + "_adc_data", data, delimiter=",")
    return


#argument 1 is save waveform as csv?
#argument 2 is plot waveform?

save_waveform = int(sys.argv[1])
plot_waveform = int(sys.argv[2])


#load board state
board = rbd.load_rfsoc_board()

#Figure out the adc shift values
num_trigs = 1
cap_cycles = 0
for c in board.channel_list:
    if(c.type == "ADC" and c.channel_num == 0):
        num_trigs = pow(2,c.shift_val)
        cap_cycles = c.adc_run_cycles

#Trigger the board
for i in range(0, num_trigs):
    if(board.trigger()):
        raise RuntimeError("Error, while trying to trigger board")
    else:
        print("Board triggered! Trigger number: " + str(i+1))
    time.sleep(0.5)
    
    
#If we need to readout the adc
if(cap_cycles): 
    
    adc_data = board.readout_adc(0)
    
    if(adc_data == []):
        raise RuntimeError("Error reading out ADC data")
        
    if(save_waveform):
        save_waveform(adc_data)
    if(plot_waveform):
        wp.plot_adc_waveform(adc_data)