


import rfsoc_board_driver as rbd
import sys



#First argument is the portname to use as the COM port for connecting to FPGA
#Second argument is 1 if we're using dummy mode


#if we weren't passed a port as an argument
if(len(sys.argv) < 2):
    raise ValueError("Error, please provide a portname as an argument..., usage is \"init_board.py PORTNAME\"")
    
portname = sys.argv[1]

use_dummy_mode = 0
if(len(sys.argv) == 3):
    use_dummy_mode = sys.argv[2]

if(use_dummy_mode == 0):
    if portname not in rbd.get_port_list():
        rbd.print_port_list()
        raise ValueError("Invalid port name: " + portname)
    


print("\n\n***** Initializing FPGA on port: " + portname + " *****\n")

#Create the object
board_obj = rbd.rfsoc_board(portname, use_dummy_mode)

#Save it to the database
rbd.save_rfsoc_board(board_obj)

#Done

