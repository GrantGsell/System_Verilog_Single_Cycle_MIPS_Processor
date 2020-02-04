`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell 
// 
// Create Date: 12/06/2019 05:54:17 PM
// Module Name: tb_arithmetic_logic_unit
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_arithmetic_logic_unit();
//Two Dimensional Vectors
        //test vector: 
            //[31:0]  - inpReadData1 (data comes directly from register)
            //[63:32] - inpData2 (data comes from mux)
    logic [66:0] test_vector [0:15];
    logic [31:0] answer_vector [0:15];
    
    //Test Variable Instantiations 
    logic [66:0] dataIn;
    logic [31:0] dataOut;
    
    //Two Dimensional Test Vector Instantiations
    assign test_vector[0] = {3'd0 ,32'd8, 32'd8};       //Test for adder addition
    assign test_vector[1] = {3'd2 ,32'd8, 32'd4};       //Test for multiplier (pos,pos)
    assign test_vector[2] = {3'd2 ,32'd8, -32'd4};      //Test for multiplier (pos,neg)
    assign test_vector[3] = {3'd2 ,-32'd8, 32'd4};      //Test for multiplier (neg,pos)
    assign test_vector[4] = {3'd2 ,-32'd8, -32'd4};     //Test for multiplier (neg, neg)
    assign test_vector[5] = {3'd3 ,32'd8, 32'd4};       //Test for divider (pos,pos)
    assign test_vector[6] = {3'd3 ,32'd8, -32'd4};      //Test for divider (pos,neg)
    assign test_vector[7] = {3'd3 ,-32'd8, 32'd4};      //Test for divider (neg,pos)
    assign test_vector[8] = {3'd3 ,-32'd8, -32'd4};      //Test for divider (neg,neg) 
    assign test_vector[9] = {3'd4 ,32'd8, 32'd4};       //Test for AND
    assign test_vector[10] = {3'd5 ,32'd8, 32'd4};      //Test for OR
    assign test_vector[11] = {3'd6 ,32'd8, 32'd4};      //Test for XOR
    assign test_vector[12] = {3'd1, 32'd12, 32'd11};    //Test for adder subtraction (pos - (pos))
    assign test_vector[13] = {3'd1, 32'd12, -32'd12};   //Test for adder subtraction (pos - (neg))
    assign test_vector[14] = {3'd1, -32'd10, 32'd11};   //Test for adder subtraction (neg - (pos))
    assign test_vector[15] = {3'd1, -32'd12, -32'd12};  //Test for adder subtraction (neg - (neg))
    
    //Two Dimensional Answer Vector Instantiations
    assign answer_vector[0] = 32'd16;                   //Result adder addition
    assign answer_vector[1] = 32'd32;                   //Result multiplier (pos,pos)
    assign answer_vector[2] = -32'd32;                  //Result multiplier (pos,neg)
    assign answer_vector[3] = -32'd32;                  //Result multiplier (neg,pos)
    assign answer_vector[4] = 32'd32;                   //Result multiplier (neg,neg)
    assign answer_vector[5] = 32'd2;                    //Result divider (pos,pos)
    assign answer_vector[6] = -32'd2;                   //Result divider (pos,neg)
    assign answer_vector[7] = -32'd2;                   //Result divider (neg,pos)
    assign answer_vector[8] = 32'd2;                    //Result divider (pos,pos)
    assign answer_vector[9] = 32'd0;                    //Result AND
    assign answer_vector[10] = 32'd12;                  //Result OR
    assign answer_vector[11] = 32'd12;                  //Result XOR
    assign answer_vector[12] = 32'd1;                   //Result adder subtraction (pos - (pos))
    assign answer_vector[13] = 32'd24;                  //Result adder subtraction (pos - (neg))
    assign answer_vector[14] = -32'd21;                  //Result adder subtraction (neg - (pos))
    assign answer_vector[15] = 32'd0;                  //Result adder subtraction (neg - (neg))

    //Instantiation of module being tested
    arithmetic_logic_unit u0(.aluResult(dataOut[31:0]), .outZero(), .inpReadData1(dataIn[63:32]), .inpData2(dataIn[31:0]), .aluControl(dataIn[66:64]) );
    
    //Iteration and Error Declarations
    integer i, errCount = 0;
    
    //Testbench 
    initial begin
        for(i=0; i<16; i++) begin
            #10;
            dataIn = test_vector[i];
            #10; //5 ns delay for inputs/outputs to settle
            //Compare the expected output to the actual output
            if(dataOut !== answer_vector[i]) begin
                $display("Mismatch---loop index: %d\n", i);
                $display("\tExpected Output: %b\n", answer_vector[i]);
                $display("\tSimulated Output: %b\n", dataOut);
                errCount = errCount + 1;
            end
            dataIn = 66'd0;
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
