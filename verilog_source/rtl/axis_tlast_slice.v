

module axis_tlast_slice
(

	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) input wire ps_clk, rst, 

	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) input wire [31:0] s_axis_tdata,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) input wire s_axis_tvalid,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) output wire s_axis_tready,
	
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) output wire [31:0] m_axis_tdata,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) output wire [3:0] m_axis_tkeep,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) output wire m_axis_tlast,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) input wire m_axis_tready,
	(* X_INTERFACE_PARAMETER = "FREQ_HZ 100000000"*) output wire m_axis_tvalid
	
);

assign s_axis_tready = m_axis_tready;
assign m_axis_tdata = s_axis_tdata;
assign m_axis_tvalid = 1'b1;//Data going to DMA is always valid, DMA just needs to try reading the bus at the right time
assign m_axis_tkeep = 4'b1111;
assign m_axis_tlast = 1'b1;


/* always @ (posedge ps_clk or negedge rst) begin

	if(!rst) begin
		m_axis_tdata <= 0;
		m_axis_tvalid <= 0;
		s_axis_tready <= 0;
	end
	else begin
	
		//Default assignments
		m_axis_tdata <= 0;
		m_axis_tvalid <= 0;
		s_axis_tready <= 0;
	
		//Case 1: fifo has data and DMA is ready
		if(s_axis_tvalid && m_axis_tready) begin
			//Transfer the data and status accross the block
			m_axis_tdata <= s_axis_tdata;
			m_axis_tvalid <= s_axis_tvalid;
			s_axis_tready <= m_axis_tready;
		end
		//Case 2: fifo has data but DMA is not ready
		else if(s_axis_tvalid && !m_axis_tready) begin
			//If we aren't already storing a transaction in our output
			if(!m_axis_tvalid) begin
				//Read in one word from the fifo and put it on the output
				s_axis_tready <= 1;
				m_axis_tdata <= s_axis_tdata;
				m_axis_tvalid <= s_axis_tvalid;
			end
			//Otherwise just wait
		end
		//Case 3: fifo has no data but DMA is ready
		else if(!s_axis_tvalid && m_axis_tready) begin
			//Assert m_axis_tvalid until DMA transfer is over
			m_axis_tvalid <= 1;
		end
	
	end

end */


endmodule