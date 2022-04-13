module lab4_all(
/*input nR,
input nS,
output Q,
output nQ
*/
/*
input d,
input en,
output reg q
*/
/*
input d,
input clk,
input set,
input rst,
input en,
output reg q
*/
input clk,
input en,
input rst,
output reg [7:0] counter
);

/*
assign Q = ~(nS & nQ);
assign nQ = ~(nR & Q);
*/
/*
always @(en, d) begin
 if (en) q <= d; // запись
 else q<= q; // хранение
end
*/
initial counter = 8'b0;
always @(posedge clk or posedge rst) begin
 if (rst) counter <= 0;
 else begin
 if (en) counter <= counter + 1;
 else counter <= counter;
 end
end

endmodule	