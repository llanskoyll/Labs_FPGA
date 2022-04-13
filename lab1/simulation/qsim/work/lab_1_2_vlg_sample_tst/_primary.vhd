library verilog;
use verilog.vl_types.all;
entity lab_1_2_vlg_sample_tst is
    port(
        charge_battery  : in     vl_logic;
        elect           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab_1_2_vlg_sample_tst;
