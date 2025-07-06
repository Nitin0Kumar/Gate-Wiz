module m10_cnt (input clk,reset,pause, output [3:0]q);
    
    reg q =0;
    always @(posedge clk ) begin
        if(reset) q <= 0;
        else begin
            if(pause) begin
                if(q==9) q<=0;
                else q <= q+1;
            end
        end
    end

endmodule