

import rfsoc_config::*;


//When shift value is set to 0, m_axis_1 is connected up to s_axis_1 (which comes from storage fifo)

module adc_ctrl
(
    input wire rf_clk,
    input wire rf_reset,
    input wire trigger_in,
    input wire [15:0] gpio_ctrl,
    
    //Input from ADC
    input wire [127:0] s_axis_tdata_0,
    input wire s_axis_tvalid_0,
    output wire s_axis_tready_0,
    
    //Outputs to data fifos
    output wire [127:0] m_axis_tdata_0,
    output wire m_axis_tvalid_0,
    input wire m_axis_tready_0,
    
    //Loopback interfaces from data fifos
    input wire [127:0] s_axis_tdata_1,
    input wire s_axis_tvalid_1,
    output wire s_axis_tready_1,

    
    //Outputs to 128-32 converter which goes to CPU
    output wire [127:0] m_axis_tdata_1,
    output wire m_axis_tvalid_1,
    input wire m_axis_tready_1,
	
	//Same selector lines as for DACs
	input wire select_in

    
);

reg data_valid;
reg [1:0] state;
reg [31:0] count;


wire [127:0] s_axis_tdata_0_int = gpio_ctrl[adc_use_dummy_data] ? {16'h1000, 16'h2000, 16'h3000, 16'h4000, 16'h5000, 16'h6000, 16'h7000, 16'h8000} : s_axis_tdata_0;


localparam [1:0] state_wait_trigger = 2'b00,
                 state_trigger = 2'b01,
                 state_cleanup = 2'b10;
	
wire [config_reg_width-1:0] count_val;
shift_register #(config_reg_width) sr_cycles
(
	rf_clk, 
	gpio_ctrl[adc_num_cycle_count_clk] & select_in, 
	rf_reset, 
	gpio_ctrl[sdata], 
	count_val
);

wire [config_reg_width-1:0] shift_val;
shift_register #(config_reg_width) sr_shift
(
	rf_clk, 
	gpio_ctrl[adc_shift_val_clk] & select_in, 
	rf_reset, 
	gpio_ctrl[sdata], 
	shift_val
);

//Interface for incomming adc data is always ready
assign s_axis_tready_0 = 1'b1;

//Making sure we're not adding garbage to the first capture
wire [127:0] s_axis_tdata_1_i = data_valid ? s_axis_tdata_1 : 0;
//wire [127:0] s_axis_tdata_1_i = s_axis_tdata_1;

//Averaging function

//Each value
wire signed [15:0] val_0 = s_axis_tdata_0_int[15:0];
wire signed [15:0] val_1 = s_axis_tdata_0_int[31:16];
wire signed [15:0] val_2 = s_axis_tdata_0_int[47:32];
wire signed [15:0] val_3 = s_axis_tdata_0_int[63:48];
wire signed [15:0] val_4 = s_axis_tdata_0_int[79:64];
wire signed [15:0] val_5 = s_axis_tdata_0_int[95:80];
wire signed [15:0] val_6 = s_axis_tdata_0_int[111:96];
wire signed [15:0] val_7 = s_axis_tdata_0_int[127:112];

//Each divide
wire signed [15:0] val_0_div = (val_0 >>> shift_val);
wire signed [15:0] val_1_div = (val_1 >>> shift_val);
wire signed [15:0] val_2_div = (val_2 >>> shift_val);
wire signed [15:0] val_3_div = (val_3 >>> shift_val);
wire signed [15:0] val_4_div = (val_4 >>> shift_val);
wire signed [15:0] val_5_div = (val_5 >>> shift_val);
wire signed [15:0] val_6_div = (val_6 >>> shift_val);
wire signed [15:0] val_7_div = (val_7 >>> shift_val);

//Each average

wire signed [15:0] avg_0 = val_0_div + s_axis_tdata_1_i[15:0];
wire signed [15:0] avg_1 = val_1_div + s_axis_tdata_1_i[31:16];
wire signed [15:0] avg_2 = val_2_div + s_axis_tdata_1_i[47:32];
wire signed [15:0] avg_3 = val_3_div + s_axis_tdata_1_i[63:48];
wire signed [15:0] avg_4 = val_4_div + s_axis_tdata_1_i[79:64];
wire signed [15:0] avg_5 = val_5_div + s_axis_tdata_1_i[95:80];
wire signed [15:0] avg_6 = val_6_div + s_axis_tdata_1_i[111:96];
wire signed [15:0] avg_7 = val_7_div + s_axis_tdata_1_i[127:112];

//Packing the values back into the averaging function
wire [127:0] avg_function;
assign avg_function[15:0] = avg_0;
assign avg_function[31:16] = avg_1;
assign avg_function[47:32] = avg_2;
assign avg_function[63:48] = avg_3;
assign avg_function[79:64] = avg_4;
assign avg_function[95:80] = avg_5;
assign avg_function[111:96] = avg_6;
assign avg_function[127:112] = avg_7;




//Figuring out when the clock crossing fifos are ready for 
wire cpu_ready;
assign cpu_ready = m_axis_tready_1;

//Assignment for output to data fifo
//If we're not shifting, then just pass data through, otherwise add it to whats comming out of the data fifo
assign m_axis_tdata_0 = shift_val == 0 ? s_axis_tdata_0_int : avg_function;
//Data can only enter the data fifo when we're capturing
assign m_axis_tvalid_0 = data_valid | state == state_trigger;

//Assignment for loopback interface
assign s_axis_tready_1 = shift_val == 0 ? cpu_ready : data_valid;

//Assignment for CPU outputs
assign m_axis_tdata_1 = s_axis_tdata_1;


//If we're not shifting, then data is valid when data from the data fifo is ready, otherwise data is not valud
assign m_axis_tvalid_1 = shift_val == 0 ? s_axis_tvalid_1 : 0;


task reset_regs();
begin

	state <= state_wait_trigger;
    count <= 0;
    data_valid <= 0;

end
endtask

initial begin
    reset_regs();
end


always @ (posedge rf_clk or negedge rf_reset) begin

    if(!rf_reset) begin
		reset_regs();
    end
    
    else begin

        case(state)
        
            state_wait_trigger: begin
                if(trigger_in == 1'b1) begin
                    //If there isn't any data in the fifos
                    if(s_axis_tvalid_1 == 1'b0) begin
                        //Stop all data transfers, data needs to build up first
                        data_valid <= 1'b0;
                    end
                    else begin
                        //Start the data transfer to the fifos
                        data_valid <= 1'b1;
                    end
                    //Set the count to 1
                    count <= 1;
                    //Go to the trigger state
                    state <= state_trigger;
                end
            end
            
            state_trigger: begin
                //If we're done counting
                if(count > count_val || count == count_val) begin
                    //reset the count
                    count <= 0;
                    //stop all transfers
                    data_valid <= 1'b0;
                    //wait for the trigger signals to go low
                    state <= state_cleanup;
                end
                else begin
                    count = count + 1'b1;
                end
            
            end
            
            state_cleanup: begin
                if(trigger_in == 1'b0) begin
                    //Go back to waiting for a trigger pulse
                    state <= state_wait_trigger;
                end
            
            end
            
            default: begin
                
                state <= state_wait_trigger;
            
            end
            
        endcase
    end//else not resetting
end
    
    
    
endmodule
