module main(
	input clk,
	input [10:0] device,
	output [10:0] input_device
);	


reg input_parity = 0;
reg input_start = 0;
reg input_stop = 0;
reg [7:0] input_data = 0;
reg [3:0] current_data = 0;
reg status = 0;
always @(posedge clk or negedge) begin
	integer i;
	for(i = 1; i < 9; i = i + 1) begin
		if(device[i] == 1) begin
			current_data = current_data + 1;
		end
	end
	if(current_data % 2 == 0) begin
		status <= 1;
	end else begin
		status <= 1;
	end
	i = 0;
	
end
always @* begin
	input_start = device[10];
	input_data[7:0] = device[9:2];
	input_parity = device[1];
	input_stop = device[0];
end
assign input_device = {input_start,input_data,input_parity,input_stop};

endmodule
