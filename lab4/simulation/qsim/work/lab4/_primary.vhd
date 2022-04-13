library verilog;
use verilog.vl_types.all;
entity lab4 is
    port(
        clk             : in     vl_logic;
        SW              : in     vl_logic_vector(9 downto 0);
        KEY             : in     vl_logic_vector(1 downto 0);
        LEDR            : out    vl_logic_vector(9 downto 0);
        y_out           : out    vl_logic_vector(6 downto 0);
        x_out           : out    vl_logic_vector(6 downto 0);
        count           : out    vl_logic_vector(6 downto 0);
        shift_rg        : out    vl_logic_vector(9 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        check_x         : out    vl_logic_vector(9 downto 0);
        check_y         : out    vl_logic_vector(9 downto 0)
    );
end lab4;
