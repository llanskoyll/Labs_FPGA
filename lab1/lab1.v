module lab1 (
	input a,
	input b,
	input z,
	output [0:7] f
);
	assign f[0] = (a & b & z ^ a) | ~b | z;
	assign f[1] = (a & b & z ^ a) | ~b | z;
	assign f[2] = (a & b & z ^ a) | ~b | z;
	assign f[3] = (a & b & z ^ a) | ~b | z;
	assign f[4] = (a & b & z ^ a) | ~b | z;
	assign f[5] = (a & b & z ^ a) | ~b | z;
	assign f[6] = (a & b & z ^ a) | ~b | z;
	assign f[7] = (a & b & z ^ a) | ~b | z;
endmodule 
