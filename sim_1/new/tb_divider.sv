`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Grant Gsell
// 
// Create Date: 12/06/2019 01:47:20 PM
// Module Name: tb_divider
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_divider();
     //Two Dimensional Vectors
        //test vector: 
            //[31:0]  - operandA (multiplicand)
            //[63:32] - operandB (initial product)
    logic [63:0] test_vector [0:6];
    logic [31:0] answer_vector [0:6];
    
    //Test Variable Instantiations 
    logic [63:0] dataIn;
    logic [31:0] dataOut;
    
    //Two Dimensional Test Vector Instantiations
    assign test_vector[0] = {32'd8, 32'd4};
    assign test_vector[1] = {32'd6, 32'd2};
    assign test_vector[2] = {32'd4, 32'd2};
    assign test_vector[3] = {-32'd6, 32'd2};
    assign test_vector[4] = {32'd4, -32'd2};
    assign test_vector[5] = {-32'd6, -32'd2};
    assign test_vector[6] = {-32'd4, -32'd2};
    
    //Two Dimensional Answer Vector Instantiations
    assign answer_vector[0] = 32'd2;
    assign answer_vector[1] = 32'd3;
    assign answer_vector[2] = 32'd2;
    assign answer_vector[3] = -32'd3;
    assign answer_vector[4] = -32'd2;
    assign answer_vector[5] = 32'd3;
    assign answer_vector[6] = 32'd2;
    
    //Instantiation of module being tested
    divider u0(.result(dataOut), .divisor(dataIn[31:0]), .dividend(dataIn[63:32]));
    
    //Iteration and Error Declarations
    integer i, errCount = 0;
    
    //Testbench 
    initial begin
        for(i=0; i<7; i++) begin
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
