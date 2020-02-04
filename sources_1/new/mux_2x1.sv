`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Grant Gsell
// 
// Create Date: 10/24/2019 
// Module Name: mux_2x1
// Project Name: CPU_Design 
//////////////////////////////////////////////////////////////////////////////////
module mux_2x1 #(parameter BIT_SIZE=32)(
    output logic [BIT_SIZE-1:0] dataOut,
    input logic [BIT_SIZE-1:0] dataA,
    input logic [BIT_SIZE-1:0] dataB,
    input logic dataSel
    );
    
    //Ternary Operator Selection Statement
    assign dataOut = (dataSel) ? dataB : dataA;
    
endmodule