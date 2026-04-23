    .text
    .globl _start

_start:
    # 0001, 0001, 0002, 0003, 0005, 0008, 000D, 0015, 0015

    addi x12, x0, 7       # loop count = 7
    addi x5,  x0, 0       # t0 = 0
    addi x6,  x0, 1       # t1 = 1
    addi x11, x6, 0       # show initial 1

loop:
    beq  x12, x0, done    # if count == 0, exit loop
    add  x7,  x6, x5      # t2 = t1 + t0
    add  x5,  x6, x0      # t0 = t1
    add  x6,  x7, x0      # t1 = t2
    addi x11, x6, 0       # update display with current Fibonacci value
    addi x12, x12, -1     # count--
    jal  x0, loop         # unconditional jump

done:
    sw   x6, 0(x0)        # optional final store
halt:
    beq  x0, x0, halt     # trap forever
