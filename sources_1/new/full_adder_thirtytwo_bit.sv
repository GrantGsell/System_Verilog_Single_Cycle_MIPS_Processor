`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 10/30/2019 05:55:42 PM 
// Module Name: full_adder_thirtytwo_bit
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module full_adder_thirtytwo_bit(
    output logic [31:0] sum,
    output logic carry,
    input logic [31:0] inp0,
    input logic [31:0] inp1,
    input logic sign,
    input logic cin
    );
    //Internal wire instantiations
    logic carry0;
    
    //Single Bit Adder module instantiaions
    full_adder_sixteen_bit u0(.sum(sum[15:0]), .carry(carry0), .inp0(inp0[15:0]), .inp1(inp1[15:0]), .cin(cin));
    full_adder_sixteen_bit u1(.sum(sum[31:16]), .carry(carry), .inp0(inp0[31:16]), .inp1(inp1[31:16]), .cin(carry0));
    
    
endmodule
