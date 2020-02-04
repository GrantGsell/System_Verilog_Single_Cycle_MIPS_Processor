`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Grant Gsell
// 
// Create Date: 10/28/2019 12:37:55 PM
// Module Name: half_adder
// Project Name: CPU_Design 
//////////////////////////////////////////////////////////////////////////////////
module half_adder(
    output logic sum,
    output logic carry,
    input logic inp1,
    input logic inp2
    );
    //Sum and carry calculations
    assign sum = inp1^inp2;
    assign carry = inp1 & inp2;
endmodule
