library verilog;
use verilog.vl_types.all;
entity lab2_vlg_check_tst is
    port(
        Code            : in     vl_logic_vector(3 downto 0);
        HEX0            : in     vl_logic_vector(6 downto 0);
        HEX1            : in     vl_logic_vector(6 downto 0);
        HEX2            : in     vl_logic_vector(6 downto 0);
        HEX3            : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab2_vlg_check_tst;
