module w3q7 (
    input clk, output [2:0]q
);
    reg q = 0;
    reg [2:0]j;
    reg [2:0]k;
    always @(negedge clk ) begin
        j[2] = (~q[1])& (~q[0]) | q[1] & q[0];
        k[2] = q[2];
        j[1] = q[2] | q[0];
        k[1] = q[2]&q[0] | (~q[2]) & (~q[0]);
        j[0] = (~q[2])&q[1];
        k[0] = q[2];

        
        for(integer i=0;i<=2;i++)begin
            if(j[i]==1 && k[i]==1) q[i] <= ~q[i];
            else if(j[i]==0 && k[i]==1) q[i] <= 0;
            else if(j[i]==1 && k[i]==0) q[i] <= 1;
            else q[i] <= q[i];
        end
        
    end


endmodule