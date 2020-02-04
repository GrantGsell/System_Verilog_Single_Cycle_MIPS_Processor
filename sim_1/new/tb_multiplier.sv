`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Grant Gsell
// 
// Create Date: 12/05/2019 01:48:54 PM
// Module Name: tb_multiplier
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_multiplier();
    
    //Two Dimensional Vectors
        //test vector: 
            //[31:0]  - operandA (multiplicand)
            //[63:32] - operandB (initial product)
    logic [63:0] test_vector [0:5];
    logic [31:0] answer_vector [0:5];
    
    //Test Variable Instantiations 
    logic [63:0] dataIn;
    logic [31:0] dataOut;
    
    //Two Dimensional Test Vector Instantiations
    assign test_vector[0] = {32'd2, 32'd4};
    assign test_vector[1] = {32'd2, 32'd3};
    assign test_vector[2] = {32'd2, -32'd4};
    assign test_vector[3] = {-32'd2, 32'd3};
    assign test_vector[4] = {-32'd2, -32'd4};
    assign test_vector[5] = {-32'd2, -32'd3};
    
    //Two Dimensional Answer Vector Instantiations
    assign answer_vector[0] = 32'd8;
    assign answer_vector[1] = 32'd6;
    assign answer_vector[2] = -32'd8;
    assign answer_vector[3] = -32'd6;
    assign answer_vector[4] = 32'd8;
    assign answer_vector[5] = 32'd6;
    
    //Instantiation of module being tested
    multiplier u0(.outMult(dataOut), .inpMultB(dataIn[63:32]), .inpMultA(dataIn[31:0]) );
    
    //Iteration and Error Declarations
    integer i, errCount = 0;
    
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
