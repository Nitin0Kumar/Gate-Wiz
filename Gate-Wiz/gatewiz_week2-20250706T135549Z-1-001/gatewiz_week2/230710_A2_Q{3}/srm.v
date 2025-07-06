module srm (data_in,ctrl,out1,out2);
    
    input[99:0] data_in;
    input ctrl;
    output[99:0] out1,out2;
    
    assign out1 = ctrl ? 100'b0 : data_in;
    assign out2 = ctrl ? data_in : 100'b0;

endmodule