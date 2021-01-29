

import rfsoc_board_driver as rbd
import sys
import math
import waveform_plotter as wp

#First argument is nanoseconds to run ADC for
#second argument is 1 for display uploaded waveforms
#third argument is number of adc averages


if(len(sys.argv) != 4):
    raise ValueError("Error, incorrect number of arguments, please see top of arm_board.py for list of arguments")

adc_run_cycles = int(int(sys.argv[1]) / 4) #Divide by 4 to go from ns to number of cycles
display_waveforms = int(sys.argv[2])

adc_avgs = int(sys.argv[3])
adc_shift = 0
if(adc_avgs != 0):
	adc_shift = math.log2(int(sys.argv[3]))


#Load the board state
board = rbd.load_rfsoc_board()

#Add an ADC channel (or append the current one)
found = 0
for c in board.channel_list:
    if(c.type == "ADC"):
        found = 1
        c.shift_val = adc_shift
        c.adc_run_cycles = adc_run_cycles
        c.check_parameters()
        break
        
#If we need to add an adc channel
if(found == 0):
    c = rbd.rfsoc_channel(
        "ADC", 
        0, 
        0, 
        0, 
        0,
        0,
        0,
        0,
        0,
        "",
        "",
        adc_shift, 
        adc_run_cycles)
    board.channel_list.append(c)

#Check the status of the clocks
board.board_driver.open_board()
d0, d1, d2, d3, a0, a1, a2, a3 = board.board_driver.check_clocks(full_stats = 1)
board.board_driver.close_board()
ds = [d0, d1, d2, d3]
if(d0):
    raise RuntimeError("Error, the DAC RF clock for channels 1-4 was not detected, cannot upload waveforms without an RF clock present")
if(a0 and adc_run_cycles != 0):
    raise RuntimeError("Error, the ADC RF clock for the FPGA was not detected, cannot use ADC without clock")

for c in board.channel_list:
    dac_tile = math.floor(c.channel_num/4)
    if(ds[dac_tile]):
        print("Warning, no clock detected for DAC channel " + str(c.channel_num) + " and this channel is in use.")

    
#Configure all channels
if(board.configure_all_channels(0)):
    raise RuntimeError("Error while trying to configure channels")
    
#Save the board state
rbd.save_rfsoc_board(board)

print("Board is armed, trigger using trigger_board.py")


#If we need to plot waveforms
if(display_waveforms):
    print("Plotting DAC waveforms...")
    wp.plot_dac_waveforms(board.channel_list)
