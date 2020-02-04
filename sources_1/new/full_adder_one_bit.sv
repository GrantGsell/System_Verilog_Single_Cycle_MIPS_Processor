`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 10/28/2019 12:55:13 PM
// Module Name: full_adder
// Project Name: CPU_Design 
//////////////////////////////////////////////////////////////////////////////////

module full_adder_one_bit(
    output logic sum,
    output logic carry,
    input logic inp0,
    input logic inp1,
    input logic cin
    );
    //Internal Wire Instantiations
    logic sumToSecond, carryToXor0,carryToXor1;
    
    //Half Adder Module Instantiations
    half_adder u0(.sum(sumToSecond), .carry(carryToXor0),.inp1(inp0), .inp2(inp1));
    half_adder u1(.sum(sum), .carry(carryToXor1), .inp1(sumToSecond), .inp2(cin));
    
    //Carry bit output
    assign carry = carryToXor0 | carryToXor1;
    
endmodule
