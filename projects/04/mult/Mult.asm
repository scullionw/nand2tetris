// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@sum
M=0 // sum = 0

@i
M=0 // i = 0

(LOOP)
@i
D=M
@R1
D=D-M //D = i-R1
@FINAL
D;JEQ // if i = R1, goto FINAL

@sum
D=M // D=sum
@R0
D = D + M // sum = sum + r0
@sum
M=D
@i
M=M+1

@LOOP
0;JMP

(FINAL)
@sum
D=M
@R2
M=D
@END
0;JMP

(END)
@END
0;JMP