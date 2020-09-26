import rfsoc_config::*;


module dac_driver_tb();

reg clk, rst;
reg [15:0] gpio_ctrl;

wire [255:0] m_axis_tdata;
wire m_axis_tvalid;
reg m_axis_tready;

reg [255:0] s_axis_tdata;
reg s_axis_tvalid;
wire s_axis_tready;

reg trigger_in;

reg select_in;

integer i;

dac_driver #(16) dut
(
	clk,
	rst,
	
	gpio_ctrl,
	
	m_axis_tdata,
	m_axis_tvalid,
	m_axis_tready,
	
	s_axis_tdata,
	s_axis_tvalid,
	s_axis_tready,
	
	trigger_in,
	
	select_in
);



initial begin




end

task clk_cycle();
begin

	#1
	clk <= 1;
	#1
	clk <= 0;

end
endtask

task set_cycle_count();
input [255:0] value;
begin
	
	select_in <= 1;
	
	for(i = 0; i < 256; i = i + 1) begin

		//Set the data line
		gpio_ctrl[sdata] <= value[i];
		
		//Cycle the serial clock
		
		repeat(2) clk_cycle();
		gpio_ctrl[cycle_count_clk] <= 1;
		repeat(2) clk_cycle();
		gpio_ctrl[cycle_count_clk] <= 0;
		repeat(2) clk_cycle();
	end
	
	select_in <= 0;

end
endtask

task set_mask();
input [255:0] value;
begin
	
	select_in <= 1;
	
	for(i = 0; i < 256; i = i + 1) begin

		//Set the data line
		gpio_ctrl[sdata] <= value[i];
		
		//Cycle the serial clock
		
		repeat(2) clk_cycle();
		gpio_ctrl[mask_clk] <= 1;
		repeat(2) clk_cycle();
		gpio_ctrl[mask_clk] <= 0;
		repeat(2) clk_cycle();
	end
	
	select_in <= 0;

end
endtask



endmodule