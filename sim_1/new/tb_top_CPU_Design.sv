`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: Grant Gsell
// 
// Create Date: 12/13/2019 02:43:32 PM
// Module Name: tb_top_CPU_Design
// Project Name: CPU_Design
module tb_top_CPU_Design();
    
    //I/O Variable Delcarations
    logic [0:0] dataIn;
    logic [31:0] dataOut;    
    logic clk; 
    
    //Instantiation for module being tested
    top_CPU_Design uut(.topPCOut(dataOut), .clk(clk), .rst(dataIn));
    
    //Initialization of CPU
    initial begin
        clk = 1'b0;
        dataIn = 1'b1;
        #4 dataIn = 1'b0;
        #6;
    end   
    
    //Clock Generation
    always begin #100 clk =~clk;end

    //Testbench
    always @(posedge clk) begin
        $display("Program Counter = %d", dataOut);
    end
endmodule