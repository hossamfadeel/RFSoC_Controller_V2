

module FIFO_memory
#(
	parameter data_width = 16,
			  addr_width = 16
)
(clk,reset,din,read,write,dout,empty,full); 
 
	input clk; 
	input reset; 
	input [data_width-1:0]din;	//16-bit data input 
	input read; 
	input write; 
 
	output [data_width-1:0]dout; //16-bit data output 
	output empty; 	   //flag to indicate that the memory is empty 
	output full;	   //flag to indicate that the memory is full 
	 
	parameter DEPTH=addr_width, MAX_COUNT= (2 ** addr_width) - 1;	 
//DEPTH is number of bits, 3 bits thus 2^3=8 memory locations and MAX_COUNT is the last memory location. 
	 
	reg [data_width-1:0]dout; 
	reg empty; 
	reg full; 
 
	/*head is write_pointer and tail is read_pointer*/ 
 
	reg [(DEPTH-1):0]tail;	 
// tail(3bits) defines memory pointer location for reading instructions(000 or 001....111) 
	 
	reg [(DEPTH-1):0]head;	 
// head(3bits) defines memory pointer location for writing instructions(000 or 001....111) 
	 
	reg [(DEPTH-1):0]count;	 
// 3 bits count register[000(0),001(1),010(2),....,111(7)] 
	 
	reg [data_width-1:0]fifo_mem[0:MAX_COUNT];  
// fifo memory is having 16 bits data and 8 memory locations 
	 
	reg sr_read_write_empty;			// 1 bit register flag 
 
///////// WHEN BOTH READING AND WRITING BUT FIFO IS EMPTY //////// 
 
	//always @(posedge clk or negedge reset) 
	always @ * 
		begin 
			if(reset==0) 
			//reset is pressed															 
				sr_read_write_empty <= 0;
			else begin
				if(read==1 && empty==1 && write==1)	 
				//when fifo is empty and read & write both 1 
					sr_read_write_empty <= 1; 
				else 
					sr_read_write_empty <= 0;
			end				
		end 
 
//////////////////////// COUNTER OPERATION /////////////////////// 
		 
	always @(posedge clk or negedge reset) 
		begin 
			if(reset==0) 
//when reset, the fifo is made empty thus count is set to zero 
				count <= 0;		 
			else 
				begin 
					case({read,write}) 
					//CASE-1:when not reading or writing	 
						2'b00:	count <= count;				 
								//count remains same 
					//CASE-2:when writing only 
						2'b01:	if(count!=MAX_COUNT)			 
									count <= count+1; 
									//count increases 
					//CASE-3:when reading only							 
						2'b10:	if(count!=0)				 
									count <= count-1;							 
									//count decreases 
					//CASE-4 
						2'b11:	if(sr_read_write_empty==1)	 
									count <= count+1; 
//(if) fifo is empty => only write, thus count increases			 
								else 
									count <= count; 
//(else) both read and write takes place, thus no change											 
					//DEFAULT CASE			 
						default: count <= count; 
					endcase 
				end 
		end 
 
////////////////////// EMPTY AND FULL ALERT ///////////////////// 
	 
	// Memory empty signal 
	always @(count) 
		begin 
			if(count==0) 
				empty <= 1; 
			else 
				empty <= 0; 
		end 
 
	// Memory full signal 
	always @(count) 
		begin 
			if(count==MAX_COUNT) 
				full <= 1; 
			else 
				full <= 0; 
		end 
 
///////////// READ AND WRITE POINTER MEMORY LOCATION ///////////// 
 
	// Write operation memory pointer 
	always @(posedge clk or negedge reset) 
		begin 
			if(reset==0) 
			//head moved to zero location (fifo is made empty) 
				head <= 0;	 
			else 
				begin 
					if(write==1 && full==0)	 
					//writing when memory is NOT FULL 
						head <= head+1; 
				end 
		end 
	 
	// Read operation memory pointer 
		always @(posedge clk or negedge reset) 
			begin 
				if(reset==0) 
				//tail moved to zero location (fifo is made empty) 
					tail <= 0;	 
				else 
					begin 
						if(read==1 && empty==0)	 
						//reading when memory is NOT ZERO 
							tail <= tail+1; 
					end 
			end 
 
//////////////////// READ AND WRITE OPERATION //////////////////// 
 
	// Write operation 
	always @(posedge clk or negedge reset) begin 
		//IT CAN WRITE WHEN RESET IS USED AS FULL==0	 
		if(reset == 0) begin

		end
		else begin		
			if(write==1 && full==0) 
			//writing when memory is NOT FULL 
				fifo_mem[head] <= din; 
			else									 
			//when NOT WRITING 
				fifo_mem[head] <= fifo_mem[head]; 
		end
	end 
 
	// Read operation 
	always @(posedge clk or negedge reset) 
		begin 
			if(reset==0) begin					 
			//reset implies output is zero 
				dout <= 0;
			end
			else begin
				if(read==1 && empty==0)	 
				//reading data when memory is NOT EMPTY 
					dout <= fifo_mem[tail]; 
				else 
				//no change 
					dout <= dout; 
			end
		end 
endmodule 