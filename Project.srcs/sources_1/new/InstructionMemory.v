module InstructionMemory (
    input [31:0] address,
    output [31:0] instruction
);
    reg [31:0] mem [0:255];
    initial begin
        // Fibonacci display program.
        // Output sequence: 0001, 0001, 0002, 0003, 0005, 0008, 000D, 0015, 0015.

        // mem[0]: addi x12, x0, 7      ; loop count = 7
        mem[0]  = 32'h00700613;

        // mem[1]: addi x5, x0, 0       ; t0 = 0
        mem[1]  = 32'h00000293;

        // mem[2]: addi x6, x0, 1       ; t1 = 1
        mem[2]  = 32'h00100313;

        // mem[3]: addi x11, x6, 0      ; show initial 1 on LEDs
        mem[3]  = 32'h00030593;

        // loop:
        // mem[4]: beq x12, x0, 28      ; if count == 0, jump to done (mem[11])
        mem[4]  = 32'h00060E63;

        // mem[5]: add x7, x6, x5       ; t2 = t1 + t0
        mem[5]  = 32'h005303B3;

        // mem[6]: add x5, x6, x0       ; t0 = t1
        mem[6]  = 32'h000302B3;

        // mem[7]: add x6, x7, x0       ; t1 = t2
        mem[7]  = 32'h00038333;

        // mem[8]: addi x11, x6, 0      ; show current Fibonacci value
        mem[8]  = 32'h00030593;

        // mem[9]: addi x12, x12, -1    ; count--
        mem[9]  = 32'hFFF60613;

        // mem[10]: jal x0, -24         ; jump back to mem[4]
        mem[10] = 32'hFE9FF06F;

        // done:
        // mem[11]: sw x6, 0(x0)        ; optional final store
        mem[11] = 32'h00602023;

        // mem[12]: beq x0, x0, 0       ; halt/trap forever
        mem[12] = 32'h00000063;
    end
    
    assign instruction = mem[address[9:2]];

endmodule
