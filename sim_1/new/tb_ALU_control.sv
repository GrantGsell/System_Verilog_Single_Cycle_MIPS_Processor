`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Grant Gsell
// 
// Create Date: 11/29/2019 07:13:45 PM
// Module Name: tb_ALU_control
// Project Name: CPU_Design
//////////////////////////////////////////////////////////////////////////////////
module tb_ALU_control();
    //Two Dimensional Vectors
    logic [7:0] test_vector [0:9];
    logic [2:0] answer_vector [0:9];
    
    //Two Dimensional Test Vector Instantiations
    assign test_vector[0] = 8'b00100000;        //add
    assign test_vector[1] = 8'b00100010;        //subtract
    assign test_vector[2] = 8'b00010010;        //multiply
    assign test_vector[3] = 8'b00011010;        //divide
    assign test_vector[4] = 8'b00101000;        //and
    assign test_vector[5] = 8'b00100101;        //or
    assign test_vector[6] = 8'b00100110;        //xor
    assign test_vector[7] = 8'b11100011;        //lw
    assign test_vector[8] = 8'b11101011;        //sw
    assign test_vector[9] = 8'b01000100;        //beq

    //Two Dimensional Answer Vector Instantiations
    assign answer_vector[0] = 3'b000;
    assign answer_vector[1] = 3'b001;
    assign answer_vector[2] = 3'b010;
    assign answer_vector[3] = 3'b011;
    assign answer_vector[4] = 3'b100;
    assign answer_vector[5] = 3'b101;
    assign answer_vector[6] = 3'b110;
    assign answer_vector[7] = 3'b000;
    assign answer_vector[8] = 3'b000;
    assign answer_vector[9] = 3'b001;
    
    //I/O Variable Delcarations
    logic [7:0] dataIn;
    logic [2:0] dataOut;     
    
    //Variables for error check and iteration
    integer i, errCount=0;
    
    //Instantiation for module being tested
    ALU_control u0(.alu_control_out(dataOut), .func(dataIn[5:0]), .alu_op(dataIn[7:6]));
    
    //Testbench
    initial begin
        for(i=0; i<10; i++) begin
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
