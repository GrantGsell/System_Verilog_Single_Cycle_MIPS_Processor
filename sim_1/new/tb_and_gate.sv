`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Grant Gsell
// 
// Create Date: 12/13/2019 01:56:49 PM
// Module Name: tb_and_gate
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_and_gate();
//Two Dimensional Vectors
    logic [1:0] test_vector [0:3];
    logic [0:0] answer_vector [0:3];
    
    //Two Dimensional Test Vector Instantiations
    assign test_vector[0] = {1'b0,1'b0};
    assign test_vector[1] = {1'b0,1'b1};
    assign test_vector[2] = {1'b1,1'b0};
    assign test_vector[3] = {1'b1,1'b1};
    
    //Two Dimensional Answer Vector Instantiations
    assign answer_vector[0] = 1'b0;
    assign answer_vector[1] = 1'b0;
    assign answer_vector[2] = 1'b0;
    assign answer_vector[3] = 1'b1;
    
    //I/O Variable Delcarations
    logic [1:0] dataIn;
    logic [0:0] dataOut;     
    
    //Variables for error check and iteration
    integer i, errCount=0;
    
    //Instantiation for module being tested
    and_gate u0(.andOut(dataOut), .inpBranch(dataIn[0]), .inpZero(dataIn[1]));
    
    //Testbench
    initial begin
        for(i=0; i<4; i++) begin
            dataIn = test_vector[i];
            #10; //5 ns delay for inputs/outputs to settle
            if(dataOut != answer_vector[i]) errCount++;
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
