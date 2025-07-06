module a4q3 (
    input clk,x,
    output z
);
    
    reg z = 0;
    always @(posedge clk ) begin
        if(x==1) z <= ~z;
    end

endmodule