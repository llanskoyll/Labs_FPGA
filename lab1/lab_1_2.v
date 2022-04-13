module lab_1_2 (
	input elect, // электроэнергия
	input charge_battery, // заряд батареи
	output UPS, // Источник бесперебойного питания
	output signal_sound // звуковой сигнал 
);

	assign UPS = ~elect & charge_battery;
	assign signal_sound = ~elect & ~charge_battery;
endmodule
