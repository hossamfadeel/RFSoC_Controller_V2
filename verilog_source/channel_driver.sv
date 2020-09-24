


module channel_driver
(

	input wire clk,
	input wire rst,
	
	input wire [15:0] gpio_ctrl,
	
	//Output to RFSoC IP
	output wire [255:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready,
	
	//Input 1-16 selector
    input wire [255:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output reg s_axis_tready
	
	input wire trigger_in,
	
	input wire select_in
	
	
);


wire [255:0] waveform_fifo_tdata;
wire waveform_fifo_tvalid, waveform_fifo_tready;
wire mux_sel;
//Channel controller instantiation
channel_ctrl chan_ctrl
(

	clk,
	rst,
	
	m_axis_tdata,
	m_axis_tvalid,
	m_axis_tready,
	
	waveform_fifo_tdata,
	waveform_fifo_tvalid,
	waveform_fifo_tready,
	
	gpio_ctrl,
	trigger_in,
	select_in,
	
	mux_sel
);

//Waveform fifo
wire [255:0] s0_axis_tdata;
wire s0_axis_tready, s0_axis_tvalid;
axis_sync_fifo waveform_fifo
(

	rst,
	clk,

	//Input from mux
    s0_axis_tvalid,
    s0_axis_tready,
    s0_axis_tdata,
    
	//Output to channel_ctrl and loopback mux
    waveform_fifo_tdata,
    waveform_fifo_tvalid,
    waveform_fifo_tready
	
);


//axis loopback mux
axis_mux loopback_mux
(
    clk,
    rst,
    
    //input from PS
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    
    //input from self
    waveform_fifo_tvalid,
    waveform_fifo_tready,
    waveform_fifo_tdata,
    
    mux_sel,
    
    //output
    s0_axis_tdata,
    s0_axis_tvalid,
    s0_axis_tready 
    
);




endmodule