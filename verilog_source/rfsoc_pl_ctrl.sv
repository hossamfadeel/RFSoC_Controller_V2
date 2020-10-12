
import rfsoc_config::*;

module rfsoc_pl_ctrl
(
	input wire ps_clk, pl_clk,
	input wire rst,
	
	input wire [15:0] gpio_ctrl,
	
	//AXIS input from PS
	input wire [ps_axis_width-1:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output wire s_axis_tready,
	
	
	//AXIS output to PS
	output wire [ps_axis_width-1:0] m16_axis_tdata,
	output wire m16_axis_tvalid,
	input wire m16_axis_tready,
	
	
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
    input wire m15_axis_tready,
	
	
	
	//AXIS inputs from ADC
	input wire [127:0] s0_axis_tdata,
    input wire s0_axis_tvalid,
    output wire s0_axis_tready,
	
	input wire [127:0] s1_axis_tdata,
    input wire s1_axis_tvalid,
    output wire s1_axis_tready,
	
	input wire [127:0] s2_axis_tdata,
    input wire s2_axis_tvalid,
    output wire s2_axis_tready,
	
	input wire [127:0] s3_axis_tdata,
    input wire s3_axis_tvalid,
    output wire s3_axis_tready,
	
	input wire [127:0] s4_axis_tdata,
    input wire s4_axis_tvalid,
    output wire s4_axis_tready,
	
	input wire [127:0] s5_axis_tdata,
    input wire s5_axis_tvalid,
    output wire s5_axis_tready,
	
	input wire [127:0] s6_axis_tdata,
    input wire s6_axis_tvalid,
    output wire s6_axis_tready,
	
	input wire [127:0] s7_axis_tdata,
    input wire s7_axis_tvalid,
    output wire s7_axis_tready,
	
	input wire [127:0] s8_axis_tdata,
    input wire s8_axis_tvalid,
    output wire s8_axis_tready,
	
	input wire [127:0] s9_axis_tdata,
    input wire s9_axis_tvalid,
    output wire s9_axis_tready,
	
	input wire [127:0] s10_axis_tdata,
    input wire s10_axis_tvalid,
    output wire s10_axis_tready,
	
	input wire [127:0] s11_axis_tdata,
    input wire s11_axis_tvalid,
    output wire s11_axis_tready,
	
	input wire [127:0] s12_axis_tdata,
    input wire s12_axis_tvalid,
    output wire s12_axis_tready,
	
	input wire [127:0] s13_axis_tdata,
    input wire s13_axis_tvalid,
    output wire s13_axis_tready,
	
	input wire [127:0] s14_axis_tdata,
    input wire s14_axis_tvalid,
    output wire s14_axis_tready,
	
	input wire [127:0] s15_axis_tdata,
    input wire s15_axis_tvalid,
    output wire s15_axis_tready
	
);

//GPIO clock crossing fifo
wire [15:0] gpio_ctrl_int;//GPIO ctrl bus in pl clock domain
gpio_fifo gfifo
(
	rst,
	
	ps_clk, pl_clk,
	
	gpio_ctrl,
	
	gpio_ctrl_int
);


wire rst_int = rst & !gpio_ctrl_int[pl_rst];


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
    s_axis_tready_int
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

//Trigger definition
wire trigger_int = gpio_ctrl_int[trigger_line];


//Output bus from ADC drivers to axis_n_mux
wire [(ps_axis_width*16)-1:0] adc_axis_tdata;
wire [15:0] adc_axis_tvalid;
wire [15:0] adc_axis_tready;

//axis_n_mux for selecting adc for readout
axis_n_mux axis_n_mux_inst
(
	channel_select,
	
	//Inputs from 16 adc drivers
	adc_axis_tdata,
	adc_axis_tvalid,
	adc_axis_tready,
	
	m16_axis_tdata,
	m16_axis_tvalid,
	m16_axis_tready
	
);

//Wide bus for routing signals into the adc drivers from RFSOC
wire [(ps_axis_width*128)-1:0] adc_in_axis_tdata;
wire [15:0] adc_in_axis_tvalid;
wire [15:0] adc_in_axis_tready;

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
		dac_driver #(dac_fifo_mem_width) real_channel_ctrl
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
	
	if(i > adc_stop_channel) begin
	
		adc_driver #(2) adc_driver_inst
		(

			ps_clk, pl_clk,
			
			rst,
			
			//MUST COME FROM OUTPUT OF RFSOC_CTRL!!!
			gpio_ctrl_int,
			
			//Input from ADC
			adc_in_axis_tdata[(i*128)+:128],
			adc_in_axis_tvalid[i],
			adc_in_axis_tready[i],
			
			//Output to CPU
			adc_axis_tdata[(i*ps_axis_width)+:ps_axis_width],
			adc_axis_tvalid[i],
			adc_axis_tready[i],
			
			channel_select[i]

		);
	
	end
	else begin
	
		adc_driver #(adc_fifo_mem_width) adc_driver_inst
		(

			ps_clk, pl_clk,
			
			rst,
			
			//MUST COME FROM OUTPUT OF RFSOC_CTRL!!!
			gpio_ctrl_int,
			
			//Input from ADC
			adc_in_axis_tdata[(i*128)+:128],
			adc_in_axis_tvalid[i],
			adc_in_axis_tready[i],
			
			//Output to CPU
			adc_axis_tdata[(i*ps_axis_width)+:ps_axis_width],
			adc_axis_tvalid[i],
			adc_axis_tready[i],
			
			channel_select[i]

		);
	
	end
	
	
end

/////////////////////////////////////////////////////////
//Connections between ADC outputs and ADC driver inputs//
/////////////////////////////////////////////////////////
assign adc_in_axis_tdata[(0*128)+:128] = s0_axis_tdata;
assign adc_in_axis_tvalid[0] = s0_axis_tvalid;
assign s0_axis_tready = adc_in_axis_tready[0];

assign adc_in_axis_tdata[(1*128)+:128] = s1_axis_tdata;
assign adc_in_axis_tvalid[1] = s1_axis_tvalid;
assign s1_axis_tready = adc_in_axis_tready[1];

assign adc_in_axis_tdata[(2*128)+:128] = s2_axis_tdata;
assign adc_in_axis_tvalid[2] = s2_axis_tvalid;
assign s2_axis_tready = adc_in_axis_tready[2];

assign adc_in_axis_tdata[(3*128)+:128] = s3_axis_tdata;
assign adc_in_axis_tvalid[3] = s3_axis_tvalid;
assign s3_axis_tready = adc_in_axis_tready[3];

assign adc_in_axis_tdata[(4*128)+:128] = s4_axis_tdata;
assign adc_in_axis_tvalid[4] = s4_axis_tvalid;
assign s4_axis_tready = adc_in_axis_tready[4];

assign adc_in_axis_tdata[(5*128)+:128] = s5_axis_tdata;
assign adc_in_axis_tvalid[5] = s5_axis_tvalid;
assign s5_axis_tready = adc_in_axis_tready[5];

assign adc_in_axis_tdata[(6*128)+:128] = s6_axis_tdata;
assign adc_in_axis_tvalid[6] = s6_axis_tvalid;
assign s6_axis_tready = adc_in_axis_tready[6];

assign adc_in_axis_tdata[(7*128)+:128] = s7_axis_tdata;
assign adc_in_axis_tvalid[7] = s7_axis_tvalid;
assign s7_axis_tready = adc_in_axis_tready[7];

assign adc_in_axis_tdata[(8*128)+:128] = s8_axis_tdata;
assign adc_in_axis_tvalid[8] = s8_axis_tvalid;
assign s8_axis_tready = adc_in_axis_tready[8];

assign adc_in_axis_tdata[(9*128)+:128] = s9_axis_tdata;
assign adc_in_axis_tvalid[9] = s9_axis_tvalid;
assign s9_axis_tready = adc_in_axis_tready[9];

assign adc_in_axis_tdata[(10*128)+:128] = s10_axis_tdata;
assign adc_in_axis_tvalid[10] = s10_axis_tvalid;
assign s10_axis_tready = adc_in_axis_tready[10];

assign adc_in_axis_tdata[(11*128)+:128] = s11_axis_tdata;
assign adc_in_axis_tvalid[11] = s11_axis_tvalid;
assign s11_axis_tready = adc_in_axis_tready[11];

assign adc_in_axis_tdata[(12*128)+:128] = s12_axis_tdata;
assign adc_in_axis_tvalid[12] = s12_axis_tvalid;
assign s12_axis_tready = adc_in_axis_tready[12];

assign adc_in_axis_tdata[(13*128)+:128] = s13_axis_tdata;
assign adc_in_axis_tvalid[13] = s13_axis_tvalid;
assign s13_axis_tready = adc_in_axis_tready[13];

assign adc_in_axis_tdata[(14*128)+:128] = s14_axis_tdata;
assign adc_in_axis_tvalid[14] = s14_axis_tvalid;
assign s14_axis_tready = adc_in_axis_tready[14];

assign adc_in_axis_tdata[(15*128)+:128] = s15_axis_tdata;
assign adc_in_axis_tvalid[15] = s15_axis_tvalid;
assign s15_axis_tready = adc_in_axis_tready[15];

///////////////////////////////////////////////////
//Connections between DAC driver outputs and DACs//
///////////////////////////////////////////////////

assign m0_axis_tdata = channel_data[(0*256)+:256];
assign m0_axis_tvalid = channel_tvalid[0];
assign channel_tready[0] = m0_axis_tready;

assign m1_axis_tdata = channel_data[(1*256)+:256];
assign m1_axis_tvalid = channel_tvalid[1];
assign channel_tready[1] = m1_axis_tready;

assign m2_axis_tdata = channel_data[(2*256)+:256];
assign m2_axis_tvalid = channel_tvalid[2];
assign channel_tready[2] = m2_axis_tready;

assign m3_axis_tdata = channel_data[(3*256)+:256];
assign m3_axis_tvalid = channel_tvalid[3];
assign channel_tready[3] = m3_axis_tready;

assign m4_axis_tdata = channel_data[(4*256)+:256];
assign m4_axis_tvalid = channel_tvalid[4];
assign channel_tready[4] = m4_axis_tready;

assign m5_axis_tdata = channel_data[(5*256)+:256];
assign m5_axis_tvalid = channel_tvalid[5];
assign channel_tready[5] = m5_axis_tready;

assign m6_axis_tdata = channel_data[(6*256)+:256];
assign m6_axis_tvalid = channel_tvalid[6];
assign channel_tready[6] = m6_axis_tready;

assign m7_axis_tdata = channel_data[(7*256)+:256];
assign m7_axis_tvalid = channel_tvalid[7];
assign channel_tready[7] = m7_axis_tready;

assign m8_axis_tdata = channel_data[(8*256)+:256];
assign m8_axis_tvalid = channel_tvalid[8];
assign channel_tready[8] = m8_axis_tready;

assign m9_axis_tdata = channel_data[(9*256)+:256];
assign m9_axis_tvalid = channel_tvalid[9];
assign channel_tready[9] = m9_axis_tready;

assign m10_axis_tdata = channel_data[(10*256)+:256];
assign m10_axis_tvalid = channel_tvalid[10];
assign channel_tready[10] = m10_axis_tready;

assign m11_axis_tdata = channel_data[(11*256)+:256];
assign m11_axis_tvalid = channel_tvalid[11];
assign channel_tready[11] = m11_axis_tready;

assign m12_axis_tdata = channel_data[(12*256)+:256];
assign m12_axis_tvalid = channel_tvalid[12];
assign channel_tready[12] = m12_axis_tready;

assign m13_axis_tdata = channel_data[(13*256)+:256];
assign m13_axis_tvalid = channel_tvalid[13];
assign channel_tready[13] = m13_axis_tready;

assign m14_axis_tdata = channel_data[(14*256)+:256];
assign m14_axis_tvalid = channel_tvalid[14];
assign channel_tready[14] = m14_axis_tready;

assign m15_axis_tdata = channel_data[(15*256)+:256];
assign m15_axis_tvalid = channel_tvalid[15];
assign channel_tready[15] = m15_axis_tready;


endmodule