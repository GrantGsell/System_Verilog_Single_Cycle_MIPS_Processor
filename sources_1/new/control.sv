`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Grant Gsell
// 
// Create Date: 11/29/2019 06:14:16 PM
// Module Name: control
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module control(
    output logic regDst,
    output logic aluSrc,
    output logic memToReg,
    output logic regWrite,
    output logic memRead,
    output logic memWrite,
    output logic branch, 
    output logic jump,
    output logic [1:0] aluOp,
    input logic [5:0] instruction
    );
    
    assign regDst = (instruction == 6'b000000) ? 1:0;
    assign jump = (instruction == 6'b000010)? 1:0;
    assign branch = (instruction == 6'b000100) ? 1:0;
    assign memRead = (instruction == 6'b100011) ? 1:0;
    assign memToReg = (instruction == 6'b100011) ? 1:0;
    assign memWrite = (instruction == 6'b101011) ? 1:0;
    assign aluSrc = ((instruction == 6'b100011)||(instruction==6'b101011)|| instruction==6'b001000) ? 1:0;
    assign regWrite = ((instruction == 6'b000000 ) || (instruction==6'b100011)|| instruction==6'b001000) ? 1:0;
    assign aluOp[0] = ((instruction==6'b100011)||(instruction==6'b101011)||(instruction==6'b000100)|| instruction==6'b001000) ? 1:0;
    assign aluOp[1] = ((instruction==6'b100011)||(instruction==6'b101011)|| instruction==6'b001000 || instruction==6'b000010) ? 1:0;
    
endmodule
