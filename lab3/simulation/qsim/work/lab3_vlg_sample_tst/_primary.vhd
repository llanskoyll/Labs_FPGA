library verilog;
use verilog.vl_types.all;
entity lab3_vlg_sample_tst is
    port(
        V               : in     vl_logic_vector(4 downto 0);
        sampler_tx      : out    vl_logic
    );
end lab3_vlg_sample_tst;
