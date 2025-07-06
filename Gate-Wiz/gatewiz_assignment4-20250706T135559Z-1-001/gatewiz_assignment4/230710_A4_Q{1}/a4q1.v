module a4q1 (
    input dark,
    input bad_air,
    input manual_light,
    input manual_fan,
    output light,
    output fan
);
    
    assign light = manual_light? 1 : (dark? 1 :0);
    assign fan = manual_fan? 1 : (bad_air? 1 : 0);


endmodule
