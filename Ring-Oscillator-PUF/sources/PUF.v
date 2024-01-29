module PUF (
  input        reset,
  input  [3:0] Cha0,
  input  [3:0] Cha1,
  input Enable,
  output [3:0] Response
);
//----------------------------------------------------------------------------
// Your Logic Here
//----------------------------------------------------------------------------

pre_PUF prePUF_inst0 (
  .reset(reset),
  .Cha0(Cha0),
  .Cha1(Cha1),
  .Enable(Enable),
  .Response(Response[0])
);

pre_PUF prePUF_inst1 (
  .reset(reset),
  .Cha0(Cha0),
  .Cha1(Cha1),
  .Enable(Enable),
  .Response(Response[1])
);

pre_PUF prePUF_inst2 (
  .reset(reset),
  .Cha0(Cha0),
  .Cha1(Cha1),
  .Enable(Enable),
  .Response(Response[2])
);

pre_PUF prePUF_inst3 (
  .reset(reset),
  .Cha0(Cha0),
  .Cha1(Cha1),
  .Enable(Enable),
  .Response(Response[3])
);



//----------------------------------------------------------------------------
endmodule
