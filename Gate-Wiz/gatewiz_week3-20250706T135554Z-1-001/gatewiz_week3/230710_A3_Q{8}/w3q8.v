module w3q8 (
    input clk,a,b,output q
);
    reg q =0;
    reg j,k;

    always @(posedge clk ) begin
        j = a;
        k = a^b;

        if(j==0 &&k==1) q <= 0;
        else if(j==1 && k==0) q <= 1;
        else if(j==1 && k==1) q<= ~q;
        else q <= q;
    end
    
endmodule