module main(
	input [9:0] SW,
	input CLOCK_50,
	input [3:0] KEY,
	output [9:0] LEDR,
	output [7:0] LEDG,
	output reg [3:0] LEDR_reg,
	output reg [3:0] memory_massive,// СЧЕТЧИК ОПРЕДЕЛЕННОГО МАССИВА
	output reg [3:0] temp_massive,
	output reg [6:0] HEX0,
	output reg [6:0] HEX1,
	output reg [6:0] HEX2,
	output reg [6:0] HEX3
);
reg [3:0] memory [0:3];
initial begin 
	HEX0 <= 7'b0000000;
	HEX1 <= 7'b1111111;
	HEX2 <= 7'b1111111;
	HEX3 <= 7'b0000000;
end
// SW[9] - РАЗРЕШЕНИЕ НА ЗАПИСЬ 
// SW[8] - ОПРЕДЕЛЕННЫЙ МАССИВ
// SW[3:0] - ВВОД ЧИСЛА
// KEY[0] - СБРОС

always@(posedge SW[8]) begin
	if(memory_massive == 4'd3) begin
		memory_massive = 4'd0;
	end else if(SW[5]) begin 
		memory_massive = 4'd0;
	end else begin
		memory_massive = memory_massive + 4'd1;
	end
end

assign LEDR[3:0] = memory_massive;
assign LEDG[3:0] = LEDR_reg;
always @(posedge CLOCK_50) begin
	if(SW[9])
		case(memory_massive)
			4'd0: begin
						memory[0][3:0] = SW[3:0];
					end
			4'd1: begin
						memory[1][3:0] = SW[3:0];
					end
			4'd2: begin
						memory[2][3:0] = SW[3:0];
					end
			4'd3: begin
						memory[3][3:0] = SW[3:0];
					end
		endcase
end
	
always@(posedge CLOCK_50) begin
	case(memory_massive) 
			4'd0: HEX3 <= 7'b1000000; // 0
			4'd1: HEX3 <= 7'b1111001; // 1
			4'd2: HEX3 <= 7'b0100100; // 2
			4'd3: HEX3 <= 7'b0110000; // 3
			4'd4: HEX3 <= 7'b0011001; // 4
	endcase
end
always@(posedge CLOCK_50) begin
	case(memory_massive) 
		4'd0: begin
		temp_massive <= memory[0];
		LEDR_reg[3:0] <= temp_massive[3:0];
		case(temp_massive)
			4'd0: HEX0 <= 7'b1000000; // 0
			4'd1: HEX0 <= 7'b1111001; // 1
			4'd2: HEX0 <= 7'b0100100; // 2
			4'd3: HEX0 <= 7'b0110000; // 3
			4'd4: HEX0 <= 7'b0011001; // 4
		endcase
		end
		4'd1: begin
		temp_massive <= memory[1];
		LEDR_reg[3:0] <= temp_massive[3:0];
		case(temp_massive)
			4'd0: HEX0 <= 7'b1000000; // 0
			4'd1: HEX0 <= 7'b1111001; // 1
			4'd2: HEX0 <= 7'b0100100; // 2
			4'd3: HEX0 <= 7'b0110000; // 3
			4'd4: HEX0 <= 7'b0011001; // 4
		endcase
		end
		4'd2: begin
		temp_massive <= memory[2];
		LEDR_reg[3:0] <= temp_massive[3:0];
		case(temp_massive)
			4'd0: HEX0 <= 7'b1000000; // 0
			4'd1: HEX0 <= 7'b1111001; // 1
			4'd2: HEX0 <= 7'b0100100; // 2
			4'd3: HEX0 <= 7'b0110000; // 3
			4'd4: HEX0 <= 7'b0011001; // 4
		endcase
		end
		4'd3: begin
		temp_massive <= memory[3];
		LEDR_reg[3:0] <= temp_massive[3:0];
		case(temp_massive)
			4'd0: HEX0 <= 7'b1000000; // 0
			4'd1: HEX0 <= 7'b1111001; // 1
			4'd2: HEX0 <= 7'b0100100; // 2
			4'd3: HEX0 <= 7'b0110000; // 3
			4'd4: HEX0 <= 7'b0011001; // 4
		endcase
		end
	endcase
end



endmodule


/*
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
*/
