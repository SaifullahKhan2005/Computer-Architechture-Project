module InstructionMemory (
    input [31:0] address,
    output [31:0] instruction
);
    reg [31:0] mem [0:255];
    
    initial begin
        // Task A: Countdown from Hardcoded N (10) to 0, displayed on LEDs via x11
        mem[0]  = 32'h00a58593;   // addi x11, x0, 10       (Set N = 10 in x11 for LED display)
        mem[1]  = 32'hFFF58593;   // addi x11, x11, -1      (Decrement: loop start)
        mem[2]  = 32'hFE059EE3;   // bne  x11, x0, -4       (Loop if not zero)
        mem[3]  = 32'h00000063;   // beq  x0, x0, 0         (Trap: halt at 0)
    end
    
    assign instruction = mem[address[9:2]];

endmodule