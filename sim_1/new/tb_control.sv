`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Grant Gsell
// 
// Create Date: 11/29/2019 07:44:13 PM
// Module Name: tb_control
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_control();
    //Two Dimensional Vectors
    logic [5:0] test_vector [0:5];
    logic [9:0] answer_vector [0:5];
    
    //Two Dimensional Test Vector Instantiations
    assign test_vector[0] = 6'b000000;        //R-rtpe
    assign test_vector[1] = 6'b100011;        //lw
    assign test_vector[2] = 6'b101011;        //sw
    assign test_vector[3] = 6'b000100;        //beq
    assign test_vector[4] = 6'b000010;        //jump
    assign test_vector[5] = 6'b001000;        //addi

    //Two Dimensional Answer Vector Instantiations
    assign answer_vector[0] = 10'b1001000000; //R-Type
    assign answer_vector[1] = 10'b0111100011; //lw
    assign answer_vector[2] = 10'b0100010011; //sw
    assign answer_vector[3] = 10'b0000001001; //beq
    assign answer_vector[4] = 10'b0000000110; //jump
    assign answer_vector[5] = 10'b0101000011; //addi
    
    //I/O Variable Delcarations
    logic [5:0] dataIn;
    logic [9:0] dataOut; 
    
    //Variables for error check and iteration
    integer i, errCount=0;
    
    //Instantiation for module to test
    control u0(.instruction(dataIn), .regDst(dataOut[9]),.aluSrc(dataOut[8]), .memToReg(dataOut[7]), .regWrite(dataOut[6]), .memRead(dataOut[5]), .memWrite(dataOut[4]), .branch(dataOut[3]), .jump(dataOut[2]),  .aluOp(dataOut[1:0]));
    
    //Testbench
    initial begin
        for(i=0; i<6; i++) begin
            dataIn = test_vector[i];
            #10; //5 ns delay for inputs/outputs to settle
            //Compare the expected output to the actual output
            if(dataOut !== answer_vector[i]) begin
                $display("Mismatch---loop index: %d\n", i);
                $display("\tExpected Output: %b\n", answer_vector[i]);
                $display("\tSimulated Output: %b\n", dataOut);
                errCount = errCount + 1;
            end;
        end
        
        //Test Bench Results
        if (errCount == 0) begin
			$display("Simulation complete - no mismatches!!!\n");
		end else begin
			$display("Simulation complete - %d mismatches!!!\n", errCount);
		end
        $finish;
    end
endmodule
