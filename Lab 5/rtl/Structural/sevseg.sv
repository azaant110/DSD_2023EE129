`timescale 1ns / 10ps

module sevseg(
    input a, b, c, d, sel0, sel1, sel2,        
    output A, B, C, D, E, F, G, DP, 
    output AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7
);

    assign A = ((~a & ~c) & (b ^ d)) | ((a & d) & (b ^ c));
    assign B = (d & ((~a & b & ~c) | (a & c))) | ((b & ~d) & (c | a));
    assign C = (~a & ~b & c & ~d) | ((a & b) & (~d | c));
    assign D = ((~a & ~c) & (b ^ d)) | (c & ((b & d) | (a & ~b & ~d)));
    assign E = (~a & ((b & ~c) | d)) | (~b & ~c & d);
    assign F = ((~a & ~b) & (d | c)) | (d & ((~a & c) | (a & b & ~c)));
    assign G = (~a & ~b & ~c) | (b & ((~a & c & d) | (a & ~c & ~d)));

    assign DP = 0; 
    assign AN0 = sel0 | sel1 | sel2;
    assign AN1 = sel0 | sel1 | ~sel2;
    assign AN2 = sel0 | ~sel1 | sel2;
    assign AN3 = sel0 | ~sel1 | ~sel2;
    assign AN4 = ~sel0 | sel1 | sel2;
    assign AN5 = ~sel0 | sel1 | ~sel2;
    assign AN6 = ~sel0 | ~sel1 | sel2;
    assign AN7 = ~sel0 | ~sel1 | ~sel2;

endmodule
