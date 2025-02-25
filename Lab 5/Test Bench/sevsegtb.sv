`timescale 1ns / 10ps

module sevseg_tb;
    reg a, b, c, d, sel0, sel1, sel2;
    wire A, B, C, D, E, F, G, DP;
    wire AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7;

    sevseg uut (
        .a(a), .b(b), .c(c), .d(d), .sel0(sel0), .sel1(sel1), .sel2(sel2),
        .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .DP(DP),
        .AN0(AN0), .AN1(AN1), .AN2(AN2), .AN3(AN3), .AN4(AN4), .AN5(AN5), .AN6(AN6), .AN7(AN7)
    );

    initial begin
      
        for (integer i = 0; i < 16; i = i + 1) begin
            {a, b, c, d} = i;
            {sel0, sel1, sel2} = i % 8; 
            
            #10; 
            
            $display("%4t  | %b %b %b %b | %b %b %b %b %b %b %b | %b  | %b %b %b %b %b %b %b %b", 
                $time, a, b, c, d, A, B, C, D, E, F, G, DP, AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7);
        end

       
        $stop; 
    end
endmodule
