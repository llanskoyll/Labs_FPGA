library verilog;
use verilog.vl_types.all;
entity lab1_vlg_check_tst is
    port(
        f               : in     vl_logic_vector(0 to 7);
        sampler_rx      : in     vl_logic
    );
end lab1_vlg_check_tst;
