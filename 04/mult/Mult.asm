// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// Adds R1 to itself R0 times
    @2 // Loads 2 to A register
    M=0 // set R2 to 0
(LOOP)
    @0
    D=M // Load R0 into D
    @END
    D;JEQ // Jump to END if D (R0) == 0
    @1
    D=M
    @2
    M=D+M
    @0
    M=M-1
    @LOOP
    0;JMP
(END) // Infinite loop is standard way to end???
    @END
    0;JMP

