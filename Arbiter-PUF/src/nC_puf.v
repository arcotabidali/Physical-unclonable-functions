module nC_puf #(
    parameter C_BITS = 8, //challenge Bits
    parameter [8*C_BITS-1:0] DELAY = 64'b1010110010101100100110011100011110010010001001100101111011111011
) (
  input reset,                           // Active-high reset to set all registers to 0
  input enable,                          // Enable the PUF circuit
  input [C_BITS-1:0] challenge, // The PUF challenge input
  output resp                           // The PUF response output
);

genvar  i;
wire [C_BITS-1 : 0] mux_output1;
wire [C_BITS-1 : 0] mux_output2;

generate    
    for(i=0; i < C_BITS; i=i+1) begin : singleRound_puf_array
        if(i==0)
        singleRound_puf #(
                .DELAY(DELAY [(i+1)*8 -1 : i*8])
            ) srp_inst (
            .a1(enable),
            .b1(enable),
            .a2(enable),
            .b2(enable),

            .sel(challenge[i]),
            .out1(mux_output1[i]),
            .out2(mux_output2[i])
        );
        else if(i == C_BITS-1)
        begin
            singleRound_puf #(
                .DELAY(DELAY [(i+1)*8 -1 : i*8])
            ) srp_inst (
                .a1(mux_output1[i-1]),
                .b1(mux_output2[i-1]),
                .a2(mux_output2[i-1]),
                .b2(mux_output1[i-1]),

                .sel(challenge[i]),
                .out1(mux_output1[i]),
                .out2(mux_output2[i])
            );

            D_flip_flop dff_inst
            (
                .d(mux_output1[i]),
                .clk(mux_output2[i]),
                .q(resp),
                .reset(reset)
            );
        end

        else
            singleRound_puf #(
                .DELAY(DELAY [(i+1)*8 -1 : i*8])
            ) srp_inst (
                .a1(mux_output1[i-1]),
                .b1(mux_output2[i-1]),
                .a2(mux_output2[i-1]),
                .b2(mux_output1[i-1]),

                .sel(challenge[i]),
                .out1(mux_output1[i]),
                .out2(mux_output2[i])
            );

    end
endgenerate
endmodule