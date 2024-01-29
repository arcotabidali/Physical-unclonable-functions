module tb_D_flip_flop();
reg d;
reg clk;
reg reset;
wire q;

D_flip_flop DUT
(
    .clk(clk),
    .d(d),
    .q(q),
    .reset(reset)
);


initial
    begin
        clk =1'b0;
        forever #20 clk = ~clk;
    end


initial

    begin
    reset = 1'b1;
    #40;
    reset = 1'b0;
    #40;


    d = 1'b0;
    repeat(2000)
    #40 d = ~d;

    $finish;
    end





endmodule