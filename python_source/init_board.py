


import rfsoc_board_driver as rbd


#if we weren't passed a port as an argument
if(len(sys.argv) == 1):
    raise ValueError("Error, please provide a portname as an argument..., usage is \"init_board.py PORTNAME\"")
    
portname = sys.argv[1]

if portname not in rbd.get_port_list():
    rbd.print_port_list()
    raise ValueError("Invalid port name: " + portname)
    


print("\n\n***** Initializing FPGA on port: " + portname + " *****\n")

#Create the object
board_obj = rbd.rfsoc_board(portname)

#Save it to the database
rbd.save_rfsoc_board(board_obj)

#Done