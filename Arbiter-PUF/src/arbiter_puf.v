module arbiter_puf #(
  parameter C_BITS = 4, // Challenge Bits
  parameter R_BITS = 4, // Response Bits
  parameter [2*4*C_BITS*R_BITS-1:0] DELAY = 4'd12 // Random Delay Values
) (
  input               reset,     // Active-high reset to set all registers to 0
  input               enable,    // Enable the PUF circuit
  input  [C_BITS-1:0] challenge, // The PUF challenge input
  output [R_BITS-1:0] resp       // The PUF response output
);

//-----------------------------------------------------------------------------
// Your Code Here.
//-----------------------------------------------------------------------------

genvar i;

generate
  for( i=0; i < R_BITS; i=i+1 ) begin : nC_puf_Array
      nC_puf #(
        .DELAY( DELAY [(i+1)*C_BITS*8-1:i*C_BITS*8]),
        .C_BITS(C_BITS)
      ) arbiter_puf_inst (
        .reset(reset),
        .enable(enable),
        .challenge(challenge),
        .resp(resp[i])
      );
  end

endgenerate






//-----------------------------------------------------------------------------
endmodule
