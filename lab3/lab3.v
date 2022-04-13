// Индивидуальное
module lab3(
	input [4:0] V,
	output [3:0] low_bit,
	output reg [4:0] LEDR,
	output [7:0] M,
	output reg [6:0] HEX0,
	output reg [6:0] HEX1
);
reg[3:0] high_bit;
reg flag;

always @* begin
	if(V > 5'd9) begin high_bit = 4'd1; flag = 1'd1; end
	if(V > 5'd19) begin high_bit = 4'd2; flag = 1'd1; end
	if(V > 5'd29) begin high_bit = 4'd3; flag = 1'd1; end
end
always @* begin
	case(V)
		5'b01110: LEDR = 5'b01110;
		default: LEDR = 5'b00000;
	endcase
end
assign low_bit = (~{4{flag}} & V) | ({4{flag}} & (V - 4'b1010));
assign M[7:4] = high_bit;
assign M[3:0] = low_bit;

always @* begin
	case(M[7:4])
		4'd0: HEX1 = 7'b1000000;
		4'd1: HEX1 = 7'b1111001;
		4'd2: HEX1 = 7'b0100100;
		4'd3: HEX1 = 7'b0110000;
	endcase
end

always @* begin
	case(M[3:0])
		4'd0: HEX0 = 7'b1000000;
		4'd1: HEX0 = 7'b1111001;
		4'd2: HEX0 = 7'b0100100;
		4'd3: HEX0 = 7'b0110000;
		4'd4: HEX0 = 7'b0011001;
		4'd5: HEX0 = 7'b0010010;
		4'd6: HEX0 = 7'b0000010;
		4'd7: HEX0 = 7'b1111000;
		4'd8: HEX0 = 7'b0000000;
		4'd9: HEX0 = 7'b0010000;
 endcase
end

endmodule

