library verilog;
use verilog.vl_types.all;
entity lab1 is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        z               : in     vl_logic;
        f               : out    vl_logic_vector(0 to 7)
    );
end lab1;
