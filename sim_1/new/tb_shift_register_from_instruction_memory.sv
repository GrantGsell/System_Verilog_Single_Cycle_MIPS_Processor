`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 11/24/2019 10:32:50 PM
// Module Name: tb_shift_register_from_instruction_memory
// Project Name:CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_shift_register_from_instruction_memory();
    //Two Dimensional Vectors
    logic [25:0] test_vector [0:3];
    logic [27:0] answer_vector [0:3];
    
    //Two Dimensional Test Vector Instantiations
    assign test_vector[0] = 26'h0000000;
    assign test_vector[1] = 26'h0000003;
    assign test_vector[2] = 26'h3ffffff;
    assign test_vector[3] = 26'hfffffff;
    
    //Two Dimensional Answer Vector Instantiations
    assign answer_vector[0] = 28'h0000000;
    assign answer_vector[1] = 28'h000000c;
    assign answer_vector[2] = 28'hffffffc;
    assign answer_vector[3] = 28'hffffffc;  
    
    //I/O Variable Delcarations
    logic [25:0] dataIn;
    logic [27:0] dataOut;     
    
    //Variables for error check and iteration
    integer i, errCount=0;
    
    //Instantiation of module to test
    shift_register_from_instruction_memory u0(.shiftedOutput(dataOut), .inpData(dataIn));
	
    //Test Bench
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
