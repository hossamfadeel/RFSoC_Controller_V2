
import rfsoc_config::*;

module rfsoc_pl_ctrl
#(parameter ps_axis_width = 32)
(
	input wire ps_clk, pl_clk,
	input wire rst,
	
	input wire gpio_ctrl,
	
	//AXIS input from PS
	input wire [ps_axis_width-1:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output wire s_axis_tready,
	
	
	//AXIS outputs to RFSoC IP
	output wire [255:0] m0_axis_tdata,
    output wire m0_axis_tvalid,
    input wire m0_axis_tready,
	
	output wire [255:0] m1_axis_tdata,
    output wire m1_axis_tvalid,
    input wire m1_axis_tready,
	
	output wire [255:0] m2_axis_tdata,
    output wire m2_axis_tvalid,
    input wire m2_axis_tready,
	
	output wire [255:0] m3_axis_tdata,
    output wire m3_axis_tvalid,
    input wire m3_axis_tready,
	
	output wire [255:0] m4_axis_tdata,
    output wire m4_axis_tvalid,
    input wire m4_axis_tready,
	
	output wire [255:0] m5_axis_tdata,
    output wire m5_axis_tvalid,
    input wire m5_axis_tready,
	
	output wire [255:0] m6_axis_tdata,
    output wire m6_axis_tvalid,
    input wire m6_axis_tready,
	
	output wire [255:0] m7_axis_tdata,
    output wire m7_axis_tvalid,
    input wire m7_axis_tready,
	
	output wire [255:0] m8_axis_tdata,
    output wire m8_axis_tvalid,
    input wire m8_axis_tready,
	
	output wire [255:0] m9_axis_tdata,
    output wire m9_axis_tvalid,
    input wire m9_axis_tready,
	
	output wire [255:0] m10_axis_tdata,
    output wire m10_axis_tvalid,
    input wire m10_axis_tready,
	
	output wire [255:0] m11_axis_tdata,
    output wire m11_axis_tvalid,
    input wire m11_axis_tready,
	
	output wire [255:0] m12_axis_tdata,
    output wire m12_axis_tvalid,
    input wire m12_axis_tready,
	
	output wire [255:0] m13_axis_tdata,
    output wire m13_axis_tvalid,
    input wire m13_axis_tready,
	
	output wire [255:0] m14_axis_tdata,
    output wire m14_axis_tvalid,
    input wire m14_axis_tready,
	
	output wire [255:0] m15_axis_tdata,
    output wire m15_axis_tvalid,
    input wire m15_axis_tready
	
);


wire rst_int = rst & gpio_ctrl[pl_rst];


//GPIO clock crossing fifo
wire [15:0] gpio_ctrl_int;//GPIO ctrl bus in pl clock domain
gpio_fifo gfifo
(
	rst_int,
	
	ps_clk, pl_clk,
	
	gpio_ctrl,
	
	gpio_ctrl_int,
);

//Channel selector for controlling which channel is being written to
wire [15:0] channel_select;
channel_selector chan_sel
(

	pl_clk,
	rst_int,
	
	gpio_ctrl_int,
	
	channel_select
);

//ps to pl AXIS width converter and clock crossing fifo
wire [255:0] s_axis_tdata_int;
wire s_axis_tvalid_int;
wire s_axis_tready_int;
axis_ps_to_pl #(32) axis_ps_pl_crossing
(
	ps_clk,
	pl_clk,
	
	input wire rst_int,
	
	//AXIS input from PS
	s_axis_tdata,
    s_axis_tvalid,
    s_axis_tready
	
	
	//AXIS output to PL
	s_axis_tdata_int,
    s_axis_tvalid_int,
    s_axis_tready_int,
);

//AXIS selector
//Output bus
wire [((256*16)-1):0] m_axis_tdata;
wire [15:0] m_axis_tvalid;
wire [15:0] m_axis_tready;
axis_selector axis_sel
(
	channel_select,
	
	//From ps_to_pl module
	s_axis_tdata_int,
    s_axis_tvalid_int,
    s_axis_tready_int,
	
	//Wide output to all channels
	m_axis_tdata,
    m_axis_tvalid,
    m_axis_tready

);

//Wide output from channel ctrl modules to be routed to RFSoC IP
wire [((256*16)-1):0] channel_data;
wire [15:0] channel_tvalid, channel_tready;


wire trigger_int = gpio_ctrl_int[trigger_line];

//genloop for creating channels
genvar i;
for(i = 0; i < 16; i = i + 1) begin
	//If we're not giving this module any memory
	if(i >= dac_stop_channel)begin
		dac_driver #(2) dummy_channel_ctrl
		(
			pl_clk,
			rst,
			
			gpio_ctrl_int,
			
			channel_data[(i*256):+256],
			channel_tvalid[i],
			channel_tready[i],
			
			m_axis_tdata[(i*256):+256],
			m_axis_tvalid[i],
			m0_axis_tready[i],
			
			trigger_int,
			
			channel_select[i]
		);
	end
	else begin
		dac_driver #(dac_fifo_mem_width) dummy_channel_ctrl
		(
			pl_clk,
			rst,
			
			gpio_ctrl_int,
			
			channel_data[(i*256):+256],
			channel_tvalid[i],
			channel_tready[i],
			
			m_axis_tdata[(i*256):+256],
			m_axis_tvalid[i],
			m0_axis_tready[i],
			
			trigger_int,
			
			channel_select[i]
		);
	end
end

//Connections between DAC driver outputs and DACs

assign


endmodule