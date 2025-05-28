`timescale 1ns / 1ps

module tb_booth_multiplier;
    reg signed [3:0] multiplicand;
    reg signed [3:0] multiplier;
    wire signed [7:0] product;
    booth_multiplier uut (.multiplicand (multiplicand), .multiplier (multiplier), .product (product) );
    initial begin
        multiplicand = 4'd3;
        multiplier = 4'd2;
        #10;
        $display ("Multiplicand = %d, Multiplier - %d, Product - %d", multiplicand, multiplier, product) ;
        multiplicand = -4'd3;
        multiplier = 4'd2;
        #10;
        $display ("Multiplicand = %d, Multiplier = %d, Product = %d", multiplicand, multiplier, product) ;
        multiplicand = 4'd3;
        multiplier = -4'd2;
        #10;
        $display ("Multiplicand = %d, Multiplier = %d, Product = %d", multiplicand, multiplier, product) ;
        multiplicand = 4'd0;
        multiplier = 4'd2;
        #10;
        $display ("Multiplicand = %d, Multiplier = %d, Product = %d", multiplicand, multiplier, product) ;
        $finish;
    end        
endmodule
    
  
