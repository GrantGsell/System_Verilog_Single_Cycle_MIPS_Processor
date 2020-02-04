`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 11/20/2019 05:59:39 PM
// Module Name: tb_sign_extension
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_sign_extension();
    //Vector Declarations
    logic [15:0] dataIn;
    logic [31:0] dataOut;
    //Two dimensional test vectors
    logic [15:0] test_vector [0:3];
    logic [31:0] answer_vector [0:3];
    
    //Test Vector Instantiations
    assign test_vector[0] = 16'h0001;
    assign test_vector[1] = 16'h8000;
    assign test_vector[2] = 16'h0FFF;
    assign test_vector[3] = 16'hFFFF;
    
    //Output Vector assignment
    assign answer_vector[0] = 32'h00000001;
    assign answer_vector[1] = 32'hFFFF8000;
    assign answer_vector[2] = 32'h00000FFF;
    assign answer_vector[3] = 32'hFFFFFFFF;
    
    //Variable for data check and iteration
    integer errCount = 0, i; 
    
    //Instantiation of module to test
    sign_extension u0(.sign_Extended_Out(dataOut), .inp_Instruction(dataIn));
    
    //TestBench 
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
