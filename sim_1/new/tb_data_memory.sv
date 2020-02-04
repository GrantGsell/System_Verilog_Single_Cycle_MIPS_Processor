`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 11/27/2019 07:23:26 PM 
// Module Name: tb_data_memory
// Project Name: CPU_Design 
//////////////////////////////////////////////////////////////////////////////////
module tb_data_memory();
    //Clock Instantiation
    logic clk;
    
    //Two Dimensional Vectors
        //test vector: 
            //31:0 - write data
            //63:32 - addr_from_alu_result (only bits 7:2 will be used)
            //64 - write_memory
            //65 - read_memory
            //66 - rst
    logic [66:0] test_vector [0:6];
    logic [31:0] answer_vector [0:6];
    
    
    //Two Dimensional Test Vector Instantiations
    assign test_vector[0] = {1'b1, 1'b0, 1'b0, 32'h00000004 ,32'h00000000};
    assign test_vector[1] = {1'b0, 1'b0, 1'b1, 32'h00000004 ,32'h00000088};        
    assign test_vector[2] = {1'b0, 1'b0, 1'b1, 32'h00000001 ,32'h000000FF};         
    assign test_vector[3] = {1'b0, 1'b1, 1'b0, 32'h00000004 ,32'h00000000};
    assign test_vector[4] = {1'b0, 1'b1, 1'b0, 32'h00000001 ,32'h00000000}; 
    assign test_vector[5] = {1'b1, 1'b0, 1'b1, 32'h00000004 ,32'h000000CC};
    assign test_vector[6] = {1'b0, 1'b1, 1'b0, 32'h00000004 ,32'h000000CC};       

    //Two Dimensional Answer Vector Instantiations
    assign answer_vector[0] = 32'h00000000;
    assign answer_vector[1] = 32'h00000000;
    assign answer_vector[2] = 32'h00000000;
    assign answer_vector[3] = 32'h00000088;
    assign answer_vector[4] = 32'h000000FF;
    assign answer_vector[5] = 32'h00000000;
    assign answer_vector[6] = 32'h00000000;
    
    //I/O Variable Delcarations
    logic [66:0] dataIn;
    logic [31:0] dataOut;
    
    //Instantiation of Module to test
    data_memory u0(.read_data(dataOut), .write_data(dataIn[31:0]), .addr_From_Alu_Result(dataIn[63:32]), .write_memory(dataIn[64]), .read_memory(dataIn[65]), .rst(dataIn[66]), .clk(clk) );
    
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
