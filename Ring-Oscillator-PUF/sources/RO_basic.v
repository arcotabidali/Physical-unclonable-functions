module RO_basic (
  input Enable,
  output RO_out
);
//----------------------------------------------------------------------------
// Your Logic Here
//----------------------------------------------------------------------------


parameter inverters = 9;
wire [inverters:0] outputs;  
nand_wrapper nand_wrapper_inst (.in1(Enable), .in2(outputs[inverters-1]), .out(outputs[0]) );

genvar i;
generate
  for (i = 1; i <= inverters; i = i + 1) begin : inverter_array
    not_wrapper not_wrapper_inst (.in(outputs[i-1]), .out(outputs[i]));
  end
endgenerate

assign RO_out = outputs[inverters];



//----------------------------------------------------------------------------
endmodule

module not_wrapper (
  input wire in,
  output wire out
);

wire not_out0;
not not0(not_out0, in);
assign #10 out = not_out0;

endmodule

module nand_wrapper (
  input wire in1,
  input wire in2,
  output wire out
);

wire and_out0;
nand nand0(and_out0, in1, in2);

assign #10 out = and_out0;

endmodule





