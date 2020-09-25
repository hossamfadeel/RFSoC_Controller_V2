


module axis_ps_to_pl
#(parameter ps_axis_width = 32)
(
	input wire ps_clk,
	input wire pl_clk,
	
	input wire rst,
	
	//AXIS input from PS
	input wire [ps_axis_width-1:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output wire s_axis_tready
	
	
	//AXIS output to PL
	output wire [255:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready,
);


parameter ps_per_pl = ps_axis_width / 256



//ready to receive data when the async fifo is not full
assign s_axis_tready = async_fifo_ready;

reg [15:0] word_cnt;
reg [255:0] word_buff;

//async fifo input bus
reg [255:0] async_fifo_data;
reg async_fifo_valid;
wire async_fifo_ready;

//Async fifo instantiation
axis_async_fifo async_fifo
(
	rst,
	
	ps_clk,
	async_fifo_valid,
	async_fifo_ready,
	async_fifo_data,
	
	pl_clk,
	m_axis_tdata,
	m_axis_tvalid,
	m_axis_tready
	
);

task reset_regs();
begin
	
	async_fifo_data <= 0;
	async_fifo_valid <= 0;
	word_cnt <= 0;
	word_buff <= 0

end
endtask

always @ (posedge ps_clk or negedge rst) begin

	if(!rst) begin
	
		reset_regs();
	
	end
	else begin
		
		//Reset write line for async fifo interface
		async_fifo_valid <= 0;

		//if there is an incomming word from PS
		if(s_axis_tvalid) begin
		
			//If this is the last word in the sequence
			if(word_cnt == (ps_per_pl - 1)) begin
				//Push this word and the buffer out to the async fifo
				async_fifo_data <= {word_buff[255:ps_axis_width], s_axis_tdata};
				async_fifo_valid <= 1;
				word_cnt <= 0;
			end
			else begin
				//Store this word in the correct buffer position
				word_buff <= {word_buff[255-ps_axis_width:0], s_axis_tdata};
				word_cnt <= word_cnt + 1;
			end
		end
		
	end
end




endmodule