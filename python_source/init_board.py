


import rfsoc_board_driver as rbd
import sys

def auto_detect(port_list, use_dummy_mode, org_port):
    print("Auto-detecting port...")
    
    for p in port_list:
        if(p != org_port):
            board = rbd.rfsoc_board(portname, use_dummy_mode)
            if(board.is_connected):
                rbd.save_rfsoc_board(board)
                print("Success! Auto-detected port was " + p)
                return 1
        
    print("Error, unable to communicate with board")
    return 0

#First argument is the portname to use as the COM port for connecting to FPGA
#Second argument is 1 if we're using dummy mode

is_c = 0
skip = 0

#if we weren't passed a port as an argument
if(len(sys.argv) < 2):
    print("No port name provided for board initialization, will attempt auto-discovery")
    skip = 1
else:
    portname = sys.argv[1]

use_dummy_mode = 0
if(len(sys.argv) == 3):
    use_dummy_mode = sys.argv[2]


port_list = rbd.get_port_list()
if(use_dummy_mode == 0):
    if portname not in port_list:
        rbd.print_port_list()
        print("Invalid port name: " + portname)
        skip = 1
        
if not skip: #If we should at least try the user's port

    print("\n\n***** Initializing FPGA on port: " + portname + " *****\n")
    
    #Create the object
    board = rbd.rfsoc_board(portname, use_dummy_mode)
    
    if not board.is_connected:
        is_c = auto_detect(port_list, use_dummy_mode, portname)
    else:
        #Save it to the database
        rbd.save_rfsoc_board(board)
        is_c = 1
else:
    is_c = auto_detect(port_list, use_dummy_mode, portname)
    
#If we successfully connected to the board
if(is_c):

    #Done
    board.board_driver.open_board()
    d0, d1, d2, d3, a0, a1, a2, a3 = board.board_driver.check_clocks(full_stats = 1)
    d = [d0, d1, d2, d3]
    a = [a0, a1, a2, a3]
    board.board_driver.close_board()
    print("Available Clocks:\n=================\n")
    for i in range(0, 4):
        if(i < 4):
            print("DAC channels " + str((i*4)+1) + "-" + str((i*4)+4) + " : " + ("YES" if not d[i] else "NO"))
        else:
            print("ADC channels " + str(((i-4)*4)+1) + "-" + str(((i-4)*4)+4) + " : " + ("YES" if not a[i] else "NO"))
            
     
    if(d[0]):
        print("Warning, no clock detected for DAC channels 1-4, FPGA will not work!")

    
    


