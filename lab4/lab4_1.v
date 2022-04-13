module lab4_1(
	input clk,
	input en,
	input IS,
	input rst,
	output reg OS_rl,
	output reg [3:0] shift,
	input control
);
initial shift = 4'b0;


always @(posedge clk) begin
	 if(control) begin
		if(rst) begin
			shift <= 4'b0;
			OS_rl <= 1'b0;
		end else begin 
			if(en) begin
					shift <= {shift[2:0],IS};
					OS_rl <= shift[3];
			end else begin
					OS_rl <= 1'b0;
					shift <= shift;
			end
		end
	 end else begin
		if(rst) begin
			shift <= 4'b0;
			OS_rl <= 1'b0;
		end else begin 
			if(en) begin
					shift <= {IS,shift[3:1]};
					OS_rl <= shift[0];
			end else begin
					OS_rl <= 1'b0;
					shift <= shift;
			end
		end
	 end
end

endmodule
