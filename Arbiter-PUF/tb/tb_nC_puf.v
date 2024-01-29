module tb_nC_puf();

parameter C_BITS = 8;
parameter R_BITS = 1;

`include "delay_params.v"

reg reset;
reg enable;
reg [C_BITS-1 : 0] challenge;
wire resp;
wire q;
wire clk;
wire [C_BITS-1 : 0] mux_output1;
wire [C_BITS-1 : 0] mux_output2;

nC_puf #(
    .C_BITS(C_BITS),
    .DELAY(DELAY)
) DUT (
    .reset(reset),
    .enable(enable),
    .challenge(challenge),
    .resp(resp),
    .mux_output1(mux_output1),
  
    .q(q),

    .mux_output2(mux_output2),
    
    .clk(clk)
);



// Query the PUF with a challenge input, display the response output.
task gen_crp;
input [C_BITS-1:0] challenge_in;
begin
  reset = 1'b0;
  enable = 1'b0;
  // Set the given challenge input signals
  challenge = challenge_in;

  #10
  // Reset the PUF
  reset = 1'b1;
  #10
  // Lower the reset signal to exit reset
  reset = 1'b0;
  #10
  // Enable the PUF to receive a response
  enable = 1'b1;


  // Wait  for longest possible delay
  #(16*C_BITS)

  // Print the Challenge, Response Pair

  $display("Challenge: %b, Response: %b", challenge, resp);
  // Lower the enable signal once the response has been received
  enable = 1'b0;
end
endtask


integer i;

initial begin

  // Generate responses for challenges

  for(i=0; i<2**C_BITS; i=i+1)
  begin
    gen_crp(i);
  end
  $stop;
end



endmodule
