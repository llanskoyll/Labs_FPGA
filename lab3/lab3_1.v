module lab3_1 (
	input [3:0] v,
	output[3:0] m,
	output reg[6:0] HEX0,
	output reg[6:0] HEX1
);

// Компоратор
wire z = v > 9 ? 1 : 0 ;
reg [3:0] v_correct;
assign m[2:0] = ({3{~z}} & v[2:0]) | ({3{z}} & v_correct[2:0]);
assign m[3] = (~z & v[3]) | (z & 0);

// Схема А
always @* begin
	case(v)
		4'd0: v_correct = 4'd0;
		4'd1: v_correct = 4'd1;
		4'd2: v_correct = 4'd2;
		4'd3: v_correct = 4'd3;
		4'd4: v_correct = 4'd4;
		4'd5: v_correct = 4'd5;
		4'd6: v_correct = 4'd6;
		4'd7: v_correct = 4'd7;
		4'd8: v_correct = 4'd8;
		4'd9: v_correct = 4'd9;
		4'd10: v_correct = 4'd0;
		4'd11: v_correct = 4'd1;
		4'd12: v_correct = 4'd2;
		4'd13: v_correct = 4'd3;
		4'd14: v_correct = 4'd4;
		4'd15: v_correct = 4'd5;
	endcase
end
// Схема Б
always @* begin 
	case(z)
		1'b0: HEX1 = 7'b1000000;
		1'b1: HEX1 = 7'b1111001;
	endcase
end
// Дешифратор 
always @* begin 
	case(v_correct)
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