`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 10/28/2019 04:32:47 PM 
// Module Name: tb_full_adder_one_bit
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////


module tb_full_adder_one_bit();
    //Test Vector Instantiations
    logic inp0;
    logic inp1;
    logic inp2;
    logic outSum;
    logic outCarry;
    
    //Variable to check for the number of errors
    integer errCount = 0;
    
    //Module Instantiation
    full_adder_one_bit uut(.sum(outSum),.carry(outCarry), .inp0(inp0),.inp1(inp1), .cin(inp2));
    
    //Test Bench Execution Code
    initial begin
        inp0 = 0; inp1 = 0; inp2 = 0;
        #10;
        if(outSum != 0 && outCarry != 0) errCount++;
        inp0 = 0; inp1 = 0; inp2 = 1;
        #10;
        if(outSum != 1 && outCarry != 0) errCount++;
        inp0 = 0; inp1 = 1; inp2 = 0;
        #10;
        if(outSum != 1 && outCarry != 0) errCount++;
        inp0 = 0; inp1 = 1; inp2 = 1;
        #10;
        if(outSum != 0 && outCarry != 1) errCount++;
        inp0 = 1; inp1 = 0; inp2 = 0;
        #10;
        if(outSum != 1 && outCarry != 0) errCount++;
        inp0 = 1; inp1 = 0; inp2 = 1;
        #10;
        if(outSum != 0 && outCarry != 1) errCount++;
        inp0 = 1; inp1 = 1; inp2 = 0;
        #10;
        if(outSum != 0 && outCarry != 1) errCount++;
        inp0 = 1; inp1 = 1; inp2 = 1;
        #10;
        if(outSum != 1 && outCarry != 1) errCount++;
        
        //Test Bench Results
        if (errCount == 0) begin
			$display("Simulation complete - no mismatches!!!\n");
		end else begin
			$display("Simulation complete - %d mismatches!!!\n", errCount);
		end
        $finish;
    end
endmodule
