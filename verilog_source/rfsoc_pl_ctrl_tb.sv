`timescale 1ns/1ps
import rfsoc_config::*;


module rfsoc_pl_ctrl_tb();

reg pl_clk, ps_clk, rst;
reg [15:0] gpio_ctrl;

reg [31:0] s_axis_tdata;
reg s_axis_tvalid;
wire s_axis_tready;

//AXIS s to RFSoC IP
wire [255:0] m0_axis_tdata;
wire m0_axis_tvalid;
reg m0_axis_tready;

wire [255:0] m1_axis_tdata;
wire m1_axis_tvalid;
reg m1_axis_tready;

wire [255:0] m2_axis_tdata;
wire m2_axis_tvalid;
reg m2_axis_tready;

wire [255:0] m3_axis_tdata;
wire m3_axis_tvalid;
reg m3_axis_tready;

wire [255:0] m4_axis_tdata;
wire m4_axis_tvalid;
reg m4_axis_tready;

wire [255:0] m5_axis_tdata;
wire m5_axis_tvalid;
reg m5_axis_tready;

wire [255:0] m6_axis_tdata;
wire m6_axis_tvalid;
reg m6_axis_tready;

wire [255:0] m7_axis_tdata;
wire m7_axis_tvalid;
reg m7_axis_tready;

wire [255:0] m8_axis_tdata;
wire m8_axis_tvalid;
reg m8_axis_tready;

wire [255:0] m9_axis_tdata;
wire m9_axis_tvalid;
reg m9_axis_tready;

wire [255:0] m10_axis_tdata;
wire m10_axis_tvalid;
reg m10_axis_tready;

wire [255:0] m11_axis_tdata;
wire m11_axis_tvalid;
reg m11_axis_tready;

wire [255:0] m12_axis_tdata;
wire m12_axis_tvalid;
reg m12_axis_tready;

wire [255:0] m13_axis_tdata;
wire m13_axis_tvalid;
reg m13_axis_tready;

wire [255:0] m14_axis_tdata;
wire m14_axis_tvalid;
reg m14_axis_tready;

wire [255:0] m15_axis_tdata;
wire m15_axis_tvalid;
reg m15_axis_tready;


wire [127:0] adc_dummy_data = {16'h1000, 16'h2000, 16'h3000, 16'h4000, 16'h5000, 16'h6000, 16'h7000, 16'h8000};
//AXIS inputs from ADC

wire [127:0] s0_axis_tdata = adc_dummy_data;
wire s0_axis_tvalid = 1;
wire s0_axis_tready;

wire [127:0] s1_axis_tdata = adc_dummy_data;
wire s1_axis_tvalid = 1;
wire s1_axis_tready;

wire [127:0] s2_axis_tdata = adc_dummy_data;
wire s2_axis_tvalid = 1;
wire s2_axis_tready;

wire [127:0] s3_axis_tdata = adc_dummy_data;
wire s3_axis_tvalid = 1;
wire s3_axis_tready;

wire [127:0] s4_axis_tdata = adc_dummy_data;
wire s4_axis_tvalid = 1;
wire s4_axis_tready;

wire [127:0] s5_axis_tdata = adc_dummy_data;
wire s5_axis_tvalid = 1;
wire s5_axis_tready;

wire [127:0] s6_axis_tdata = adc_dummy_data;
wire s6_axis_tvalid = 1;
wire s6_axis_tready;

wire [127:0] s7_axis_tdata = adc_dummy_data;
wire s7_axis_tvalid = 1;
wire s7_axis_tready;

wire [127:0] s8_axis_tdata = adc_dummy_data;
wire s8_axis_tvalid = 1;
wire s8_axis_tready;

wire [127:0] s9_axis_tdata = adc_dummy_data;
wire s9_axis_tvalid = 1;
wire s9_axis_tready;

wire [127:0] s10_axis_tdata = adc_dummy_data;
wire s10_axis_tvalid = 1;
wire s10_axis_tready;

wire [127:0] s11_axis_tdata = adc_dummy_data;
wire s11_axis_tvalid = 1;
wire s11_axis_tready;

wire [127:0] s12_axis_tdata = adc_dummy_data;
wire s12_axis_tvalid = 1;
wire s12_axis_tready;

wire [127:0] s13_axis_tdata = adc_dummy_data;
wire s13_axis_tvalid = 1;
wire s13_axis_tready;

wire [127:0] s14_axis_tdata = adc_dummy_data;
wire s14_axis_tvalid = 1;
wire s14_axis_tready;

wire [127:0] s15_axis_tdata = adc_dummy_data;
wire s15_axis_tvalid = 1;
wire s15_axis_tready;


integer i, j, k;

wire [255:0] test_mask = {{8{16'h0000}}, {8{16'hFFFF}}};
reg [31:0] axis_word_reg;


wire [31:0] adc_axis_tdata;
wire adc_axis_tvalid;
reg adc_axis_tready;

rfsoc_pl_ctrl dut
(
	ps_clk, pl_clk,
	rst,
	
	gpio_ctrl,
	
	//AXIS input from PS
	s_axis_tdata,
    s_axis_tvalid,
    s_axis_tready,
	
	//AXIS output to ps
	adc_axis_tdata,
	adc_axis_tvalid,
	adc_axis_tready,
	
	
	//AXIS outputs to RFSoC IP
	m0_axis_tdata,
    m0_axis_tvalid,
    m0_axis_tready,
	
	m1_axis_tdata,
    m1_axis_tvalid,
    m1_axis_tready,
	
	m2_axis_tdata,
    m2_axis_tvalid,
    m2_axis_tready,
	
	m3_axis_tdata,
    m3_axis_tvalid,
    m3_axis_tready,
	
	m4_axis_tdata,
    m4_axis_tvalid,
    m4_axis_tready,
	
	m5_axis_tdata,
    m5_axis_tvalid,
    m5_axis_tready,
	
	m6_axis_tdata,
    m6_axis_tvalid,
    m6_axis_tready,
	
	m7_axis_tdata,
    m7_axis_tvalid,
    m7_axis_tready,
	
	m8_axis_tdata,
    m8_axis_tvalid,
    m8_axis_tready,
	
	m9_axis_tdata,
    m9_axis_tvalid,
    m9_axis_tready,
	
	m10_axis_tdata,
    m10_axis_tvalid,
    m10_axis_tready,
	
	m11_axis_tdata,
    m11_axis_tvalid,
    m11_axis_tready,
	
	m12_axis_tdata,
    m12_axis_tvalid,
    m12_axis_tready,
	
	m13_axis_tdata,
    m13_axis_tvalid,
    m13_axis_tready,
	
	m14_axis_tdata,
    m14_axis_tvalid,
    m14_axis_tready,
	
	m15_axis_tdata,
    m15_axis_tvalid,
    m15_axis_tready,
	
	//AXIS inputs from ADC
	s0_axis_tdata,
    s0_axis_tvalid,
    s0_axis_tready,
	
	s1_axis_tdata,
    s1_axis_tvalid,
    s1_axis_tready,
	
	s2_axis_tdata,
    s2_axis_tvalid,
    s2_axis_tready,
	
	s3_axis_tdata,
    s3_axis_tvalid,
    s3_axis_tready,
	
	s4_axis_tdata,
    s4_axis_tvalid,
    s4_axis_tready,
	
	s5_axis_tdata,
    s5_axis_tvalid,
    s5_axis_tready,
	
	s6_axis_tdata,
    s6_axis_tvalid,
    s6_axis_tready,
	
	s7_axis_tdata,
    s7_axis_tvalid,
    s7_axis_tready,
	
	s8_axis_tdata,
    s8_axis_tvalid,
    s8_axis_tready,
	
	s9_axis_tdata,
    s9_axis_tvalid,
    s9_axis_tready,
	
	s10_axis_tdata,
    s10_axis_tvalid,
    s10_axis_tready,
	
	s11_axis_tdata,
    s11_axis_tvalid,
    s11_axis_tready,
	
	s12_axis_tdata,
    s12_axis_tvalid,
    s12_axis_tready,
	
	s13_axis_tdata,
    s13_axis_tvalid,
    s13_axis_tready,
	
	s14_axis_tdata,
    s14_axis_tvalid,
    s14_axis_tready,
	
	s15_axis_tdata,
    s15_axis_tvalid,
    s15_axis_tready
	
);

integer num_adc_errors, num_dac_errors;

initial begin


	num_adc_errors <= 0;
	num_dac_errors <= 0;

	pl_clk <= 0;
	ps_clk <= 0;
	rst <= 1;
	
	gpio_ctrl <= 0;
	
	s_axis_tdata <= 0;
	s_axis_tvalid <= 0;
	
	m0_axis_tready <= 1;
	m1_axis_tready <= 1;
	m2_axis_tready <= 1;
	m3_axis_tready <= 1;
	m4_axis_tready <= 1;
	m5_axis_tready <= 1;
	m6_axis_tready <= 1;
	m7_axis_tready <= 1;
	m8_axis_tready <= 1;
	m9_axis_tready <= 1;
	m10_axis_tready <= 1;
	m11_axis_tready <= 1;
	m12_axis_tready <= 1;
	m13_axis_tready <= 1;
	m14_axis_tready <= 1;
	m15_axis_tready <= 1;
	
	i <= 0;
	j <= 0;
	k <= 0;
	
	axis_word_reg <= 0;
	
	
	//System reset
	repeat(10) clk_cycle();
	rst <= 0;
	repeat(10) clk_cycle();
	rst <= 1;
	repeat(10) clk_cycle();


	for(j = 0; j < 16; j = j + 1) begin

		//Select the current channel
		select_channel(j);
		//Set the mux state to 0 so we can load values
		set_mux_sel(0);
		set_mask_enable(1);
		//Set repeat cycles to 20
		set_cycle_count(10);
		//Set the mask to half off half on
		set_mask(test_mask);
		//Set the locking waveform
		set_locking_waveform({16{16'h1111}});
		//Set the pre_delay cycles
		set_pre_delay_cycles(2);
		//Set the post delay cycles
		set_post_delay_cycles(2);
		
		
		//ADC Stuff///////////////////
		//Set the capture cycles to 4
		set_adc_run_cycles(4);
		//Set the shift val to 2
		set_adc_shift_val(2);
		//////////////////////////////
		
		//Load in 5 words (40 ps words) (5*16 samples total)
		axis_word_reg <= 32'haaaaaaaa;
		clk_cycle();
		for(k = 0; k < 5; k = k + 1) begin
			repeat(8) load_axis_word(axis_word_reg);
			clk_cycle();
			axis_word_reg = axis_word_reg + 32'h11111111;
		end
		axis_word_reg <= 32'haaaaaaaa;
		clk_cycle();
		
		//turn on the loop-back mux
		set_mux_sel(1);
		
		repeat(10) clk_cycle();
	end
	
	repeat(10) clk_cycle();
	
	
	//Trigger exactly 4 times
	for(i = 0; i < 4; i = i + 1) begin
	
		gpio_ctrl[trigger_line] <= 1;
		clk_cycle();
		gpio_ctrl[trigger_line] <= 0;
		
		repeat(50) clk_cycle();
	
	end
	
	//Try reading out each ADC one at a time
	for(k = 0; k < 16; k = k + 1) begin
	
		select_channel(k);
		
		adc_axis_tready <= 1;
		for(j = 0; j < 16; j = j + 1) begin

			if(adc_axis_tdata != adc_dummy_data[(j*32)+:32])begin
				num_adc_errors = num_adc_errors + 1;
			end
			clk_cycle();
		
		end
	
	end
	
	
	$display("rfsoc_pl_ctrl test complete, %d errors total, %d DAC errors, $d ADC errors", num_adc_errors+num_dac_errors, num_dac_errors, num_adc_errors);

end

task select_channel;
input integer channel_num;
begin
	
	for(i = 0; i < 16; i = i + 1) begin

		gpio_ctrl[sdata] <= i == channel_num ? 1'b1 : 1'b0;
	
		clk_cycle();
		gpio_ctrl[channel_sel_clk] <= 1;
		repeat(2) clk_cycle();
		gpio_ctrl[channel_sel_clk] <= 0;
		repeat(2) clk_cycle();
		
	end
	
end
endtask


task load_axis_word;
input [31:0] value;
begin

	//Set the data line
	s_axis_tdata <= value;
	s_axis_tvalid <= 1;
	clk_cycle();
	s_axis_tvalid <= 0;

end
endtask

task set_cycle_count;
input [config_reg_width-1:0] value;
begin
	for(i = 0; i < config_reg_width; i = i + 1) begin

		//Set the data line
		gpio_ctrl[sdata] <= value[i];
		
		//Cycle the serial clock
		
		repeat(2) clk_cycle();
		gpio_ctrl[cycle_count_clk] <= 1;
		repeat(2) clk_cycle();
		gpio_ctrl[cycle_count_clk] <= 0;
		repeat(2) clk_cycle();
	end
end
endtask

task set_mask;
input [255:0] value;
begin
	

	
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
	


end
endtask

task set_pre_delay_cycles;
input [config_reg_width-1:0] value;
begin

	for(i = 0; i < config_reg_width; i = i + 1) begin
		//Set the data line
		gpio_ctrl[sdata] <= value[i];
		//Cycle the serial clock
		repeat(2) clk_cycle();
		gpio_ctrl[pre_delay_cycle_clk] <= 1;
		repeat(2) clk_cycle();
		gpio_ctrl[pre_delay_cycle_clk] <= 0;
		repeat(2) clk_cycle();
	end

end
endtask

task set_post_delay_cycles;
input [config_reg_width-1:0] value;
begin

	for(i = 0; i < config_reg_width; i = i + 1) begin
		//Set the data line
		gpio_ctrl[sdata] <= value[i];
		//Cycle the serial clock
		repeat(2) clk_cycle();
		gpio_ctrl[post_delay_cycle_clk] <= 1;
		repeat(2) clk_cycle();
		gpio_ctrl[post_delay_cycle_clk] <= 0;
		repeat(2) clk_cycle();
	end

end
endtask


task set_locking_waveform;
input [255:0] value;
begin
	
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

end
endtask

task set_mux_sel;
input value;
begin


	gpio_ctrl[sdata] <= value;
	for(i = 0; i < 8; i = i + 1) begin
		repeat(2) clk_cycle();
		gpio_ctrl[mux_set_clk] <= 1;
		repeat(2) clk_cycle();
		gpio_ctrl[mux_set_clk] <= 0;
		repeat(2) clk_cycle();
	end


end
endtask

task set_mask_enable;
input value;
begin


	gpio_ctrl[sdata] <= value;
	for(i = 0; i < 8; i = i + 1) begin
		repeat(2) clk_cycle();
		gpio_ctrl[mask_enable_clk] <= 1;
		repeat(2) clk_cycle();
		gpio_ctrl[mask_enable_clk] <= 0;
		repeat(2) clk_cycle();
	end

end
endtask


task set_adc_run_cycles;
input [config_reg_width-1:0] cycle_count;
begin

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
	
end
endtask

task set_adc_shift_val;
input [config_reg_width-1:0] shift_val;
begin

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
end
endtask

//Does one ps cycle, two pl cycles
task clk_cycle();
begin

	#1
	pl_clk <= 1;
	#1
	pl_clk <= 0;
	ps_clk <= 1;
	#1
	pl_clk <=1;
	#1
	pl_clk <= 0;
	ps_clk <= 0;

end
endtask


endmodule