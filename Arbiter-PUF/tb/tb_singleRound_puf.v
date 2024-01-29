module tb_singleRound_puf();

parameter [7:0] DELAY = 8'b00001111;
reg a1;
reg b1;
reg a2;
reg b2;
reg sel;

wire out1;
wire out2;

singleRound_puf #(
    .DELAY(DELAY)
) DUT (
    .a1(a1),
    .b1(b1),
    .a2(a2),
    .b2(b2),
    .sel(sel),

    .out1(out1),
    .out2(out2)
);

always #1 $display("TIME %g, A1: %b, B1: %b, SEL: %b, OUT1: %b", $time, a1, b1, sel, out1);

always #1 $display("TIME %g, A2: %b, B2: %b, SEL: %b, OUT2: %b", $time, a2, b2, sel, out2);

initial begin
  a1 =  1'b1;
  b1 =  1'b0;
  a2 =  1'b1;
  b2 =  1'b0;
  sel = 1'b1;

  #20
  b1 =  1'b1;
  a1 =  1'b0;
  b2 =  1'b1;
  a2 =  1'b0;

  #20
  $stop;
end


endmodule