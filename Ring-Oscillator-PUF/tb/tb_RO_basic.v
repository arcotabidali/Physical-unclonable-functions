module tb_RO_basic ();
reg Enable;
wire RO_out;

RO_basic DUT (
    .Enable(Enable),
    .RO_out(RO_out)
);

always #1 $display("TIME %g,R0_OUT: %b", $time, RO_out);

initial begin
    
    Enable = 1'b0;
    #200;
    Enable = 1'b1;

end

endmodule