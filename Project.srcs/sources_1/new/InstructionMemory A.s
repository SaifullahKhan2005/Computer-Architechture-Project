    .text
    .globl main

main:
    addi x11, x0, 10
    addi x11, x11, -1
    bne  x11, x0, -4
    beq  x0, x0, 0