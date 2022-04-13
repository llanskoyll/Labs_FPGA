library verilog;
use verilog.vl_types.all;
entity lab3 is
    port(
        V               : in     vl_logic_vector(4 downto 0);
        LEDR            : out    vl_logic_vector(4 downto 0);
        M               : out    vl_logic_vector(7 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0)
    );
end lab3;
