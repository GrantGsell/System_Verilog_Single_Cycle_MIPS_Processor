`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 10/28/2019 12:05:09 PM
// Module Name: shift_register_from_sign_extension
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module shift_register_from_sign_extension(
    output logic [31:0] shiftData,
    input logic [31:0] inpData
    );
    assign shiftData = {inpData[29:0], 2'b00};
endmodule