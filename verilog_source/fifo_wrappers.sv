import rfsoc_config::*;

module axis_sync_fifo
#(parameter mem_width = 16)
(

	input wire rst,
	input wire axis_clk,

    input wire s_axis_tvalid,
    output wire s_axis_tready,
    input wire [255:0] s_axis_tdata,
    
    output wire [255:0] m_axis_tdata,
    output reg m_axis_tvalid,
    input wire m_axis_tready 
);

wire full, empty;
wire m_axis_tvalid_int = !empty;
assign s_axis_tready = !full;

FIFO_memory #(256, mem_width) sync_fifo
(
	axis_clk,
	rst,
	
	s_axis_tdata,	
	m_axis_tready,//read
	s_axis_tvalid,//write
	m_axis_tdata,
	
	empty,
	full
	
);

//One cycle delay for write clock
always @ (posedge axis_clk or negedge rst) begin
	if(!rst) begin
		m_axis_tvalid <= 0;
	end
	else begin
		m_axis_tvalid <= m_axis_tvalid_int;
	end
end

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
    output reg m_axis_tvalid,
    input wire m_axis_tready 
);

wire full, empty;
wire clear_in = !rst;

wire m_axis_tvalid_int = !empty;
assign s_axis_tready = !full;

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
reg write_en;
reg [15:0] gpio_old_state;
aFifo #(16, 4) async_fifo
(
	gpio_out,
	empty,
	1'b1,
	pl_clk,
	
	gpio_in,
	full, 
	write_en,
	ps_clk,
	
	clear_in
	
);

//Writing only when GPIO changes
always @ (posedge ps_clk or negedge rst) begin
	if(!rst) begin
		gpio_old_state <= 0;
		write_en <= 0;
	end
	else begin
		if(gpio_in != gpio_old_state)begin
			write_en <= 1;
			gpio_old_state <= gpio_in;
		end
		else begin
			write_en <= 0;
			gpio_old_state <= gpio_in;
		end
	end
end


endmodule





