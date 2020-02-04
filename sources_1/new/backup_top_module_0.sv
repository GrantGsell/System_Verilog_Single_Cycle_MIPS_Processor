`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 12/09/2019 09:58:07 PM
// Module Name: top_CPU_Design
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
/*
module backup_top_module_0(
    output logic [31:0] topPCOut, 
    input logic clk, 
    input logic rst
    );
    //Internal Wire Instantiations
    logic regDst, jump, branch, memRead, memToReg, memWrite, aluSrc, regWrite, zero, andOut;
    logic [1:0] aluOp;
    logic [3:0] aluCtrlToAlu;
    logic [4:0] muxLRegOut;
    logic [31:0] pcOut; 
    logic [27:0] upperLShift2Out;
    logic [31:0] instrMemOut, regData1Out, regData2Out, signExtendOut, lowerRShift2Out, dataMemReadOut;
    logic [31:0] muxTopR1Out, muxTopR2Out, muxLAluOut, muxRDataMem;
    logic [31:0] aluResultOut, pcAdderOut, jbrAdderOut;
    
//Module Instantiations
 //CPU control Modules
    program_counter u0(.outPC(pcOut), .inpPC(muxTopR2Out), .rst(rst), .clk(clk));
    instruction_memory u1(.instruction(instrMemOut), .read_Addr_From_PC(pcOut), .rst(rst));
    register_files u2(.read_Data_One(regData1Out), .read_Data_Two(regData2Out), .write_Data(muxRDataMem), .read_Reg_One_Addr(instrMemOut[25:21]), .read_Reg_Two_Addr(instrMemOut[20:16]), .write_Addr(muxLRegOut), .write_Ena(regWrite), .rst(rst), .clk(clk));
    data_memory u3(.read_data(dataMemReadOut), .write_data(regData2Out), .addr_From_Alu_Result(aluResultOut), .write_memory(memWrite), .read_memory(memRead), .clk(clk), .rst(rst));
    control u4(.regDst(regDst), .aluSrc(aluSrc), .memToReg(memToReg), .regWrite(regWrite), .memRead(memRead), .memWrite(memWrite), .branch(branch), .jump(jump), .aluOp(aluOp), .instruction(instrMemOut[31:26]));
    ALU_control u5(.alu_control_out(aluCtrlToAlu), .func(instrMemOut[5:0]), .alu_op(aluOp));
 //Bit Manipulation Modules
    sign_extension u8(.sign_Extended_Out(signExtendOut), .inp_Instruction(instrMemOut[15:0]));
    shift_register_from_instruction_memory u6(.shiftedOutput(upperLShift2Out), .inpData(instrMemOut[25:0]), .clk(clk));                         
    shift_register_from_sign_extension u9(.shiftData(lowerRShift2Out), .inpData(signExtendOut), .clk(clk));
 //Multiplexors
    //Mux feeding data into Write Register for Register Module
    mux_2x1 #(.BIT_SIZE(5))u7(.dataOut(muxLRegOut), .dataA(instrMemOut[20:16]), .dataB(instrMemOut[15:11]), .dataSel(regDst));     
    //Mux Feeding Data to Full ALU             
    mux_2x1 #(.BIT_SIZE(32)) u10(.dataOut(muxLAluOut), .dataA(regData2Out), .dataB(signExtendOut), .dataSel(aluSrc));     
    //Data Memory Mux
    mux_2x1 #(.BIT_SIZE(32)) u11(.dataOut(muxRDataMem), .dataA(aluResultOut), .dataB(dataMemReadOut), .dataSel(memToReg));                                                                     
    //Top right 1st Mux
    mux_2x1 #(.BIT_SIZE(32)) u12(.dataOut(muxTopR1Out), .dataA(pcAdderOut), .dataB(jbrAdderOut), .dataSel(andOut));                                                                                           
    //Top right 2nd Mux
    mux_2x1 #(.BIT_SIZE(32)) u13(.dataOut(muxTopR2Out), .dataA(muxTopR1Out), .dataB({pcAdderOut[31:28],upperLShift2Out}), .dataSel(jump));
 //Adders   
    //Full Adder
    arithmetic_logic_unit u14(.aluResult(aluResultOut), .outZero(zero), .inpReadData1(regData1Out), .inpData2(muxLAluOut), .aluControl(aluCtrlToAlu));
    //Top Left Adder
    arithmetic_logic_unit u15(.aluResult(pcAdderOut), .inpReadData1(pcOut), .inpData2(32'd4), .aluControl(3'd0));
    //Top Right Adder
    arithmetic_logic_unit u16(.aluResult(jbrAdderOut), .inpReadData1(pcAdderOut), .inpData2(lowerRShift2Out), .aluControl(3'b000)); 
 //And Gate
    and_gate u17(.andOut(andOut), .inpBranch(branch), .inpZero(zero));                                                                                           
 
 //Top Module Output
 always @* begin
    topPCOut = pcOut;
 end
endmodule
*/