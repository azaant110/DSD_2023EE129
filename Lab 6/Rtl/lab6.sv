`timescale 1ns / 1ps

module lab6 (
    input logic clk, reset, write,
    input logic [3:0] num,
    input logic [2:0] sel,
    output logic [6:0] segments,
    output logic [7:0] anode
);

    logic [3:0] memory [7:0]; 
    logic [3:0] current_digit;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) 
                memory[i] <= 4'b0000;
        end
        else if (write) begin
            memory[sel] <= num;
        end
    end

   always_ff @(posedge clk) begin
        if (!write) 
            current_digit <= memory[sel];  
    end
    always_comb begin
        case (current_digit)
            4'h0: segments = 7'b1000000; 
            4'h1: segments = 7'b1111001; 
            4'h2: segments = 7'b0100100; 
            4'h3: segments = 7'b0110000; 
            4'h4: segments = 7'b0011001; 
            4'h5: segments = 7'b0010010; 
            4'h6: segments = 7'b0000010; 
            4'h7: segments = 7'b1111000; 
            4'h8: segments = 7'b0000000; 
            4'h9: segments = 7'b0010000; 
            4'hA: segments = 7'b0001000; 
            4'hB: segments = 7'b0000011; 
            4'hC: segments = 7'b1000110; 
            4'hD: segments = 7'b0100001; 
            4'hE: segments = 7'b0000110; 
            4'hF: segments = 7'b0001110; 
            default: segments = 7'b1111111; 
        endcase
    end

    always_comb begin
        anode = (reset) ? 8'b11111111 : ~(8'b00000001 << sel);  
    end

endmodule

