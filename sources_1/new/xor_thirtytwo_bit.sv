`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 12/06/2019 07:01:50 PM
// Module Name: xor_thirtytwo_bit
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module xor_thirtytwo_bit(
    output logic [31:0] result,
    input logic [31:0] inpA,
    input logic [31:0] inpB
    );
    
    always @* begin
        for(integer i=0; i<32; i++) begin
            if(inpA[i]==inpB[i]) result[i]=0;
            else result[i]=1;
        end
    end
endmodule
