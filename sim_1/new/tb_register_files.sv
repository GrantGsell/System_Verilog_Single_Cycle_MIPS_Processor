`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 11/27/2019 07:24:10 PM
// Module Name: tb_register_files
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_register_files();
     //Clock Instantiation
    logic clk;
    
    //Two Dimensional Vectors
        //test vector: 
            //[31:0]  - write_Data
            //[36:32] - read_Reg_One_Addr
            //[41:37] - read_Reg_Two_Addr
            //[46:42] - write_Addr
            //[47]    - write_Ena
            //[48]    - rst
    logic [48:0] test_vector [0:4];
        //Answer Vector 
            //[31:0]  - read_Data_One
            //[63:32] - read_Data_Two
    logic [63:0] answer_vector [0:4];
    
    //Two Dimensional Test Vector Instantiations
    assign test_vector[0] = {1'b1, 1'b1, 5'b00000, 5'b00000, 5'b00000 ,32'hFFFFFFFF};
    assign test_vector[1] = {1'b0, 1'b1, 5'b00000, 5'b00000, 5'b00011 ,32'hFFFFFFFF};
    assign test_vector[2] = {1'b0, 1'b1, 5'b00011, 5'b00001, 5'b00000 ,32'hFFFFFFFF};
    assign test_vector[3] = {1'b0, 1'b1, 5'b00001, 5'b00011, 5'b00001 ,32'h88888888};
    assign test_vector[4] = {1'b0, 1'b1, 5'b01000, 5'b00001, 5'b00011 ,32'h55555555};
    
    //Two Dimensional Answer Vector Instantiations
    assign answer_vector[0] = {32'h00000000, 32'h00000000};
    assign answer_vector[1] = {32'h00000000, 32'h00000000};
    assign answer_vector[2] = {32'h00000000, 32'h00000000};
    assign answer_vector[3] = {32'hFFFFFFFF, 32'h88888888};
    assign answer_vector[4] = {32'h88888888, 32'hFFFFFFFF};
    
    //I/O Variable Delcarations
    logic [48:0] dataIn;
    logic [63:0] dataOut;
    
    //Instantiation of Module to test
    register_files u0(.read_Data_One(dataOut[31:0]), .read_Data_Two(dataOut[63:32]), .write_Data(dataIn[31:0]), .read_Reg_One_Addr(dataIn[36:32]), .read_Reg_Two_Addr(dataIn[41:37]), .write_Addr(dataIn[46:42]), .write_Ena(dataIn[47]), .rst(dataIn[48]), .clk(clk) );
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
        for(i=0; i<5; i++) begin
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
