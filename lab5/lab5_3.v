module lab5_3(
	input CLOCK_50,
	input [1:0] KEY,
	output reg device_runnig
);


always @(negedge KEY[1]) begin
	device_runnig <= ~device_runnig;
end
endmodule
