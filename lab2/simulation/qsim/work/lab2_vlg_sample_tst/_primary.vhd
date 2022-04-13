library verilog;
use verilog.vl_types.all;
entity lab2_vlg_sample_tst is
    port(
        KEY0            : in     vl_logic;
        KEY1            : in     vl_logic;
        KEY2            : in     vl_logic;
        KEY3            : in     vl_logic;
        SW              : in     vl_logic_vector(9 downto 0);
        sampler_tx      : out    vl_logic
    );
end lab2_vlg_sample_tst;
