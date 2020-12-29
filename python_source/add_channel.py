

import rfsoc_board_driver as rbd
import sys

#List of arguments
#1 channel number between 1 and 16
#2 waveform filename
#3 waveform period in nanoseconds, will be rounded to the nearest 4 nanoseconds
#4 delay after experiment in nanoseconds, will be rounded to nearest 4 nanoseconds
#5 waveform amplitude multiplication factor, must be between 0 and 1
#6 number of cycles (times) to playback the waveform
#7 delay before experiment in nanoseconds, will be rounded to the nearest quarter nanosecond (pre_delay)
#8 is locking channel? Must be either 0 or 1
#9 locking waveform amplitude factor, must be between 0 and 1
#10 locking phase in nanoseconds, can be a float but will be rounded to nearest quarter nanosecond
#11 is the locking file name





if(len(sys.argv) < 9):
    raise ValueError("Error, not enough arguments, please see top of script for list of arguments.")
    

#get all of our variables first
channel_number = int(sys.argv[1])
channel_number -= 1

waveform_filename = sys.argv[2]
waveform_period = int(sys.argv[3])#in nanoseconds, must be int
post_delay = int(sys.argv[4]) #in nanoseconds, can be negative and a float
amp_mul_factor = float(sys.argv[5]) #between 0 and 1

num_repeat_cycles = int(sys.argv[6])

zero_delay = float(sys.argv[7]) #in nanoseconds, must be positive

    


#####IF we're the locking channel###########

is_locking = int(sys.argv[8]) #0 or 1

locking_amp_factor = 0
locking_phase = 0
locking_filename = ""

if(is_locking):
    
    if(len(sys.argv) < 12):
        raise ValueError("Error, not enough arguments to parse locking channel.")

    locking_amp_factor = float(sys.argv[9]) #between 0 and 1
    locking_phase = float(sys.argv[10]) #in nanoseconds, can be negative and a float
    
    
    locking_filename = sys.argv[11]


#Load the board object
board = rbd.load_rfsoc_board()

#check and see if there is already a channel object for this channel
found = 0
for c in board.channel_list:
    if(c.channel_num == channel_number and c.type == "DAC"):
        found = 1
        print("Appending configuration for channel " + str(channel_number+1))
        #If we're about to overwrite something that is already configured
        #if(is_locking and c.locking_filename != ""):
            #print("Warning, overriding locking cycle configuration for channel " + str(channel_number))
        #if(not is_locking and c.waveform_filename != ""):
            #print("Warning, overriding waveform configuration for channel " + str(channel_number))
		
        c.locking_filename = locking_filename
        c.locking_amp_factor = locking_amp_factor
        c.locking_shift = locking_phase
        c.waveform_filename = waveform_filename
        c.period = waveform_period
        c.post_delay = post_delay
        c.waveform_amp_factor = amp_mul_factor
        c.num_repeat_cycles = num_repeat_cycles
        c.pre_delay = zero_delay
        
        
        #Check the new parameters
        c.check_parameters()
        #Re-generate the channel data with the new values
        c.generate_channel_data()
        break
        
#If we just need to add a new channel
if(found == 0):
    print("Creating new configuration for channel " + str(channel_number+1))
    c = rbd.rfsoc_channel(
        "DAC", 
        channel_number, 
        locking_phase, 
        locking_amp_factor, 
        zero_delay,
        post_delay,
        waveform_period,
        num_repeat_cycles,
        amp_mul_factor,
        waveform_filename,
        locking_filename,
        0, 0)
    
    board.channel_list.append(c)

#Save the board object to disk
rbd.save_rfsoc_board(board)


print("\n===================================\nSuccessfully added channel #" + str(channel_number+1))
print("Waveform file: " + waveform_filename + 
      "\nPeriod: " + str(waveform_period) +  
      " (ns)\nWaveform amplitude multiplier: " + str(amp_mul_factor) + 
      "\nNumber of playback cycles: " + str(num_repeat_cycles) + 
      "\nDelay before experiment: " + str(zero_delay) + 
      " (ns)\nDelay after experiment: " + str(post_delay) +
      " (ns)\nIs locking channel: " + ("YES" if is_locking == 1 else "NO") + 
      "\nLocking file: " + locking_filename + 
      "\nLocking amplitude factor: " + str(locking_amp_factor) + "\nLocking phase: " + str(locking_phase) + " (ns)" + 
      "\nPre-waveform fix (subtract 4ns from total period): " + "IGNORED" + 
      "\nOne long waveform: " + "IGNORED" + "\n")