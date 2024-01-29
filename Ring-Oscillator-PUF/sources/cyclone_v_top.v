module cyclone_v_top (
  ///////// CLOCK /////////
  input              CLOCK_50_B5B,
  input              CLOCK_50_B6A,
  input              CLOCK_50_B7A,
  input              CLOCK_50_B8A,

  ///////// CPU /////////
  input              CPU_RESET_n,

  ///////// KEY /////////
  input       [3:0]  KEY,

  ///////// LEDG /////////
  output      [7:0]  LEDG,

  ///////// LEDR /////////
  output      [9:0]  LEDR,

  ///////// SW /////////
  input       [9:0]  SW

);
//----------------------------------------------------------------------------
// Your Logic Here
//----------------------------------------------------------------------------

//wire clock;
wire reset;
//reg [3:0] out;


//assign clock = CLOCK_50_B5B;
assign reset = ~KEY[0];
//assign LEDG[3:0] = out;

PUF PUF_inst0 (
  .reset(reset),
  .Cha0(SW[3:0]),
  .Cha1(SW[7:4]),
  .Enable(SW[9]),
  .Response(LEDG[3:0])
);



/*always @(posedge clock) begin
  if(reset)
    out <= 4'd0;
end*/



//----------------------------------------------------------------------------
endmodule
