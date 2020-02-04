`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 12/01/2019 09:43:15 PM
// Module Name: tb_program_counter
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_program_counter();
    //Clock Instantiation
    logic clk;
    
    //Two Dimensional Vectors
        //test vector: 
            //[6:0]  - inpPC
            //[7]    - rst
    logic [7:0] test_vector [0:3];
    logic [6:0] answer_vector [0:3];
    
    //Two Dimensional Test Vector Instantiations
    assign test_vector[0] = {1'b1, 7'b0000100};
    assign test_vector[1] = {1'b0, 7'b0000100};
    assign test_vector[2] = {1'b0, 7'b0001000};
    assign test_vector[3] = {1'b0, 7'b0001100};
    
    //Two Dimensional Answer Vector Instantiations
    assign answer_vector[0] = 7'b0000000;
    assign answer_vector[1] = 7'b0000100;
    assign answer_vector[2] = 7'b0001000;
    assign answer_vector[3] = 7'b0001100;
    
    //I/O Variable Delcarations
    logic [7:0] dataIn;
    logic [6:0] dataOut;
    
    //Instantiation of Module to test
    program_counter u0(.outPC(dataOut), .inpPC(dataIn[6:0]), .rst(dataIn[7]), .clk(clk) );
    
    //Iteration and Error Declarations
    integer i, errCount = 0;
    
    //Clock Generation
    always begin
        clk = 1'b1;
        #5;
        clk = 1'b0;
        #5;
    end 
    
    //Testbench
    initial begin
        for(i=0; i<4; i++) begin
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