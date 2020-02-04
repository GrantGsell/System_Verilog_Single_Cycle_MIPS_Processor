`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell 
//
// Create Date: 12/06/2019 07:00:17 PM
// Module Name: or_thirtytwo_bit
// Project Name:CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module or_thirtytwo_bit(
    output logic [31:0] result,
    input logic [31:0] inpA,
    input logic [31:0] inpB
    );
    
    always @* begin
        for(integer i=0; i<32; i++) begin
            if(inpA[i]==1 || inpB[i]==1) result[i] = 1;
            else result[i] = 0;
        end    
    end
endmodule
