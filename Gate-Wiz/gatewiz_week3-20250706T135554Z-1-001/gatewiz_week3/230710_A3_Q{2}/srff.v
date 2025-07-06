module srff (input s,r,clk,output q);
    
    reg q=0;
    always @(posedge clk ) begin
        q <= s | (~r)&q;
    end

endmodule