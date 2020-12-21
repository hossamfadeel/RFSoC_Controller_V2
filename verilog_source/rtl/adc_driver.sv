

import rfsoc_config::*;

module adc_driver
#(parameter mem_width = 16)
(

	input wire clk,
	
	input wire rst,
	
	//MUST COME FROM OUTPUT OF RFSOC_CTRL!!!
	input wire [15:0] gpio_ctrl_ext,
	
	//Input from ADC
	input wire [127:0] s_axis_tdata,
	input wire s_axis_tvalid,
	output wire s_axis_tready,
	
	//Output to CPU
	output wire [ps_axis_width-1:0] m_axis_tdata,
	output wire m_axis_tvalid,
	input wire m_axis_tready,
	
	input wire select_in

);

reg [15:0] gpio_ctrl;
always @ (posedge clk or negedge rst) begin
	if(!rst) begin
		gpio_ctrl <= 0;
	end
	else begin
		gpio_ctrl <= gpio_ctrl_ext;
	end
end

//Always ready to receive data from ADC whether or not we're keeping it
assign s_axis_tready = 1;

//Register slice for ADC data to break critial path
reg [127:0] adc_data;
always @ (posedge clk) begin
	adc_data <= s_axis_tdata;
end


//ADC controller module
wire dummy_ready;

//ADC_ctrl to fifo
wire [127:0] m_axis_tdata_0;
wire m_axis_tvalid_0;
wire m_axis_tready_0;

//Fifo to adc_ctrl
wire [127:0] s_axis_tdata_1;
wire s_axis_tvalid_1;
wire s_axis_tready_1;


//ADC_ctrl to 128-32 converter
wire [127:0] m_axis_tdata_1;
wire m_axis_tvalid_1;
wire m_axis_tready_1;

adc_ctrl adc_ctrl_inst
(
    clk,
    rst,
    gpio_ctrl[trigger_line],
    gpio_ctrl,
    
    //Input from ADC
    adc_data,
    1'b1,
    dummy_ready,
    
    //Outputs to data fifos
    m_axis_tdata_0,
    m_axis_tvalid_0,
    m_axis_tready_0,
    
    //Loopback interfaces from data fifos
    s_axis_tdata_1,
    s_axis_tvalid_1,
    s_axis_tready_1,

    
    //Outputs to 128-32 converter which goes to CPU
    m_axis_tdata_1,
    m_axis_tvalid_1,
    m_axis_tready_1,
	
	//Same selector lines as for DACs
	select_in
);


axis_sync_fifo
#(mem_width,128)
adc_storage_fifo
(
	rst,
	clk,

    m_axis_tvalid_0,
    m_axis_tready_0,
    m_axis_tdata_0,
    
    s_axis_tdata_1,
    s_axis_tvalid_1,
    s_axis_tready_1 | gpio_ctrl[adc_buffer_flush] 
);

wire m_axis_tvalid_int;
//Data is valid iff adc readout is enabled
assign m_axis_tvalid = m_axis_tvalid_int & gpio_ctrl[adc_readout_enable];

axis_pl_to_ps axis_pl_to_ps_inst
(
	clk,
	
	rst,
	
	//Input from adc_ctrl
    m_axis_tdata_1,
    m_axis_tvalid_1,
    m_axis_tready_1,
	
	//Output to PS
	m_axis_tdata,
    m_axis_tvalid_int,
	//Stop readout if adc readout is disabled
    (m_axis_tready & gpio_ctrl[adc_readout_enable]) | gpio_ctrl[adc_buffer_flush],
	
	gpio_ctrl

);


endmodule