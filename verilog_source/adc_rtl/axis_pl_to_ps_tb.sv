

import rfsoc_config::*;




module axis_pl_to_ps_tb();


reg pl_clk, ps_clk, rst;

//From input fifo to DUT
wire [127:0] fifo_out_data;
wire fifo_out_ready, fifo_out_valid;


//Input to input fifo
reg [127:0] fifo_in_data;
reg fifo_in_valid;
wire fifo_in_ready;


//Input fifo declaration
axis_sync_fifo #(4, 128) input_fifo
(

	rst,
	pl_clk,

    fifo_in_valid,
    fifo_in_ready,
    fifo_in_data,
    
    fifo_out_data,
    fifo_out_valid,
    fifo_out_ready 
);


//DUT declaration
wire [31:0] m_axis_tdata;
wire m_axis_tvalid;
wire m_axis_tready;
reg start_readout;
axis_pl_to_ps dut
(
	pl_clk, ps_clk,
	
	rst,
	
	//Input from adc_ctrl
    fifo_out_data,
    fifo_out_valid,
    fifo_out_ready,
	
	//Output to PS
	m_axis_tdata,
    m_axis_tvalid,
    m_axis_tready
	
);

//Input fifo declaration
wire [31:0] dummy_data_out;
wire dummy_valid;
axis_sync_fifo #(4, 32) output_fifo
(

	rst,
	ps_clk,

    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    
    dummy_data_out,
    dummy_valid,
    start_readout
);

integer i;

initial begin

	pl_clk <= 0;
	ps_clk <= 0;
	rst <= 1;
	
	fifo_in_data <= 0;
	fifo_in_valid <= 0;
	
	start_readout <= 0;
	
	//Reset routine
	repeat(10) clk_cycle();
	rst <= 0;
	repeat(10) clk_cycle();
	rst <= 1;
	repeat(10) clk_cycle();
	
	while(1) begin
	
		fifo_in_data <= 127'h00001111222233334444555566667777;
		//Load the input fifo with 16 samples
		fifo_in_valid <= 1;
		#1
		pl_clk <= 1;
		#1
		pl_clk <= 0;
		ps_clk <= 1;
		fifo_in_data <= fifo_in_data + {8{16'h8888}};
		#1
		pl_clk <= 1;
		#1
		pl_clk <= 0;
		ps_clk <= 0;
		
		fifo_in_valid <= 0;


		//Wait a bunch of clock cycles
		repeat(100) clk_cycle();
		
		//Start reading out data
		start_readout <= 1;
		repeat(100) clk_cycle();
		
		start_readout <= 0;
		repeat(100) clk_cycle();
	
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