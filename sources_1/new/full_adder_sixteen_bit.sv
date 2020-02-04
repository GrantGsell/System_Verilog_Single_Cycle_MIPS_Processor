`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Grant Gsell
// 
// Create Date: 10/29/2019 01:06:49 PM
// Module Name: full_adder_sixteen_bit
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////

module full_adder_sixteen_bit(
    output logic [15:0] sum,
    output logic carry,
    input logic [15:0] inp0,
    input logic [15:0] inp1,
    input logic cin
    );
    
    //Internal wire instantiations
    logic carry0, carry1, carry2;
    
    //Single Bit Adder module instantiaions
    full_adder_four_bit u0(.sum(sum[3:0]), .carry(carry0), .inp0(inp0[3:0]), .inp1(inp1[3:0]), .cin(cin));
    full_adder_four_bit u1(.sum(sum[7:4]), .carry(carry1), .inp0(inp0[7:4]), .inp1(inp1[7:4]), .cin(carry0));
    full_adder_four_bit u2(.sum(sum[11:8]), .carry(carry2), .inp0(inp0[11:8]), .inp1(inp1[11:8]), .cin(carry1));
    full_adder_four_bit u3(.sum(sum[15:12]), .carry(carry), .inp0(inp0[15:12]), .inp1(inp1[15:12]), .cin(carry2));
    
endmodule
