module pre_PUF (
input reset,
input [3:0] Cha0,
input [3:0] Cha1,
input Enable,
output Response
);

wire [15:0] RO_out;

(* keep *) RO_basic RO_basic_inst0 (.Enable(Enable), .RO_out(RO_out[0]));
(* keep *) RO_basic RO_basic_inst1 (.Enable(Enable), .RO_out(RO_out[1]));
(* keep *) RO_basic RO_basic_inst2 (.Enable(Enable), .RO_out(RO_out[2]));
(* keep *) RO_basic RO_basic_inst3 (.Enable(Enable), .RO_out(RO_out[3]));
(* keep *) RO_basic RO_basic_inst4 (.Enable(Enable), .RO_out(RO_out[4]));
(* keep *) RO_basic RO_basic_inst5 (.Enable(Enable), .RO_out(RO_out[5]));
(* keep *) RO_basic RO_basic_inst6 (.Enable(Enable), .RO_out(RO_out[6]));
(* keep *) RO_basic RO_basic_inst7 (.Enable(Enable), .RO_out(RO_out[7]));
(* keep *) RO_basic RO_basic_inst8 (.Enable(Enable), .RO_out(RO_out[8]));
(* keep *) RO_basic RO_basic_inst9 (.Enable(Enable), .RO_out(RO_out[9]));
(* keep *) RO_basic RO_basic_inst10 (.Enable(Enable), .RO_out(RO_out[10]));
(* keep *) RO_basic RO_basic_inst11 (.Enable(Enable), .RO_out(RO_out[11]));
(* keep *) RO_basic RO_basic_inst12 (.Enable(Enable), .RO_out(RO_out[12]));
(* keep *) RO_basic RO_basic_inst13 (.Enable(Enable), .RO_out(RO_out[13]));
(* keep *) RO_basic RO_basic_inst14 (.Enable(Enable), .RO_out(RO_out[14]));
(* keep *) RO_basic RO_basic_inst15 (.Enable(Enable), .RO_out(RO_out[15]));

Counter_group Counter_group_inst (
  .reset(reset),
  .Cha0(Cha0),
  .Cha1(Cha1),
  .RO_out(RO_out),
  .Response(Response)
);




endmodule