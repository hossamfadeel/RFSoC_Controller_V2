
`timescale 1ns/1ps
import rfsoc_config::*;


module axis_ps_to_pl_tb();


reg ps_clk, pl_clk, rst;

reg [31:0] s_axis_tdata;
reg s_axis_tvalid;
wire s_axis_tready;

wire [255:0] m_axis_tdata;
wire m_axis_tvalid;
wire m_axis_tready;

wire [255:0] m0_axis_tdata;
wire m0_axis_tvalid;
reg m0_axis_tready;


axis_ps_to_pl #(32) dut
(
	ps_clk,
	pl_clk,
	
	rst,
	
	s_axis_tdata,
	s_axis_tvalid,
	s_axis_tready,
	
	m_axis_tdata,
	m_axis_tvalid,
	m_axis_tready
);

//Buffer fifo just for testing
axis_sync_fifo #(4) test_fifo
(

	rst,
	pl_clk,

    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    
    m0_axis_tdata,
    m0_axis_tvalid,
    m0_axis_tready 
);


initial begin

	ps_clk <= 0;
	pl_clk <= 0;
	rst <= 1;
	
	s_axis_tdata <= 0;
	s_axis_tvalid <= 0;
	
	m0_axis_tready <= 1;//Always ready
	
	repeat(10) clk_cycle();
	rst <= 0;
	repeat(10) clk_cycle();
	rst <= 1;
	repeat(10) clk_cycle();
	
	//Loop and start loading in values to dut
	s_axis_tvalid <= 1;
	while(1) begin
		clk_cycle();
		if(s_axis_tdata == 32'hFFFFFFFF) begin
			s_axis_tdata <= 0;
		end
		else begin
			s_axis_tdata <= s_axis_tdata + 32'h11111111;
		end
	end


end


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