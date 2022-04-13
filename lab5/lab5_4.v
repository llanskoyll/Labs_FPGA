module lab5_4(
	input CLOCK_50,
	input button_was_pressed,
	input reset,
	output reg [19:0] data_001,
	output reg [19:0] data_01,
	output reg device_runnig,
	output reg second_001,
	output reg second_01
);
// условимся что 25_99_999 = 259

initial second_001 = 1'd0;
initial data_001 = 20'd0;
initial data_01 = 20'd0;
initial device_runnig = 1'd0;


always @(negedge button_was_pressed) begin
	device_runnig <= ~device_runnig;
end
// 0.01
always@(posedge CLOCK_50) begin // условимся что 25_99_999 = 25999;
	if(reset) begin
		data_001 <= 20'd0;
	end else begin
		if(device_runnig | second_001) begin
			if(data_001 == 25998) begin
				second_001 <= 1'd1;
			end else begin
				second_001 <= 1'd0;
			end
			if(second_001) begin
				data_001 <= 20'd0;
			end else begin
				data_001 <= data_001 + 1;
			end
		end
	end
end 
// 0.1
always @(second_001) begin
	if(reset) begin
		data_01 <= 20'd0;
	end else begin
		if(device_runnig | second_01) begin
			if(data_001 == 2598) begin
				second_01 <= 1'd1;
			end else begin
				second_01 <= 1'd0;
			end
			if(second_01) begin
				data_001 <= 20'd0;
			end else begin
				data_001 <= data_001 + 1;
			end
		end
	end
end
endmodule

