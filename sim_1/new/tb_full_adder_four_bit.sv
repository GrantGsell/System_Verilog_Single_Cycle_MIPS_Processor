`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell 
// 
// Create Date: 10/28/2019 05:18:47 PM
// Module Name: tb_full_adder_four_bit
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_full_adder_four_bit();
    //Test Vector Declaration
    logic [3:0] outputC;
    logic [3:0] inputA;
    logic [3:0] inputB;
    logic cin;
    logic carryOut;
    
    //Parameters of test vector
    parameter INP_COLUMNS = 9, INP_ROWS = 512;
    parameter OUT_COLUMNS = 5, OUT_ROWS = 512;
    
    //Two dimensional test vectors
    logic [INP_COLUMNS-1:0] test_vector [0:INP_ROWS-1];
    logic [OUT_COLUMNS-1:0] answer_vector [0:OUT_ROWS-1];
    
    //One dimensional test vectors
    logic [INP_COLUMNS-1:0] single_vector_test;
    logic [OUT_COLUMNS-1:0] single_vector_answer;
    
    //Index Variable and count mismatches
    integer i;
    integer errCount;
    
    //Module Instantiation that will be tested
    full_adder_four_bit uut(.sum(outputC), .carry(carryOut), .inp0(inputA), .inp1(inputB), .cin(cin));
    
    //Looping Test Bench
    initial begin
        //Variable Initalizations
        errCount = 0;
        
        //Read all of the test vectors into the 2D Arrays
        $readmemb("fourBitAdderInput.txt", test_vector);
        $readmemb("fourBitAdderOutput.txt", answer_vector);
        
        //Initalize Module Parameters
        inputA = 0;
        inputB = 0;
        cin = 0;
     
        //Loop for testing
        for(i=0; i<512; i=i+1) begin
            //Set current input and output testing vectors
            single_vector_test = test_vector[i];
            single_vector_answer = answer_vector[i];
      
            //Set stimuli from the vector into the input signals
            inputA = single_vector_test[INP_COLUMNS-6:INP_COLUMNS-9];
            inputB = single_vector_test[INP_COLUMNS-2:INP_COLUMNS-5];
            cin = single_vector_test[INP_COLUMNS-1];
            //Add a delay to ensure the inputs are obtained
            #10;
            
            //Compare the expected output to the actual output
            if({carryOut, outputC} !== single_vector_answer[4:0]) begin
                $display("Mismatch---loop index: %d\n", i);
                $display("\tExpected Output: %b_%b\n", single_vector_answer[4], single_vector_answer[3:0]);
                $display("\tSimulated Output: %b_%b\n", carryOut,outputC);
                errCount = errCount + 1;
            end
        end
        if (errCount == 0) begin
			$display("Simulation complete - no mismatches!!!");
		end else begin
			$display("Simulation complete - %d mismatches!!!", errCount);
		end
    end 
endmodule
