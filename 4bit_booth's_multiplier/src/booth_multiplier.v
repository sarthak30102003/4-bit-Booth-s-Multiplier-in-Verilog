`timescale 1ns / 1ps

module booth_multiplier(
    input signed [3:0] multiplicand,
    input signed [3:0] multiplier,
    output reg signed [7:0] product
    );
    reg signed [7:0] A, Q, M;
    reg Q_1;
    reg [3:0] count;
    always @ (multiplicand or multiplier) begin  
        A = 8'd0;
        M = {multiplicand, 4'd0};
        Q = {4'd0, multiplier};
        count = 4'd4;
        while(count > 0) begin
            case ({Q[0], Q_1})
                2'b01: A = A + M;
                2'b10: A = A - M;
            endcase
            Q_1 = Q[0];
            Q = {A[0], Q[7:1]};
            A = {A[7], A[7:1]};
            count = count - 1;
        end     
        product = {A[7:0]};            
    end    
endmodule
