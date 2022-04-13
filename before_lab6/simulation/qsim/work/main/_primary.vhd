library verilog;
use verilog.vl_types.all;
entity main is
    port(
        SW              : in     vl_logic_vector(9 downto 0);
        CLOCK_50        : in     vl_logic;
        KEY             : in     vl_logic_vector(3 downto 0);
        LEDR            : out    vl_logic_vector(9 downto 0);
        LEDG            : out    vl_logic_vector(7 downto 0);
        LEDR_reg        : out    vl_logic_vector(3 downto 0);
        memory_massive  : out    vl_logic_vector(3 downto 0);
        temp_massive    : out    vl_logic_vector(3 downto 0)
    );
end main;
