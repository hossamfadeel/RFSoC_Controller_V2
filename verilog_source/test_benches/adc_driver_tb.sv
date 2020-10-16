

import rfsoc_config::*;

module adc_driver_tb();


reg ps_clk, pl_clk, rst;

reg [15:0] gpio_ctrl;

reg [127:0] s_axis_tdata;
wire s_axis_tvalid = 1;
wire s_axis_tready;

wire [31:0] m_axis_tdata;
wire m_axis_tvalid;
reg m_axis_tready;
reg select_in;

integer i, j;

adc_driver
#(16) dut
(

	ps_clk, pl_clk,
	
	rst,
	
	//MUST COME FROM OUTPUT OF RFSOC_CTRL!!!
	gpio_ctrl,
	
	//Input from ADC
	s_axis_tdata,
	s_axis_tvalid,
	s_axis_tready,
	
	//Output to CPU
	m_axis_tdata,
	m_axis_tvalid,
	m_axis_tready,
	
	select_in

);

integer num_errors;

initial begin

	num_errors = 0;

	i = 0;
	j = 0;
	ps_clk <= 0;
	pl_clk <= 0;
	rst <= 1;
	
	gpio_ctrl <= 0;
	s_axis_tdata <= {16'h1000, 16'h2000, 16'h3000, 16'h4000, 16'h5000, 16'h6000, 16'h7000, 16'h8000};
	
	m_axis_tready <= 0;
	
	select_in <= 0;
	
	repeat(10) clk_cycle();
	rst <= 0;
	repeat(10) clk_cycle();
	rst <= 1;
	repeat(10) clk_cycle();


	//Set the capture cycles to 4
	set_adc_run_cycles(4);
	
	//Set the shift val to 2
	set_adc_shift_val(2);
	
	//trigger the adc 4 times (2 ^ 2)
	for(j = 0; j < 4; j = j + 1) begin
		gpio_ctrl[trigger_line] <= 1;
		clk_cycle();
		gpio_ctrl[trigger_line] <= 0;
		
		repeat(50) clk_cycle();
	end
	
	//Set the shift val to 0 to permit readout
	set_adc_shift_val(0);
	
	//Now readout the result
	m_axis_tready <= 1;
	
	for(j = 0; j < 16; j = j + 1) begin
	
		if(m_axis_tdata != s_axis_tdata[(j*32)+:32])begin
			num_errors = num_errors + 1;
		end
		clk_cycle();
	end
	
	repeat(100) clk_cycle();
	m_axis_tready <= 0;
	repeat(100) clk_cycle();

	$display("ADC driver readout test complete for shift val = 4, number of errors: %0d\n", num_errors);

end



task clk_cycle();
begin
	
	#1
	pl_clk <= 1;
	#1
	pl_clk <= 0;
	ps_clk <= 1;
	#1
	pl_clk <= 1;
	#1
	pl_clk <= 0;
	ps_clk <= 0;

end
endtask


task set_adc_run_cycles;
input [config_reg_width-1:0] cycle_count;
begin

	clk_cycle();
	select_in <= 1;
	clk_cycle();
	
	for(i = 0; i < config_reg_width; i = i + 1) begin
	
		//set the data line
		gpio_ctrl[sdata] <= cycle_count[i];
		clk_cycle();
		clk_cycle();
		gpio_ctrl[adc_num_cycle_count_clk] <= 1;
		clk_cycle();
		clk_cycle();
		gpio_ctrl[adc_num_cycle_count_clk] <= 0;
		clk_cycle();
		clk_cycle();

	end
	
	clk_cycle();
	select_in <= 0;
	clk_cycle();
	
end
endtask

task set_adc_shift_val;
input [config_reg_width-1:0] shift_val;
begin

	clk_cycle();
	select_in <= 1;
	clk_cycle();
	
	for(i = 0; i < config_reg_width; i = i + 1) begin
	
		//set the data line
		gpio_ctrl[sdata] <= shift_val[i];
		clk_cycle();
		clk_cycle();
		gpio_ctrl[adc_shift_val_clk] <= 1;
		clk_cycle();
		clk_cycle();
		gpio_ctrl[adc_shift_val_clk] <= 0;
		clk_cycle();
		clk_cycle();

	end
	
	clk_cycle();
	select_in <= 0;
	clk_cycle();
	
end
endtask


endmodule