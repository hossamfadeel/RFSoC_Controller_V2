import rfsoc_config::*;

module axis_sync_fifo
#(parameter mem_width = 16, parameter bus_width = 256)
(

	input wire rst,
	input wire axis_clk,

    input wire s_axis_tvalid,
    output wire s_axis_tready,
    input wire [bus_width-1:0] s_axis_tdata,
    
    output wire [bus_width-1:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready 
);

wire [(bus_width/8)-1:0] m_axis_tkeep;
wire m_axis_tlast;
wire [7:0] m_axis_tid;
wire m_axis_tuser;
wire [7:0] m_axis_tdest;
wire status_bad_frame, status_good_frame, status_overflow;
axis_fifo #
(
    // FIFO depth in words
    // KEEP_WIDTH words per cycle if KEEP_ENABLE set
    // Rounded up to nearest power of 2 cycles
    2 ** mem_width, //parameter DEPTH = 4096,
    // Width of AXI stream interfaces in bits
    bus_width,//parameter DATA_WIDTH = 8,
    // Propagate tkeep signal
    // If disabled, tkeep assumed to be 1'b1
    1'b0,//parameter KEEP_ENABLE = (DATA_WIDTH>8),
    // tkeep signal width (words per cycle)
    bus_width/8,//parameter KEEP_WIDTH = (DATA_WIDTH/8),
    // Propagate tlast signal
    1'b0,//parameter LAST_ENABLE = 1,
    // Propagate tid signal
    1'b0,//parameter ID_ENABLE = 0,
    // tid signal width
    8,//parameter ID_WIDTH = 8,
    // Propagate tdest signal
    0,//parameter DEST_ENABLE = 0,
    // tdest signal width
    8,//parameter DEST_WIDTH = 8,
    // Propagate tuser signal
    0,//parameter USER_ENABLE = 1,
    // tuser signal width
    1,//parameter USER_WIDTH = 1,
    // number of output pipeline registers
    2,//parameter PIPELINE_OUTPUT = 2,
    // Frame FIFO mode - operate on frames instead of cycles
    // When set, m_axis_tvalid will not be deasserted within a frame
    // Requires LAST_ENABLE set
    0,//parameter FRAME_FIFO = 0,
    // tuser value for bad frame marker
    1'b1,//parameter USER_BAD_FRAME_VALUE = 1'b1,
    // tuser mask for bad frame marker
    1'b1,//parameter USER_BAD_FRAME_MASK = 1'b1,
    // Drop frames marked bad
    // Requires FRAME_FIFO set
    0,//parameter DROP_BAD_FRAME = 0,
    // Drop incoming frames when full
    // When set, s_axis_tready is always asserted
    // Requires FRAME_FIFO set
    0//parameter DROP_WHEN_FULL = 0
) sync_fifo
(
    axis_clk,
    !rst,

    /*
     * AXI input
     */
    s_axis_tdata,
    {(bus_width/8){1'b1}},//s_axis_tkeep,
    s_axis_tvalid,
    s_axis_tready,
    1'b0,//s_axis_tlast,
    8'b0,//s_axis_tid,
    8'b0,//s_axis_tdest,
    1'b0,//s_axis_tuser,

    /*
     * AXI output
     */
    m_axis_tdata,
    m_axis_tkeep,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,

    /*
     * Status
     */
    status_overflow,
    status_bad_frame,
    status_good_frame
);

endmodule


module axis_async_fifo
#(parameter width = 256)
(
	input wire rst,

	input wire s_axis_clk,
	input wire s_axis_tvalid,
    output wire s_axis_tready,
    input wire [width-1:0] s_axis_tdata,
    
	input wire m_axis_clk,
    output wire [width-1:0] m_axis_tdata,
    output reg m_axis_tvalid,
    input wire m_axis_tready 
);

wire full, empty;
wire clear_in = !rst;

wire m_axis_tvalid_int = !empty;
assign s_axis_tready = !full;

aFifo #(width, 4) async_fifo
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

//One cycle delay for write clock
always @ (posedge m_axis_clk or negedge rst) begin
	if(!rst) begin
		m_axis_tvalid <= 0;
	end
	else begin
		m_axis_tvalid <= m_axis_tvalid_int;
	end
end



endmodule


//Moves GPIO signals from PS to PL
module gpio_fifo
(
	input wire rst,
	
	input wire ps_clk, pl_clk,
	
	input wire [15:0] gpio_in,
	
	output wire [15:0] gpio_out
);

wire clear_in = !rst;
wire full, empty;
aFifo #(16, 4) async_fifo
(
	gpio_out,
	empty,
	1'b1,
	pl_clk,
	
	gpio_in,
	full, 
	1'b1,
	ps_clk,
	
	clear_in
	
);


endmodule



























// module axis_sync_fifo
// #(parameter mem_width = 16, parameter bus_width = 256)
// (

	// input wire rst,
	// input wire axis_clk,

    // input wire s_axis_tvalid,
    // output wire s_axis_tready,
    // input wire [bus_width-1:0] s_axis_tdata,
    
    // output wire [bus_width-1:0] m_axis_tdata,
    // output reg m_axis_tvalid,
    // input wire m_axis_tready 
// );

// wire full, empty;
// wire m_axis_tvalid_int = !empty;
// assign s_axis_tready = !full;

// FIFO_memory #(bus_width, mem_width) sync_fifo
// (
	// axis_clk,
	// rst,
	
	// s_axis_tdata,	
	// m_axis_tready,//read
	// s_axis_tvalid,//write
	// m_axis_tdata,
	
	// empty,
	// full
	
// );
// reg m_axis_tvalid_reg;
// assign m_axis_tvalid = m_axis_tvalid_reg & m_axis_tvalid_int;
// always @ (posedge axis_clk or negedge rst) begin
	// if(!rst) begin
		// m_axis_tvalid_reg <= 0;
	// end
	// else begin
		// m_axis_tvalid_reg <= m_axis_tvalid_int;
	// end
// end

// endmodule


// module axis_async_fifo
// #(parameter width = 256)
// (
	// input wire rst,

	// input wire s_axis_clk,
	// input wire s_axis_tvalid,
    // output wire s_axis_tready,
    // input wire [width-1:0] s_axis_tdata,
    
	// input wire m_axis_clk,
    // output wire [width-1:0] m_axis_tdata,
    // output reg m_axis_tvalid,
    // input wire m_axis_tready 
// );

// wire full, empty;
// wire clear_in = !rst;

// wire m_axis_tvalid_int = !empty;
// assign s_axis_tready = !full;

// aFifo #(width, 4) async_fifo
// (
	// m_axis_tdata,
	// empty,
	// m_axis_tready,
	// m_axis_clk,
	
	// s_axis_tdata,
	// full, 
	// s_axis_tvalid,
	// s_axis_clk,
	
	// clear_in
	
// );

//One cycle delay for write clock
// always @ (posedge m_axis_clk or negedge rst) begin
	// if(!rst) begin
		// m_axis_tvalid <= 0;
	// end
	// else begin
		// m_axis_tvalid <= m_axis_tvalid_int;
	// end
// end



// endmodule


//Moves GPIO signals from PS to PL
// module gpio_fifo
// (
	// input wire rst,
	
	// input wire ps_clk, pl_clk,
	
	// input wire [15:0] gpio_in,
	
	// output wire [15:0] gpio_out
// );

// wire clear_in = !rst;
// wire full, empty;
// aFifo #(16, 4) async_fifo
// (
	// gpio_out,
	// empty,
	// 1'b1,
	// pl_clk,
	
	// gpio_in,
	// full, 
	// 1'b1,
	// ps_clk,
	
	// clear_in
	
// );


// endmodule




