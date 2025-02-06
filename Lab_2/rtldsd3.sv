module dsd_lab_3 (
    input logic a, 
    input logic b, 
    input logic c, 
    output logic x, 
    output logic y
);
    
    logic not1, or1, nand1, xor2, or2, and1;

    assign not1 = ~c;
    assign or1 = a | b;
    assign nand1 = ~(a & b);
    assign or2 = a | b;
    assign x = or1 ^ not1;
    assign xor2 = nand1 ^ or2;
    assign y = xor2 & or1;

endmodule
