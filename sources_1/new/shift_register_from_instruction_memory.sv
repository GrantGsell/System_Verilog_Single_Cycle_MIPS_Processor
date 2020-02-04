`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 10/28/2019 12:05:09 PM
// Module Name: shift_register_from_instruction_memory
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////


module shift_register_from_instruction_memory(
    output logic [27:0] shiftedOutput,
    input logic [25:0] inpData
    );
    assign shiftedOutput = {inpData[25:0], 2'b00}; 
endmodule
