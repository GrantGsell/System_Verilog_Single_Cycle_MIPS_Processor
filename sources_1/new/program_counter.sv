`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 12/01/2019 09:35:31 PM
// Module Name: program_counter
// Project Name:CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module program_counter(
    output logic [31:0] outPC,
    input logic [31:0] inpPC,
    input logic rst,
    input logic clk
    );
    //Synchronous Logic
    always @(posedge clk or posedge rst) begin
        if(rst) outPC <= 32'b000000;
        else outPC <= inpPC;
    end    
endmodule
