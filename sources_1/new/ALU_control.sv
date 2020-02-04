`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell 
// 
// Create Date: 11/27/2019 06:53:07 PM
// Module Name: ALU_control
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module ALU_control(
    output logic [2:0] alu_control_out,
    input logic [5:0] func,
    input logic [1:0] alu_op
    );
    //Ternary assign statments for Output Signal to ALU
    assign alu_control_out[0] = ((alu_op==2'b00 && func===6'b100010)||(alu_op==2'b00 && func===6'b011010)||(alu_op==2'b00 && func===6'b100101)||(alu_op===2'b01)) ? 1'b1:1'b0;
    assign alu_control_out[1] = ((alu_op==2'b00 && func===6'b010010)||(alu_op==2'b00 && func===6'b011010)||(alu_op==2'b00 && func===6'b100110)) ? 1'b1:1'b0;
    assign alu_control_out[2] = ((alu_op==2'b00 && func===6'b101000)||(alu_op===2'b00 && func===6'b100101)||(alu_op===2'b00 && func===6'b100110)||(alu_op===2'b10)) ? 1'b1:1'b0;
endmodule