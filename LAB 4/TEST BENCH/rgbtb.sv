`timescale 1ns / 1ps

module rgb_tb;
  logic [1:0] a, b;
  logic red, green, blue;

  rgb uut (
    .a(a),
    .b(b),
    .red(red),
    .green(green),
    .blue(blue)
  );

  task driver(input logic [1:0] ta, input logic [1:0] tb);
    begin
      a = ta;
      b = tb;
      #10;
      $display("Time: %0t | a = %b, b = %b | red = %b, green = %b, blue = %b", 
               $time, a, b, red, green, blue);
    end
  endtask

  task direct_test();
    begin
      driver(2'b00, 2'b00);
      driver(2'b00, 2'b01);
      driver(2'b00, 2'b10);
      driver(2'b00, 2'b11);
      driver(2'b01, 2'b00);
      driver(2'b01, 2'b01);
      driver(2'b01, 2'b10);
      driver(2'b01, 2'b11);
      driver(2'b10, 2'b00);
      driver(2'b10, 2'b01);
      driver(2'b10, 2'b10);
      driver(2'b10, 2'b11);
      driver(2'b11, 2'b00);
      driver(2'b11, 2'b01);
      driver(2'b11, 2'b10);
      driver(2'b11, 2'b11);
    end
  endtask

  task monitor();
    begin
      $monitor("Time: %0t | a = %b, b = %b | red = %b, green = %b, blue = %b", 
               $time, a, b, red, green, blue);
    end
  endtask

  initial begin
    $display("Starting Testbench...");
    monitor();
    direct_test();
    $finish;
  end
endmodule
