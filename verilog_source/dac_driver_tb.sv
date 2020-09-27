
`timescale 1ns/1ps

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

integer i, j;

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

//Half off half on
wire [255:0] test_mask = {{8{16'h0000}}, {8{16'hFFFF}}};
reg [255:0] axis_word_reg;
initial begin

	//Initialize values and reset the system
	clk <= 0;
	rst <= 1;
	
	gpio_ctrl <= 0;
	m_axis_tready <= 1;
	s_axis_tdata <= 0;
	s_axis_tvalid <= 0;
	
	trigger_in <= 0;
	select_in <= 0;
	axis_word_reg <= 0;
	
	
	repeat(10) clk_cycle();
	rst <= 0;
	repeat(10) clk_cycle();
	rst <= 1;
	repeat(10) clk_cycle();
	
	
	//Set the mux state to 0 so we can load values
	set_mux_sel(0);
	
	//Set repeat cycles to 20
	set_cycle_count(5);
	
	//Set the mask to half off half on
	set_mask(test_mask);
	
	//Set the locking waveform
	set_locking_waveform({16{16'h1111}});
	
	//Set the delay cycles
	set_delay_cycles(0);
	
	//Load in 5 words (5*16 samples total)
	
	for(axis_word_reg = {16{16'hAAAA}}; axis_word_reg < {16{16'hFFFF}};  axis_word_reg = axis_word_reg + {16{16'h1111}}) begin
	
		load_axis_word(axis_word_reg);
	
	end
	
	//turn on the loop-back mux
	set_mux_sel(1);
	
	repeat(10) clk_cycle();
	
	for(i = 0; i < 20; i = i + 1) begin
	
		trigger_in <= 1;
		clk_cycle();
		trigger_in <= 0;
		
		repeat(50) clk_cycle();
	
	end

end

task clk_cycle;
begin

	#1
	clk <= 1;
	#1
	clk <= 0;

end
endtask


task load_axis_word;
input [255:0] value;
begin

	//Set the data line
	s_axis_tdata <= value;
	s_axis_tvalid <= 1;
	clk_cycle();
	s_axis_tvalid <= 0;

end
endtask

task set_cycle_count;
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

task set_mask;
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

task set_delay_cycles;
input [255:0] value;
begin
	
	select_in <= 1;
	
	for(i = 0; i < 256; i = i + 1) begin

		//Set the data line
		gpio_ctrl[sdata] <= value[i];
		
		//Cycle the serial clock
		
		repeat(2) clk_cycle();
		gpio_ctrl[delay_cycle_clk] <= 1;
		repeat(2) clk_cycle();
		gpio_ctrl[delay_cycle_clk] <= 0;
		repeat(2) clk_cycle();
	end
	
	select_in <= 0;

end
endtask

task set_locking_waveform;
input [255:0] value;
begin
	
	select_in <= 1;
	
	for(i = 0; i < 256; i = i + 1) begin

		//Set the data line
		gpio_ctrl[sdata] <= value[i];
		
		//Cycle the serial clock
		
		repeat(2) clk_cycle();
		gpio_ctrl[locking_waveform_clk] <= 1;
		repeat(2) clk_cycle();
		gpio_ctrl[locking_waveform_clk] <= 0;
		repeat(2) clk_cycle();
	end
	
	select_in <= 0;

end
endtask

task set_mux_sel;
input value;
begin

	select_in <= 1;
	gpio_ctrl[sdata] <= value;
	for(i = 0; i < 8; i = i + 1) begin
		repeat(2) clk_cycle();
		gpio_ctrl[mux_set_clk] <= 1;
		repeat(2) clk_cycle();
		gpio_ctrl[mux_set_clk] <= 0;
		repeat(2) clk_cycle();
	end
	select_in <= 0;

end
endtask


endmodule