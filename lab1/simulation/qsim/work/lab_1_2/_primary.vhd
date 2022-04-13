library verilog;
use verilog.vl_types.all;
entity lab_1_2 is
    port(
        elect           : in     vl_logic;
        charge_battery  : in     vl_logic;
        UPS             : out    vl_logic;
        signal_sound    : out    vl_logic
    );
end lab_1_2;
