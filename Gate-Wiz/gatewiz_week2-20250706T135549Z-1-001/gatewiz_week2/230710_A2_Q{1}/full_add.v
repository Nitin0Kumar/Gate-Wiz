module full_add(input a,b,cin ,output s,cout);

    wire x,y;
    assign x = a ^ b;
    assign y = a & b;
    assign s = cin ^ x;
    assign cout = y | cin&x;
    
endmodule