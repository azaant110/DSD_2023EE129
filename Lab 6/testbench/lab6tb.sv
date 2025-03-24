`timescale 1ns / 1ps

module lab6tb;
    
    logic clk, reset, write;
    logic [3:0] num;
    logic [2:0] sel;
    logic [6:0] segments;
    logic [7:0] anode;
    
   
    lab6 uut ( 
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
        #10 write = 1; num = 4'h5; sel = 3'b000; 
        #10 write = 1; num = 4'hA; sel = 3'b001; 
        #10 write = 1; num = 4'hF; sel = 3'b010; 

        #10 write = 0;
        #10 sel = 3'b000; 
        #10 sel = 3'b001; 
        #10 sel = 3'b010; 
        
        #20 $stop;
    end
    
endmodule
