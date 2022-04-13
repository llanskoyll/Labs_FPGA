library verilog;
use verilog.vl_types.all;
entity lab4_vlg_sample_tst is
    port(
        KEY             : in     vl_logic_vector(1 downto 0);
        SW              : in     vl_logic_vector(9 downto 0);
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab4_vlg_sample_tst;
