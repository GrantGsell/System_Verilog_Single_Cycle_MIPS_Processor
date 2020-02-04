`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 10/28/2019 04:59:27 PM
// Module Name: full_adder_four_bit
// Project Name: DPU_Design
//////////////////////////////////////////////////////////////////////////////////


module full_adder_four_bit(
    output logic [3:0] sum,
    output logic carry,
    input logic [3:0] inp0,
    input logic [3:0] inp1,
    input logic cin
    );
    
    //Internal wire instantiations
    logic carry0, carry1, carry2;
    
    //Single Bit Adder module instantiaions
    full_adder_one_bit u0(.sum(sum[0]), .carry(carry0), .inp0(inp0[0]), .inp1(inp1[0]), .cin(cin));
    full_adder_one_bit u1(.sum(sum[1]), .carry(carry1), .inp0(inp0[1]), .inp1(inp1[1]), .cin(carry0));
    full_adder_one_bit u2(.sum(sum[2]), .carry(carry2), .inp0(inp0[2]), .inp1(inp1[2]), .cin(carry1));
    full_adder_one_bit u3(.sum(sum[3]), .carry(carry), .inp0(inp0[3]), .inp1(inp1[3]), .cin(carry2));
    
endmodule
