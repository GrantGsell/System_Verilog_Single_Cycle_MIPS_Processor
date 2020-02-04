`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Grant Gsell
// 
// Create Date: 11/20/2019 03:21:38 PM
// Module Name: sign_extension
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module sign_extension(
    output [31:0] sign_Extended_Out,
    input [15:0] inp_Instruction
    );
    //Ternary Operator Selection Statement
    assign sign_Extended_Out = (inp_Instruction[15]) ? {16'hFFFF , inp_Instruction} : {16'h0000 , inp_Instruction};
    
endmodule
