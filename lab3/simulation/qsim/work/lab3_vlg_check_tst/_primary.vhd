library verilog;
use verilog.vl_types.all;
entity lab3_vlg_check_tst is
    port(
        HEX0            : in     vl_logic_vector(6 downto 0);
        HEX1            : in     vl_logic_vector(6 downto 0);
        LEDR            : in     vl_logic_vector(4 downto 0);
        M               : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab3_vlg_check_tst;
