module singleRound_puf #(
   parameter [7:0] DELAY = 200
) (
   input a1,
   input b1,
   input a2,
   input b2,
   input sel,
   output out1,
   output out2
);

mux #(
    .DELAY(DELAY [3:0])
) mux1 (
    .a(a1),
    .b(b1),
    .sel(sel),
    .out(out1)
);


mux #(
    .DELAY(DELAY [7:4])
) mux2 (
    .a(a2),
    .b(b2),
    .sel(sel),
    .out(out2)
);


endmodule

