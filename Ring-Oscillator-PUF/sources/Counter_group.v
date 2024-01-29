module Counter_group (
  input reset,
  input [3:0] Cha0,
  input [3:0] Cha1,
  input [15:0] RO_out,
  output reg Response
);
//----------------------------------------------------------------------------
// Your Logic Here
//----------------------------------------------------------------------------

wire finish1, finish2;

Counter counter1(
  .reset(reset),
  .clk(RO_out[Cha0]),
  .finish(finish1)
);

Counter counter2(
  .reset(reset),
  .clk(RO_out[Cha1]),
  .finish(finish2)
);

reg resultDeclared = 1'b0;
always @(posedge finish1 or posedge finish2 or posedge reset)
begin
    if(finish1 == 1'b1)
      begin
      if(resultDeclared == 1'b0) begin
      Response = 1'b1;
      resultDeclared = 1'b1;
      end
      end
    else if(finish2 == 1'b1)
    begin
      if(resultDeclared == 1'b0) begin
      Response = 1'b0;
      resultDeclared = 1'b1;
      end
    end
	 else if(reset == 1'b1)
   begin
     resultDeclared = 1'b0;
     Response = 1'b0;
   end
end


//----------------------------------------------------------------------------

endmodule


module Counter #
(
  parameter BITS = 16
)
(
  input wire clk, //clk input
  input wire reset, //reset input
  output reg finish
);

reg finished = 0; //wheather count is finished or not.
reg [BITS-1 : 0] count; // BITS counter output
always @(posedge clk or posedge reset) begin
  if(reset)
	 begin
   count <= 0;
	 end
  else if(count == (2**BITS)-1 & finished == 1'b0)
  begin
    finish <= 1'b1;
    finished <= 1'b1;
  end
  else
   count <= count + 1;
  
end

endmodule
