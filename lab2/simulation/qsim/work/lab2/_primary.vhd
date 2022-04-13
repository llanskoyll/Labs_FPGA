library verilog;
use verilog.vl_types.all;
entity lab2 is
    port(
        KEY0            : in     vl_logic;
        KEY1            : in     vl_logic;
        KEY2            : in     vl_logic;
        KEY3            : in     vl_logic;
        SW              : in     vl_logic_vector(9 downto 0);
        Code            : out    vl_logic_vector(3 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0)
    );
end lab2;
