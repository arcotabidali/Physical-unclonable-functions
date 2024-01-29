module tb_Counter_group();
reg [15:0] RO_out;
reg reset;
reg [3:0] Cha0;
reg [3:0] Cha1;
wire Response;


Counter_group DUT
(
    .reset(reset),
    .Cha0(Cha0),
    .Cha1(Cha1),
    .RO_out(RO_out),
    .Response(Response)
);

initial
begin
RO_out <= 0;
Cha0 <= 0001;
Cha1 <= 1000;
end

initial
begin
reset = 1'b1;
#20;
reset = 1'b0;
end



always #10 RO_out[0] = ~RO_out[0];
always #15 RO_out[1] = ~RO_out[1];
always #20 RO_out[2] = ~RO_out[2];
always #25 RO_out[3] = ~RO_out[3];
always #30 RO_out[4] = ~RO_out[4];
always #35 RO_out[5] = ~RO_out[5];
always #40 RO_out[6] = ~RO_out[6];
always #45 RO_out[7] = ~RO_out[7];
always #50 RO_out[8] = ~RO_out[8];
always #55 RO_out[9] = ~RO_out[9];
always #60 RO_out[10] = ~RO_out[10];
always #65 RO_out[11] = ~RO_out[11];
always #70 RO_out[12] = ~RO_out[12];
always #75 RO_out[13] = ~RO_out[13];
always #80 RO_out[14] = ~RO_out[14];
always #85 RO_out[15] = ~RO_out[15];

always @*   
begin
    if (Response === 1'b1 || Response === 1'b0) begin
                $display("Response = %b", Response);
                $stop; // Stop the simulation
            end
end


endmodule