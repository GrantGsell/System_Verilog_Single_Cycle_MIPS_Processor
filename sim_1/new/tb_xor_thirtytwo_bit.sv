`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 12/06/2019 07:28:28 PM
// Module Name: tb_xor_thirtytwo_bit
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_xor_thirtytwo_bit();
    //Two Dimensional Vectors
    logic [63:0] test_vector [0:2];
    logic [31:0] answer_vector [0:2];
    
    //Two Dimensional Test Vector Instantiations
    assign test_vector[0] = {32'hffffffff, 32'h00000000};
    assign test_vector[1] = {32'hffffffff, 32'h55555555};
    assign test_vector[2] = {32'hffffffff, 32'hffffffff};

    //Two Dimensional Answer Vector Instantiations
    assign answer_vector[0] = 32'hffffffff;
    assign answer_vector[1] = 32'haaaaaaaa;
    assign answer_vector[2] = 32'h00000000;
    
    
    //I/O Variable Delcarations
    logic [63:0] dataIn;
    logic [31:0] dataOut; 
    
    //Variables for error check and iteration
    integer i, errCount=0;
    
    //Instantiation for module to test
    xor_thirtytwo_bit u0(.result(dataOut), .inpA(dataIn[31:0]), .inpB(dataIn[63:32]));
    
    //Testbench
    initial begin
        for(i=0; i<3; i++) begin
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
