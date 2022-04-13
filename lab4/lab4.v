module lab4(
	input CLOCK_50,
	input [9:0] SW,
	input [1:0] KEY,
	output [9:0] LEDR,
	output reg [6:0] count, // счетчик 
	output reg [3:0] high_count,
	output reg [6:0] low_count,
	output reg [9:0] shift_rg, // сдвиговый регистр
	output reg [6:0] HEX0,
	output reg [6:0] HEX1,
	output reg [6:0] HEX2,
	output reg [6:0] HEX3
);

	initial count = 7'd0;
	initial shift_rg = 10'd0;
	initial HEX0 = 7'd0;
	initial HEX1 = 7'd0;
	initial HEX2 = 7'b1111111;
	initial HEX3 = 7'b1111111;
	
	
	reg clk = 1'b0;
	reg [30:0] clk_count = 20'd0;
	always @(posedge CLOCK_50)begin
		if(clk_count > 25000000) begin
			if(clk) begin
				clk <= 1'b0;
			end else begin
				clk <= 1'b1;
			end
			clk_count <= 20'd0;
		end else begin
			clk_count <= clk_count + 1;
		end
	end
	
	always @(posedge clk or posedge ~KEY[1]) 
		begin
		if(~KEY[1]) 
			begin
				shift_rg <= 0;
				count <= 0;
			end
			else begin 
				if(~KEY[0]) begin
					shift_rg <= {shift_rg[0:0], SW[9:0]};
					if((^shift_rg[9:5]))
						count <= count + 1;
					else 
						count <= count;
				end
			end
		end

	assign LEDR[9:0] = shift_rg[9:0];
	// Десятки
	always @* begin
		if(count <= 7'b000_1010) begin // count < 10 
			high_count <= 4'd0; // 0
		end
		if(count > 7'b000_1001) begin // count > 9, 10 = 7'b000_1010
			high_count <= 4'd1; // 1
		end
		if(count > 7'b001_0011) begin // count > 19, 20 = 7'b001_0100
			high_count <= 4'd2; // 2
		end
		if(count > 7'b001_1101) begin // count > 29, 30 = 7'b001_1110
			high_count <= 4'd3; // 3
		end
		if(count > 7'b010_0111) begin // count > 39, 40 = 7'b010_1000
			high_count <= 4'd4; // 4
		end
		if(count > 7'b011_0001) begin // count > 49, 50 = 7'b011_0010
			high_count <= 4'd5; // 5
		end
		if(count > 7'b011_1011) begin // count > 59, 60 = 7'b011_1100
			high_count <= 4'd6; // 6
		end
		if(count > 7'b100_0101) begin // count > 69, 70 = 7'b100_0110
			high_count <= 4'd7; // 7
		end
		if(count > 7'b100_1111) begin // count > 79, 80 = 7'b101_0000
			high_count <= 4'd8; // 8
		end
		if(count > 7'b101_1001) begin // count > 89, 90 = 7'b101_1010
			high_count <= 4'd9; // 9
		end
	end
	// Единицы
	always @* begin
		if(count < 7'b000_1010) begin // count < 10 
			low_count <= count; // 0
		end
		if(count > 7'b000_1001) begin // count > 9, 10 = 7'b000_1010
			low_count <= count - 7'b000_1010;
		end
		if(count > 7'b001_0011) begin // count > 19, 20 = 7'b001_0100
			low_count <= count - 7'b001_0100;
		end
		if(count > 7'b001_1101) begin // count > 29, 30 = 7'b001_1110
			low_count <= count - 7'b001_1110;
		end
		if(count > 7'b010_0111) begin // count > 39, 40 = 7'b010_1000
			low_count <= count - 7'b010_1000;
		end
		if(count > 7'b011_0001) begin // count > 49, 50 = 7'b011_0010
			low_count <= count - 7'b011_0010;
		end
		if(count > 7'b011_1011) begin // count > 59, 60 = 7'b011_1100
			low_count <= count - 7'b011_1100;
		end
		if(count > 7'b100_0101) begin // count > 69, 70 = 7'b100_0110
			low_count <= count - 7'b100_0110;
		end
		if(count > 7'b100_1111) begin // count > 79, 80 = 7'b101_0000
			low_count <= count - 7'b101_0000;
		end
		if(count > 7'b101_1001) begin // count > 89, 90 = 7'b101_1010
			low_count <= count - 7'b101_1010;
		end
	end
	
	always @(posedge high_count or posedge low_count) begin
		case(high_count) 
			7'b0000000: HEX1 <= 7'b1000000; // 0
			7'b0000001: HEX1 <= 7'b1111001; // 1
			7'b0000010: HEX1 <= 7'b0100100; // 2
			7'b0000011: HEX1 <= 7'b0110000; // 3
			7'b0000100: HEX1 <= 7'b0011001; // 4
			7'b0000101: HEX1 <= 7'b0010010; // 5
			7'b0000110: HEX1 <= 7'b0000010; // 6
			7'b0000111: HEX1 <= 7'b1111000; // 7
			7'b0001000: HEX1 <= 7'b0000000; // 8
			7'b0001001: HEX1 <= 7'b0010000; // 9
			default: HEX1 <= 7'b1000000;
		endcase
		case(low_count) 
			7'b0000000: HEX0 <= 7'b1000000; // 0
			7'b0000001: HEX0 <= 7'b1111001; // 1
			7'b0000010: HEX0 <= 7'b0100100; // 2
			7'b0000011: HEX0 <= 7'b0110000; // 3
			7'b0000100: HEX0 <= 7'b0011001; // 4
			7'b0000101: HEX0 <= 7'b0010010; // 5
			7'b0000110: HEX0 <= 7'b0000010; // 6
			7'b0000111: HEX0 <= 7'b1111000; // 7
			7'b0001000: HEX0 <= 7'b0000000; // 8
			7'b0001001: HEX0 <= 7'b0010000; // 9
			default: HEX0 <= 7'b1000000;
		endcase
	end
endmodule
