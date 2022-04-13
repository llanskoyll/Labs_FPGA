// Двоично-десятичный -> двоичный
module lab3_2(
	input [7:0] d,
	output [7:0] b
);
reg [7:0]dec;

always @* begin
	case(d[7:4])
	// "Умножение на 10"
		4'd0: dec = 7'b0000000;
		4'd1: dec = 7'b0001010;
		4'd2: dec = 7'b0010100;
		4'd3: dec = 7'b0011110;
		4'd4: dec = 7'b0101000;
		4'd5: dec = 7'b0110010;
		4'd6: dec = 7'b0111100;
		4'd7: dec = 7'b1000110;
		4'd8: dec = 7'b1010000;
		4'd9: dec = 7'b1011010;
	endcase
end

assign b[0] = d[0];
assign b[6:1] = dec[6:1] + d[3:1];

endmodule
