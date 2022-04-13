module lab5_2 (
	input CLOCK_50,
	input EN, // device_runnig, для простоты обусловимся пока вводить таким образом
	output reg hundredth_second, // Более правильно будет использовать wire, но сделал output для наглядности на временно диаграмме
	output reg [19:0] data
); // Код описания предыдущей схемы с мультиплексором

initial data = 20'd0;
initial hundredth_second = 1'd0;


reg flag = 1'd0;
reg flag_posedge = 1'd0;
reg flag_negedge = 1'd0;


always@(posedge CLOCK_50) begin // условимся что 25_99_999 = 259;
	data = (hundredth_second & 0) | (~hundredth_second & data); // мультиплексор
	if(EN) begin		  
		data <= data + 1;
		if(data == 259) begin
			flag = 1'd1;
			flag_posedge <= 1'd1;
			flag_negedge <= 1'd1;
		end else begin
			flag <= 1'd0;
			flag_posedge <= 1'd0;
			flag_negedge <= 1'd0;
		end
	end
end 

always@(posedge flag_posedge or negedge flag_negedge) begin
	if(flag_posedge == 1) begin
		hundredth_second <= 1'd1;
	end else begin
		hundredth_second <= 1'd0;
	end
end
endmodule

/*
if(EN) begin
			  
		data <= data + 1;
		if(data == 259) begin
			data <= 20'd0;
			flag = 1'd1;
			flag_posedge <= 1'd1;
			flag_negedge <= 1'd1;
		end else begin
			flag <= 1'd0;
			flag_posedge <= 1'd0;
			flag_negedge <= 1'd0;
		end
	end
*/