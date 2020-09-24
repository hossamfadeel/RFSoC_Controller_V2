

module axis_sync_fifo
(

	input wire rst,
	input wire axis_clk,

    input wire s_axis_tvalid,
    output wire s_axis_tready,
    input wire [255:0] s_axis_tdata,
    
    output wire [255:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready 
);

wire full, empty;
assign m_axis_tvalid = !empty;

FIFO_memory #(256, 16) sync_fifo
(
	axis_clk,
	rst,
	
	s_axis_tdata,	
	m_axis_tready,//read
	s_axis_tvalid,//write
	m_axis_tdata,
	
	full,
	empty
	
);

endmodule


module axis_async_fifo
(
	input wire rst,

	input wire s_axis_clk,
	input wire s_axis_tvalid,
    output wire s_axis_tready,
    input wire [255:0] s_axis_tdata,
    
	input wire m_axis_clk,
    output wire [255:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready 
);

wire full, empty;
wire clear_in = !rst;

assign m_axis_tvalid = !empty;

aFifo #(256, 4) async_fifo
(
	m_axis_tdata,
	empty,
	m_axis_tready,
	m_axis_clk,
	
	s_axis_tdata,
	full, 
	s_axis_tvalid,
	s_axis_clk,
	
	clear_in
	
);


endmodule


//Moves GPIO signals from PS to PL
module gpio_fifo
(

);




endmodule





