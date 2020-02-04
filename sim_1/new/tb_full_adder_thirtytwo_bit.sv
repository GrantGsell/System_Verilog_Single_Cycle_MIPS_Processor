`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell 
// 
// Create Date: 12/06/2019 04:37:51 PM
// Module Name: tb_full_adder_thirtytwo_bit
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_full_adder_thirtytwo_bit();
    //test vector: 
            //[31:0]  - inp0
            //[63:32] - inp1
            //[64]    - carryIn
    logic [63:0] test_vector [0:6];
            //[31:0]  - sum
            //[32]    - carryOut
    logic [32:0] answer_vector [0:6];
    
    //Two Dimensional Test Vector Instantiations
    assign test_vector[0] = {1'b0, 32'd2, 32'd2};
    assign test_vector[1] = {1'b0, 32'd2, 32'd3};
    assign test_vector[2] = {1'b0, -32'd2, 32'd2};
    assign test_vector[3] = {1'b0, -32'd2, 32'd3};
    assign test_vector[4] = {1'b0, -32'd2, -32'd2};
    assign test_vector[5] = {1'b0, -32'd2, -32'd3};
    assign test_vector[6] = {1'b0, 32'd4, 32'd8};
    
    //Two Dimensional Answer Vector Instantiations
    assign answer_vector[0] = {1'b0, 32'd4};
    assign answer_vector[1] = {1'b0, 32'd5};
    assign answer_vector[2] = {1'b1, 32'd0};
    assign answer_vector[3] = {1'b1, 32'd1};
    assign answer_vector[4] = {1'b1, -32'd4};
    assign answer_vector[5] = {1'b1, -32'd5};
    assign answer_vector[6] = {1'b0, 32'd12};
    
    //Test Variable Instantiations 
    logic [64:0] dataIn;
    logic [32:0] dataOut;
    
    //Index Variable and count mismatches
    integer i;
    integer errCount;
    
    //Module Instantiation that will be tested
    full_adder_thirtytwo_bit u0(.sum(dataOut[31:0]), .carry(dataOut[32]), .inp0(dataIn[31:0]), .inp1(dataIn[63:32]), .cin(dataIn[64]));
    
    //Looping Test Bench
    initial begin
        //Variable Initalizations
        errCount = 0;
     
        //Loop for testing
        for(i=0; i<7; i=i+1) begin
            //Test vector input
            dataIn = test_vector[i];
            //Add a delay to ensure the inputs are obtained
            #1;
            //Compare the expected output to the actual output
            if(answer_vector[i] !== dataOut) begin
                $display("Mismatch---loop index: %d\n", i);
                $display("\tExpected Output: %b_%b\n", answer_vector[i][32], answer_vector[i][31:0]);
                $display("\tSimulated Output: %b_%b\n",dataOut[32],dataOut[31:0]);
                errCount = errCount + 1;
            end
        end
        if (errCount == 0) begin
			$display("Simulation complete - no mismatches!!!");
		end else begin
			$display("Simulation complete - %d mismatches!!!", errCount);
		end
		$finish;
    end 


endmodule
