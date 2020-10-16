





import rfsoc_config::*;

//Writes 16 samples into the output buffer when sdata is 1
module axis_cpu_readback_tester
(
	input wire ps_clk,
	input wire rst,
	
	input wire [15:0] gpio_in,
	
	output wire [31:0] m_axis_tdata,
	output wire m_axis_tvalid,
	input wire m_axis_tready
);


reg [31:0] fifo_tdata;
reg fifo_tvalid;
wire fifo_tready;

//Fifo
axis_sync_fifo #(5, 32) main_fifo
(
	rst,
	ps_clk,
	
	fifo_tvalid,
	fifo_tready,
	fifo_tdata,
	
	m_axis_tdata,
	m_axis_tvalid,
	m_axis_tready
	
);

localparam state_idle = 0, state_write = 1;
reg state;
reg [7:0] counter;

always @ (posedge ps_clk or negedge rst) begin

	if(!rst) begin
		state <= state_idle;
		counter <= 0;
	end
	else begin
		
		case(state)
	
			state_idle: begin
				fifo_tvalid <= 0;
				//If we're getting the start signal from the CPU
				if(gpio_in[sdata]) begin
					counter <= 0;
					state <= state_write;
				end
			end
			
			state_write: begin
			
				//Deassert write signal by default
				fifo_tvalid <= 0;
			
				//if we're done counting
				if(counter > 15) begin
					fifo_tvalid <= 0;
					//If the trigger signal has been reset
					if(gpio_in[sdata] == 0) begin
						state <= state_idle;
					end
				end
				//Otherwise if the fifo is ready to receive another word
				else if(fifo_tready) begin
					//Assert the write signal
					fifo_tvalid <= 1;
					//Set the data bus with the next value
					fifo_tdata <= {8{counter[3:0]}};
					//Increment the counter
					counter <= counter + 1;
				end
			end
	
	
		endcase
	end

end

endmodule


module axis_cpu_readback_tester_tb();


reg ps_clk, rst;
reg [15:0] gpio_in;

wire [31:0] m_axis_tdata;
wire m_axis_tvalid;
reg m_axis_tready;

axis_cpu_readback_tester dut
(
	ps_clk,
	rst,
	
	gpio_in,
	
	m_axis_tdata,
	m_axis_tvalid,
	m_axis_tready
);


initial begin

	ps_clk <= 0;
	rst <= 1;
	gpio_in <= 0;
	m_axis_tready <= 0;
	
	repeat(10) clk_cycle();
	rst <= 0;
	repeat(10) clk_cycle();
	rst <= 1;
	repeat(10) clk_cycle();
	
	m_axis_tready <= 1;
	gpio_in[sdata] <= 1;
	
	repeat(100) clk_cycle();
	
	gpio_in[sdata] <= 0;
	
	repeat(100) clk_cycle();
	
	gpio_in[sdata] <= 1;
	
	repeat(100) clk_cycle();
	
	gpio_in[sdata] <= 0;
	
	repeat(100) clk_cycle();


end


task clk_cycle();
begin
	#1
	ps_clk <= 1;
	#1
	ps_clk <= 0;
end
endtask



endmodule
