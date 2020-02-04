`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Grant Gsell
// 
// Create Date: 12/13/2019 01:27:58 PM
// Module Name: and_gate
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module and_gate(
    output logic andOut,
    input logic inpBranch,
    input logic inpZero
    );
    assign andOut = (inpBranch * inpZero);
endmodule
