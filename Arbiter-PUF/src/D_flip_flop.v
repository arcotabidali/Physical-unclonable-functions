module D_flip_flop
(
    input d,
    input clk,
    input reset,
    output reg q

);

always @( posedge clk or posedge reset) begin 

   if (reset == 1'b1 )
        q <= 1'b0;
    else
        q <= d;
end
    
endmodule