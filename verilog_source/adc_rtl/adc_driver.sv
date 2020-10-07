



module adc_driver
(

	input wire ps_clk, pl_clk,
	
	input wire rst,
	
	//MUST COME FROM OUTPUT OF RFSOC_CTRL!!!
	input wire [15:0] gpio_ctrl,
	
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

module adc_ctrl
(
    pl_clk,
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

endmodule