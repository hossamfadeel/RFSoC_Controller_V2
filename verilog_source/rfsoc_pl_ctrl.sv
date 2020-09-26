
import rfsoc_config::*;

module rfsoc_pl_ctrl
#(parameter ps_axis_width = 32)
(
	input wire ps_clk, pl_clk,
	input wire rst,
	
	input wire [15:0] gpio_ctrl,
	
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
	
	rst_int,
	
	//AXIS input from PS
	s_axis_tdata,
    s_axis_tvalid,
    s_axis_tready,
	
	
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

//Wide output from channel ctrl modules to be routed to RFSoC IP DACs
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
			
			//out
			channel_data[(i*256)+:256],
			channel_tvalid[i],
			channel_tready[i],

			//in
			m_axis_tdata[(i*256)+:256],
			m_axis_tvalid[i],
			m_axis_tready[i],
			
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
			
			//out
			channel_data[(i*256)+:256],
			channel_tvalid[i],
			channel_tready[i],
			
			//in
			m_axis_tdata[(i*256)+:256],
			m_axis_tvalid[i],
			m_axis_tready[i],
			
			trigger_int,
			
			channel_select[i]
		);
	end
end

//Connections between DAC driver outputs and DACs

assign m0_axis_tdata = channel_data[(0*256)+:256];
assign m0_axis_tvalid = channel_tvalid[0];
assign m0_axis_tready = channel_tready[0];

assign m1_axis_tdata = channel_data[(1*256)+:256];
assign m1_axis_tvalid = channel_tvalid[1];
assign m1_axis_tready = channel_tready[1];

assign m2_axis_tdata = channel_data[(2*256)+:256];
assign m2_axis_tvalid = channel_tvalid[2];
assign m2_axis_tready = channel_tready[2];

assign m3_axis_tdata = channel_data[(3*256)+:256];
assign m3_axis_tvalid = channel_tvalid[3];
assign m3_axis_tready = channel_tready[3];

assign m4_axis_tdata = channel_data[(4*256)+:256];
assign m4_axis_tvalid = channel_tvalid[4];
assign m4_axis_tready = channel_tready[4];

assign m5_axis_tdata = channel_data[(5*256)+:256];
assign m5_axis_tvalid = channel_tvalid[5];
assign m5_axis_tready = channel_tready[5];

assign m6_axis_tdata = channel_data[(6*256)+:256];
assign m6_axis_tvalid = channel_tvalid[6];
assign m6_axis_tready = channel_tready[6];

assign m7_axis_tdata = channel_data[(7*256)+:256];
assign m7_axis_tvalid = channel_tvalid[7];
assign m7_axis_tready = channel_tready[7];

assign m8_axis_tdata = channel_data[(8*256)+:256];
assign m8_axis_tvalid = channel_tvalid[8];
assign m8_axis_tready = channel_tready[8];

assign m9_axis_tdata = channel_data[(9*256)+:256];
assign m9_axis_tvalid = channel_tvalid[9];
assign m9_axis_tready = channel_tready[9];

assign m10_axis_tdata = channel_data[(10*256)+:256];
assign m10_axis_tvalid = channel_tvalid[10];
assign m10_axis_tready = channel_tready[10];

assign m11_axis_tdata = channel_data[(11*256)+:256];
assign m11_axis_tvalid = channel_tvalid[11];
assign m11_axis_tready = channel_tready[11];

assign m12_axis_tdata = channel_data[(12*256)+:256];
assign m12_axis_tvalid = channel_tvalid[12];
assign m12_axis_tready = channel_tready[12];

assign m13_axis_tdata = channel_data[(13*256)+:256];
assign m13_axis_tvalid = channel_tvalid[13];
assign m13_axis_tready = channel_tready[13];

assign m14_axis_tdata = channel_data[(14*256)+:256];
assign m14_axis_tvalid = channel_tvalid[14];
assign m14_axis_tready = channel_tready[14];

assign m15_axis_tdata = channel_data[(15*256)+:256];
assign m15_axis_tvalid = channel_tvalid[15];
assign m15_axis_tready = channel_tready[15];


endmodule