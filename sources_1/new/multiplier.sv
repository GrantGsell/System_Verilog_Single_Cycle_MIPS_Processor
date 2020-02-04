`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 12/05/2019 01:29:54 PM
// Module Name: multiplier
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
    //Input A is the multiplicand
    //Input B is the inital product
module multiplier(
    output logic [31:0] outMult,
    input logic [31:0] inpMultA,
    input logic [31:0] inpMultB
    );
    //Internal Wire Instantiations
    logic [63:0] product = 64'b0; 
    logic [5:0] count;
    
    //Continuous Logic
    always @* begin
        count = 32'b0;
        product = {32'd0, inpMultB};
        while(count < 32'd32) begin
            //product[0] == 1: Add Multiplicand to left half of product
            if(product[0] == 1'b1) begin
                product[63:32] = product[63:32] + inpMultA;
            end
            //Shift the product right by 1 bit
            product = product >>> 1;
            //Increment the count 
            count++;
        end
        outMult = product[31:0];   
    end 
endmodule
