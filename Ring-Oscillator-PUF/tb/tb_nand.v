module tb_nand ();
reg Enable;
reg in2;
wire out;

nand DUT(out, Enable, in2);

initial
begin
    
    Enable = 1'b0;
    #20;
    Enable = 1'b1;
    #20;
     Enable = 1'b0;
    #20;
    Enable = 1'b1;
     #20;
     Enable = 1'b0;
    #20;
    Enable = 1'b1;
     #20;
     Enable = 1'b0;
    #20;
    Enable = 1'b1;
    
end



endmodule