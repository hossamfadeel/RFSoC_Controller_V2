

import rfsoc_board_driver as rbd

#List of arguments
#1 channel number between 1 and 16
#2 waveform filename
#3 waveform period in nanoseconds, will be rounded to the nearest 4 nanoseconds
#4 delay after experiment in nanoseconds, will be rounded to nearest 4 nanoseconds
#5 waveform amplitude multiplication factor, must be between 0 and 1
#6 number of cycles to playback the waveform
#7 delay before experiment in nanoseconds, will be rounded to the nearest quarter nanosecond
#8 is locking channel? Must be either 0 or 1
#9 locking waveform amplitude factor, must be between 0 and 1
#10 locking phase in nanoseconds, can be a float but will be rounded to nearest quarter nanosecond
#11 is the locking file name
#12 is pre_waveform_fix
#13 is use one long waveform?




if(len(sys.argv) < 9):
    print("Error, not enough arguments, please see top of script for list of arguments.")
    sys.exit()

#get all of our variables first
channel_number = int(sys.argv[1])
channel_number -= 1

waveform_filename = sys.argv[2]
waveform_period = int(sys.argv[3])#in nanoseconds, must be int
post_delay = int(sys.argv[4]) #in nanoseconds, can be negative and a float
amp_mul_factor = float(sys.argv[5]) #between 0 and 1

num_cycles = int(sys.argv[6])
if(num_cycles < 1):
    raise ValueError("Error, number of cycles must be greater than 0")

zero_delay = float(sys.argv[7]) #in nanoseconds, must be positive
if(zero_delay < 0):
    raise ValueError("Error, delay before experiment must be positive or 0")
    


#####IF we're the locking channel###########

is_locking = int(sys.argv[8]) #0 or 1

locking_amp_factor = 0
locking_phase = 0
locking_filename = ""

if(is_locking):
    
    if(len(sys.argv) < 12):
        print("Error, not enough arguments to parse locking channel.")
        sys.exit()

    locking_amp_factor = float(sys.argv[9]) #between 0 and 1
    locking_phase = float(sys.argv[10]) #in nanoseconds, can be negative and a float
    
    
    locking_filename = sys.argv[11]


board = ib.load_board()

if(board == None):
    print("Error, unable to load board.")
    sys.exit()
    
#Calculate the number of repeat cycles based on the total number of cycles and the period
#TODO

if(board.add_channel(c)):
    print("Error while adding channel")

if(ib.save_board(board)):
    print("Error while saving board to disk")
else:
    print("Successfully added channel #" + str(channel_number+1))
    print("Waveform file: " + waveform_filename + 
          "\nPeriod: " + str(waveform_period) +  
          " (ns)\nWaveform amplitude multiplier: " + str(amp_mul_factor) + 
          "\nNumber of playback cycles: " + str(num_cycles) + 
          "\nDelay before experiment: " + str(zero_delay) + 
          " (ns)\nDelay after experiment: " + str(post_delay) +
          " (ns)\nIs locking channel: " + ("YES" if is_locking == 1 else "NO") + 
          "\nLocking file: " + locking_filename + 
          "\nLocking amplitude factor: " + str(locking_amp_factor) + "\nLocking phase: " + str(locking_phase) + " (ns)" + 
          "\nPre-waveform fix (subtract 4ns from total period): " + ("YES" if pre_waveform_fix == 1 else "NO") + 
          "\nOne long waveform: " + ("YES" if use_loopback == 0 else "NO") + "\n")