library verilog;
use verilog.vl_types.all;
entity main_vlg_check_tst is
    port(
        LEDG            : in     vl_logic_vector(7 downto 0);
        LEDR            : in     vl_logic_vector(9 downto 0);
        LEDR_reg        : in     vl_logic_vector(3 downto 0);
        memory_massive  : in     vl_logic_vector(3 downto 0);
        temp_massive    : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end main_vlg_check_tst;
