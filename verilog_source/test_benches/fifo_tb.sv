


import rfsoc_config::*;


module sync_fifo_tb();

reg clk, rst;
reg fifo_tvalid;
wire fifo_tready;
reg [15:0] fifo_tdata;

wire [15:0] m_axis_tdata;
wire m_axis_tvalid;
reg m_axis_tready;

axis_sync_fifo #(4, 16) input_fifo
(

	rst,
	clk,

    fifo_tvalid,
    fifo_tready,
    fifo_tdata,
    
    m_axis_tdata,
	m_axis_tvalid,
    m_axis_tready
);


integer i;
initial begin

	i = 0;
	clk <= 0;
	rst <= 1;
	fifo_tvalid <= 0;
	fifo_tdata <= 1;
	
	m_axis_tready <= 0;
	
	repeat(10) clk_cycle();
	rst <= 0;
	repeat(10) clk_cycle();
	rst <= 1;
	repeat(10) clk_cycle();
	

	//delayed_read_test();
	
	continuous_read_test();
	
end

task continuous_read_test;
begin

	while(1) begin
		
		//Write in 8 words
		m_axis_tready <= 1;
		
		repeat(20) clk_cycle();
		
		fifo_tvalid <= 1;
		for(i = 0; i < 8; i = i + 1) begin
			clk_cycle();
			fifo_tdata <= fifo_tdata + 1;
		end
		
		fifo_tvalid <= 0;
		
		repeat(100) clk_cycle();
		//Read out fifo
		m_axis_tready <= 1;
		repeat(20) clk_cycle();
		m_axis_tready <= 1;
		repeat(20) clk_cycle();
		
	end

end
endtask


task delayed_read_test;
begin

	while(1) begin
		
		//Write in 8 words
		fifo_tvalid <= 1;
		for(i = 0; i < 8; i = i + 1) begin
			clk_cycle();
			fifo_tdata <= fifo_tdata + 1;
		end
		
		fifo_tvalid <= 0;
		
		repeat(100) clk_cycle();
		//Read out fifo
		m_axis_tready <= 1;
		repeat(20) clk_cycle();
		m_axis_tready <= 0;
		repeat(20) clk_cycle();
		
	end

end
endtask


task clk_cycle();
begin

	#1
	clk <= 1;
	#1 
	clk <= 0;

end
endtask



endmodule




module async_fifo_tb();


reg rst, s_axis_clk, m_axis_clk;

reg s_axis_tvalid;
reg [15:0] s_axis_tdata;
wire s_axis_tready;

wire [15:0] m_axis_tdata;
wire m_axis_tvalid;
reg m_axis_tready;

integer i;

axis_async_fifo #(16) dut
(
	rst,

	s_axis_clk,
	s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    
	m_axis_clk,
    m_axis_tdata,
    m_axis_tvalid,
    m_axis_tready 
);


initial begin
	i = 0;
	rst <= 1;
	s_axis_clk <= 0;
	m_axis_clk <= 0;
	s_axis_tvalid <= 0;
	s_axis_tdata <= 1;
	m_axis_tready <= 0;
	
	repeat(10) clk_cycle();
	rst <= 0;
	repeat(10) clk_cycle();
	rst <= 1;
	repeat(10) clk_cycle();
	
	//delayed_read_test();
	continuous_read_test();
	
end

task delayed_read_test();
begin

	
	while(1) begin
	
		s_axis_tvalid <= 1;
		for(i = 0; i < 8; i = i + 1) begin
			clk_cycle();
			s_axis_tdata <= s_axis_tdata + 1;
		end
		s_axis_tvalid <= 0;
		
		repeat(50) clk_cycle();
		m_axis_tready <= 1;
		repeat(50) clk_cycle();
		m_axis_tready <= 0;
		repeat(50) clk_cycle();
	
	end
end
endtask

task continuous_read_test();
begin

	m_axis_tready <= 1;
	
	while(1) begin
	
		s_axis_tvalid <= 1;
		for(i = 0; i < 8; i = i + 1) begin
			clk_cycle();
			s_axis_tdata <= s_axis_tdata + 1;
		end
		s_axis_tvalid <= 0;
		
		repeat(50) clk_cycle();
		m_axis_tready <= 1;
		repeat(50) clk_cycle();
		m_axis_tready <= 1;
		repeat(50) clk_cycle();
	
	end
end
endtask

task clk_cycle();
begin

	#1
	m_axis_clk <= 1;
	#1
	m_axis_clk <= 0;
	s_axis_clk <= 1;
	#1
	m_axis_clk <= 1;
	#1
	m_axis_clk <= 0;
	s_axis_clk <= 0;

end
endtask





endmodule

