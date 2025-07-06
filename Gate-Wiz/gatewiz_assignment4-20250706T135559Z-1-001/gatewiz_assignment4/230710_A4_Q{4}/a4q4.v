module a4q4 (
    input clk,x,
    output z
);
    reg z = 0;
    parameter a=0,b=1,c=2,d=3;
    reg [1:0]st = a;
    always @(posedge clk ) begin
        case (st)
            a : begin
                if(x==0) st<=b;
                else st<=a;
            end
            b : begin
                if(x==0) st<=b;
                else st<=c;
            end
            c : begin
                if(x==0) st<=b;
                else st<=d;
            end
            d : begin
                if(x==0) st<=b;
                else st<=a;
            end
        endcase
    end
    always @(posedge clk) begin
        if(st==d &&x==0) z = 1;
        else z=0;
    end
endmodule