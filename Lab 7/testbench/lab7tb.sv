`timescale 1ns / 1ps

module lab7tb;
    
    logic clk, reset, write;
    logic [3:0] num;
    logic [2:0] sel;
    logic [6:0] segments;
    logic [7:0] anode;
    lab7 uut (
        .clk(clk),
        .reset(reset),
        .write(write),
        .num(num),
        .sel(sel),
        .segments(segments),
        .anode(anode)
    );
    
    always #5 clk = ~clk;  

    initial begin
        clk = 0;
        reset = 1;
        write = 0;
        num = 4'b0000;
        sel = 3'b000;
        
        #10 reset = 0;
        #10 write = 1; num = 4'h3; sel = 3'b000; 
        #5 write = 0;  

        #10 write = 1; num = 4'h6; sel = 3'b001; 
        #5 write = 0;

        #10 write = 1; num = 4'h9; sel = 3'b010; 
        #5 write = 0;

        #10 write = 1; num = 4'hC; sel = 3'b011;  
        #5 write = 0;

        #100;  

        $stop;
    end
    
endmodule
