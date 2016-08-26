// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

// Start with 0 in SP
    @SP
    M=0

(LISTEN)
    @KBD
    D=M
    @DARKEN
    D;JNE
    @WHITEN
    D;JEQ

(DARKEN)
    @SP
    D=M // Load R0 into D
    @SCREEN // Put screen address in A
    A=A+D // new address is screen + offset
    M=-1 // turn that pixel black

    @24575
    D=A-D
    @LISTEN
    D;JEQ // Jump to LISTEN if D==24575 (end of screen)

    @SP
    M=M+1 // Increment counter
    @LISTEN
    0;JMP

(WHITEN)
    @SP
    D=M // Load R0 into D
    @SCREEN // Put screen address in A
    A=A+D // new address is screen + offset
    M=0 // turn that pixel black

    @SP
    D=M
    @LISTEN
    D;JEQ // Jump to LISTEN if D==0 (beginning of screen)

    @SP
    M=M-1 // Increment counter
    @LISTEN
    0;JMP

