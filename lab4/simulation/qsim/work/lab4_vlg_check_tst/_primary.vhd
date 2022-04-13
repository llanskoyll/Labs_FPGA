library verilog;
use verilog.vl_types.all;
entity lab4_vlg_check_tst is
    port(
        HEX0            : in     vl_logic_vector(6 downto 0);
        HEX1            : in     vl_logic_vector(6 downto 0);
        LEDR            : in     vl_logic_vector(9 downto 0);
        check_x         : in     vl_logic_vector(9 downto 0);
        check_y         : in     vl_logic_vector(9 downto 0);
        count           : in     vl_logic_vector(6 downto 0);
        shift_rg        : in     vl_logic_vector(9 downto 0);
        x_out           : in     vl_logic_vector(6 downto 0);
        y_out           : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab4_vlg_check_tst;
