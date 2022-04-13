module lab5(
	input CLOCK_50,
	input [1:0] KEY,
	output reg [6:0] HEX0,// тысячные доли секунды
	output reg [6:0] HEX1,// десятые доли секунды
	output reg [6:0] HEX2,// единцы секунд
	output reg [6:0] HEX3, // десятки секунд
	output reg device_runnig
);

initial HEX0 = 7'd1; // тысячные
initial HEX1 = 7'd1; // десятые
initial HEX2 = 7'd1; // единицы
initial HEX3 = 7'd1; // десятки 
initial device_runnig = 1'b0;

always @(negedge KEY[0]) begin
	device_runnig <= ~device_runnig;
end
reg [3:0] thousandths_of_second = 4'd0; // тысяные доли
reg [3:0] tenth_of_second = 4'd0; // десятичные доли
reg [3:0] units_of_second = 4'd0; // единцы
reg [3:0] tens_of_seconds = 4'd0; // десятки
reg [29:0] count_thousandths_of_second = 30'd0; // тысячные
reg [29:0] count_tenth_of_second = 30'd0; // десятичные
reg [29:0] count_units_of_second = 30'd0; // единицы

// Возьмем для модуляции что частота кристалла 10_000 Гц => (*компьютер не тянет больше*)
// десяток секунда = 10_0000 
// единица секунды = 10_000
// десятая доля 10_00
// тысячная 10

always @(posedge CLOCK_50) begin

	if(device_runnig) begin // запуск
		count_thousandths_of_second = count_thousandths_of_second + 1;
		count_tenth_of_second = count_tenth_of_second + 1;
		count_units_of_second = count_units_of_second + 1;

		// тысячные
		if(count_thousandths_of_second == 10) begin
			thousandths_of_second = thousandths_of_second + 1;
			if(thousandths_of_second > 9) begin 
				thousandths_of_second = 4'd0;
			end
			count_thousandths_of_second = 30'd0;
		end
		// десятые доли
		if(count_tenth_of_second == 1000) begin
			tenth_of_second = tenth_of_second + 1;
			if(tenth_of_second > 9) begin 
				tenth_of_second = 4'd0;
			end
			count_tenth_of_second = 30'd0;	
		end

		// единицы секунды
		if(count_units_of_second == 10000) begin
			units_of_second = units_of_second + 1;
			if(units_of_second > 9) begin 
				tens_of_seconds[3:0] = tens_of_seconds[3:0] + 1;
				if(tens_of_seconds > 9) begin
					tens_of_seconds = 4'd0;
				end
				units_of_second = 4'd0;
			end
			count_units_of_second = 30'd0;	
		end
	end 
	
	if(~device_runnig) begin // при остановке 
		if(count_thousandths_of_second == 9) begin
			thousandths_of_second = thousandths_of_second + 1;
			if(thousandths_of_second > 9) begin 
				thousandths_of_second = 4'd0;
			end
			count_thousandths_of_second = 30'd0;
		end
		// десятые доли
		if(count_tenth_of_second == 999) begin
			tenth_of_second = tenth_of_second + 1;
			if(tenth_of_second > 9) begin 
				tenth_of_second = 4'd0;
			end
			count_tenth_of_second = 30'd0;	
		end

		// единицы секунды
		if(count_units_of_second == 9999) begin
			units_of_second = units_of_second + 1;
			if(units_of_second > 9) begin 
				tens_of_seconds[3:0] = tens_of_seconds[3:0] + 1;
				if(tens_of_seconds > 9) begin
					tens_of_seconds = 4'd0;
				end
				units_of_second = 4'd0;
			end
			count_units_of_second = 30'd0;	
		end
	end
	
	if(~KEY[1]) begin
		count_thousandths_of_second = 30'd0;
		count_tenth_of_second = 30'd0;
		count_units_of_second = 30'd0;
		
		thousandths_of_second = 4'd0;
		tenth_of_second = 4'd0;
		units_of_second = 4'd0;
		tens_of_seconds = 4'd0;
	end
end


// Дисплей
always @(posedge thousandths_of_second or posedge tenth_of_second or posedge units_of_second or posedge tens_of_seconds) begin
	case(thousandths_of_second) 
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
		default: HEX0 = 7'b1111111;
	endcase
	case(tenth_of_second)
		4'd0: HEX1 = 7'b1000000;
		4'd1: HEX1 = 7'b1111001;
		4'd2: HEX1 = 7'b0100100;
		4'd3: HEX1 = 7'b0110000;
		4'd4: HEX1 = 7'b0011001;
		4'd5: HEX1 = 7'b0010010;
		4'd6: HEX1 = 7'b0000010;
		4'd7: HEX1 = 7'b1111000;
		4'd8: HEX1 = 7'b0000000;
		4'd9: HEX1 = 7'b0010000;
		default: HEX1 = 7'b1111111;
	endcase
	case(units_of_second)
		4'd0: HEX2 = 7'b1000000;
		4'd1: HEX2 = 7'b1111001;
		4'd2: HEX2 = 7'b0100100;
		4'd3: HEX2 = 7'b0110000;
		4'd4: HEX2 = 7'b0011001;
		4'd5: HEX2 = 7'b0010010;
		4'd6: HEX2 = 7'b0000010;
		4'd7: HEX2 = 7'b1111000;
		4'd8: HEX2 = 7'b0000000;
		4'd9: HEX2 = 7'b0010000;
		default: HEX2 = 7'b1111111;
	endcase
	case(tens_of_seconds)
		4'd0: HEX3 = 7'b1000000;
		4'd1: HEX3 = 7'b1111001;
		4'd2: HEX3 = 7'b0100100;
		4'd3: HEX3 = 7'b0110000;
		4'd4: HEX3 = 7'b0011001;
		4'd5: HEX3 = 7'b0010010;
		4'd6: HEX3 = 7'b0000010;
		4'd7: HEX3 = 7'b1111000;
		4'd8: HEX3 = 7'b0000000;
		4'd9: HEX3 = 7'b0010000;
		default: HEX3 = 7'b1111111;
	endcase
end
endmodule
/*
		десятки секунды
		if(count_thousandths_of_second == 99999) begin
			tens_of_seconds = tens_of_seconds + 1;
			if(tens_of_seconds > 9) begin 
				tens_of_seconds = 4'd0;
			end
			count_tens_of_seconds = 30'd0;
		end
*/
/*
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
	4'd10: HEX0 = 7'b0001000;
	4'd11: HEX0 = 7'b0000011;
	4'd12: HEX0 = 7'b1000110;
	4'd13: HEX0 = 7'b0100001;
	4'd14: HEX0 = 7'b0000110;
	4'd15: HEX0 = 7'b0001110;
*/