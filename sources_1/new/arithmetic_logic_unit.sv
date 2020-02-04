`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 12/06/2019 05:20:37 PM
// Module Name: arithmetic_logic_unit
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module arithmetic_logic_unit(
    output logic [31:0] aluResult,
    output logic outZero,
    input logic [31:0] inpReadData1,
    input logic [31:0] inpData2,
    input logic [2:0] aluControl
    );
    //Internal wire instantiations
    logic [31:0] outDivide, outAdd, outSub, outMult, outOr, outXor, outAnd, inpData3;
    logic overflow, overflowSub;
    assign inpData3 = ~inpData2 + 1'b1;
    
    //Arithmetic Module Instantiations
    full_adder_thirtytwo_bit u0( .sum(outAdd), .carry(overflow), .inp0(inpReadData1), .inp1(inpData2), .cin(1'b0));
    divider u1(.result(outDivide), .divisor(inpData2), .dividend(inpReadData1));    
    multiplier u2(.outMult(outMult), .inpMultA(inpReadData1), .inpMultB(inpData2));
    or_thirtytwo_bit u3(.result(outOr), .inpA(inpReadData1), .inpB(inpData2));
    xor_thirtytwo_bit u4(.result(outXor), .inpA(inpReadData1), .inpB(inpData2));
    and_thirtytwo_bit u5(.result(outAnd), .inpA(inpReadData1), .inpB(inpData2));
    full_adder_thirtytwo_bit u6( .sum(outSub), .carry(overflowSub), .inp0(inpReadData1), .inp1(inpData3), .cin(1'b0));
    
    always @* begin
        outZero <= 1'b0;
        case(aluControl[2:0])
            3'b000: aluResult <= outAdd;
            3'b001: begin
                aluResult <= outSub;
                if(aluResult==32'd0)outZero <= 1'b1;                
            end
            3'b010: aluResult <= outMult;
            3'b011: aluResult <= outDivide;
            3'b100: aluResult <= outAnd;
            3'b101: aluResult <= outOr;
            3'b110: aluResult <= outXor;
            default: aluResult <= inpReadData1;  
        endcase    
    end
    //assign outZero = aluControl[3];
endmodule
