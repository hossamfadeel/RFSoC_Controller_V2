import rfsoc_config::*;



//Selects the channel to be written to over GPIO or AXIS


module channel_selector
(

	input wire clk,
	input wire rst,
	
	input wire [15:0] gpio_ctrl,
	
	output wire [15:0] channel_select
);


//Shift register for channel selection
shift_register
#(
	16//width
)
channel_sr
(
    clk,
    gpio_ctrl[sel_clk],
    rst,
    gpio_ctrl[sdata],
    channel_select
);



endmodule