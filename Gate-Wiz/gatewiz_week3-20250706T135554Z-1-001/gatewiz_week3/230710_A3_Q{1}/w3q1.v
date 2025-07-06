module w3q1 (input in,clk,output q);
    reg q =0;

    always @(posedge clk ) begin
        q <= q^in;
    end

endmodule