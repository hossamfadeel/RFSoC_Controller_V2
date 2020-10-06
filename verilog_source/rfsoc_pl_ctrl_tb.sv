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


integer i, j, k;

wire [255:0] test_mask = {{8{16'h0000}}, {8{16'hFFFF}}};
reg [31:0] axis_word_reg;

rfsoc_pl_ctrl dut
(
	ps_clk, pl_clk,
	rst,
	
	gpio_ctrl,
	
	//AXIS input from PS
	s_axis_tdata,
    s_axis_tvalid,
    s_axis_tready,
	
	
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
    m15_axis_tready
	
);


initial begin

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
	
	for(i = 0; i < 20; i = i + 1) begin
	
		gpio_ctrl[trigger_line] <= 1;
		clk_cycle();
		gpio_ctrl[trigger_line] <= 0;
		
		repeat(50) clk_cycle();
	
	end

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
input [255:0] value;
begin
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
input [255:0] value;
begin

	for(i = 0; i < 256; i = i + 1) begin
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
input [255:0] value;
begin

	for(i = 0; i < 256; i = i + 1) begin
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