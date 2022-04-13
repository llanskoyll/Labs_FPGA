module lab2 (
	input KEY0,
	input KEY1,
	input KEY2,
	input KEY3,
	input [9:0] SW,
	output [3:0] Code,
	output reg [6:0] HEX0,
	output reg [6:0] HEX1,
	output reg [6:0] HEX2,
	output reg [6:0] HEX3
	
);
	//Буву Т или М не получается сделать, поэтому вместо ее Г
	assign Code[3:0] = ({4{~SW[8]}} & SW[3:0]) | ({4{SW[8]}} & SW[7:4]);
	always @*
		begin
			if(~KEY0 | SW[9]) begin
				case(Code[3:0])
					4'd0: HEX0 = 7'b0001000; // Буква А
					default: HEX0 = 7'b1000000;
				endcase
			end
	end
	
	always @*
		begin
			if(~KEY1 | SW[9]) begin
				case(Code[3:0])
					4'd1: HEX1 = 7'b0001100; // Буква Р
					default: HEX1 = 7'b1000000;
				endcase
			end
	end
	
	always @*
		begin
			if(~KEY2 | SW[9]) begin
				case(Code[3:0])
					4'd2: HEX2 = 7'b0000110; // буква Е
					default: HEX2 = 7'b1000000;
				endcase
			end

	end
	always @*
		begin
			if(~KEY3 | SW[9]) begin
				case(Code[3:0])
					4'd3: HEX3 = 7'b1001110; // Буква Г
					default: HEX3 = 7'b1000000;
				endcase
			end
	end

endmodule
