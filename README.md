**<span class="underline">Single Cycle MIPS Processor in
SystemVerilog:</span>**

**Project Description:**

This project contains the module files and test bench files for a single
cycle MIPS processor, that is written in the SystemVerilog HDL. This
processor is based on the block diagram seen below from *‘Computer
Organization And Design 5th Edition’* by *David A. Patterson* and *John
L. Hennessy*. This project contains the modules for each of the blocks
in the block diagram in *Figure 1*. It is important to note that some of
the modules have been parameterized. Additionally, each of the modules
has an associated testbench file. Some of these testbenches are
exhaustive while others are not due to simulation constraints.

This processor is designed to handle the twelve MIPS instructions listed
below

R-Type: add, sub, div, mult, and, or, xor

I-Type: lw, sw, bew, addi

J-Type: j

![](./media/image1.png)

Figure : Single Cycle Processor Block Diagram

**Instruction
Set:**

| Instruction Set |      |                |                |                |                |               |              |
| --------------- | ---- | -------------- | -------------- | -------------- | -------------- | ------------- | ------------ |
| Name            | Type | Bits \[31:26\] | Bits \[25:21\] | Bits \[20:16\] | Bits \[15:11\] | Bits \[10:6\] | Bits \[5:0\] |
| Add             | R    | 0000 00        | ss sss         | t tttt         | dddd d         | 000 00        | 10 0000      |
| Sub             | R    | 0000 00        | ss sss         | t tttt         | dddd d         | 000 00        | 10 0010      |
| Div             | R    | 0000 00        | ss sss         | t tttt         | dddd d         | 000 00        | 01 1010      |
| Mult            | R    | 0000 00        | ss sss         | t tttt         | dddd d         | 000 00        | 01 0010      |
| And             | R    | 0000 00        | ss sss         | t tttt         | dddd d         | 000 00        | 10 1000      |
| Or              | R    | 0000 00        | ss sss         | t tttt         | dddd d         | 000 00        | 10 0101      |
| Xor             | R    | 0000 00        | ss sss         | t tttt         | dddd d         | 000 00        | 10 0110      |
| lw              | I    | 1000 11        | ss sss         | t tttt         | iiii i         | iiii ii       | ii iiii      |
| sw              | I    | 1010 11        | ss sss         | t tttt         | iiii i         | iiii ii       | ii iiii      |
| beq             | I    | 0001 00        | ss sss         | t tttt         | iiii i         | iiii ii       | ii iiii      |
| j               | J    | 0000 10        | ii iii         | i iiii         | iiii i         | iiii ii       | ii iiii      |
| addi            | I    | 0010 00        | ss sss         | t tttt         | iiii i         | iiii ii       | ii iiii      |

**Control
Signals:**

| Control Signals |         |         |            |           |          |           |        |      |        |
| --------------- | ------- | ------- | ---------- | --------- | -------- | --------- | ------ | ---- | ------ |
| Instruction     | Reg Dst | ALU Src | Mem to Reg | Reg Write | Mem Read | Mem Write | Branch | Jump | ALU Op |
| R-Type          | 1       | 0       | 0          | 1         | 0        | 0         | 0      | 0    | 00     |
| lw              | 0       | 1       | 1          | 1         | 1        | 0         | 0      | 0    | 11     |
| sw              | 0       | 1       | 0          | 0         | 0        | 1         | 0      | 0    | 11     |
| beq             | 0       | 0       | 0          | 0         | 0        | 0         | 1      | 0    | 01     |
| j               | 0       | 0       | 0          | 0         | 0        | 0         | 0      | 1    | 10     |
| addi            | 0       | 1       | 0          | 1         | 0        | 0         | 0      | 0    | 11     |

**ALU Control Signals:**

| ALU Control Signals |        |          |               |         |
| ------------------- | ------ | -------- | ------------- | ------- |
| Instruction         | ALU Op | Function | ALU Operation | ALU Out |
| add                 | 00     | 10 0000  | R-Type Add    | 000     |
| sub                 | 00     | 10 0010  | R-Type Sub    | 001     |
| mult                | 00     | 01 0010  | R-Type Mult   | 010     |
| div                 | 00     | 01 1010  | R-Type Div    | 011     |
| and                 | 00     | 10 1000  | R-Type And    | 100     |
| or                  | 00     | 10 0101  | R-Type Or     | 101     |
| xor                 | 00     | 10 0110  | R-Type Xor    | 110     |
| lw                  | 11     | xx xxxx  | Add           | 000     |
| sw                  | 11     | xx xxxx  | Add           | 000     |
| beq                 | 01     | xx xxxx  | Sub           | 001     |
| j                   | 10     | xx xxxx  | JUMP          | 100     |
| addi                | 11     | 0010 00  | Addi          | 000     |

**Built With:**

  - Vivado HLX 2019.1

**Authors:**

This project was done by Grant Gsell

**Bibliography:**

Patterson, David A., and John L. Hennessy. *Computer Organization and
Design: The Hardware/Software Interface*. Elsevier/Morgan Kaufmann,
2014.
