`timescale 1ns / 1ps

module alu_tb();
timeunit 1ns;
timeprecision 1ps;

logic clk;
localparam CLK_PERIOD =10;
initial begin
    clk=0;
    forever #(CLK_PERIOD/2) clk <= ~clk;
end

localparam N=8;
logic [2:0] sel;
logic signed [N-1:0] A,B,C;
logic Z;

alu_ip dut(.*);

initial begin
   
    A<=8'd25;
    B<=8'd12;
    sel <= 3'b000; //+
    
    @(posedge clk);
    A<=8'd30;
    B<=8'd26;
    sel <= 3'b001; //-
    
    @(posedge clk);
    A<=8'd35;
    B<=8'd45;
    sel <= 3'b011; // /
    
    @(posedge clk);
    A<=8'd40;
    B<=8'd85;
    sel <= 3'b010; // *
    
    @(posedge clk);
    A<=8'd20;
    B<=8'd13;
    sel <= 3'b100;
    
    @(posedge clk);
    A<=8'd98;
    B<=8'd34;
    sel <= 3'b101;
end
endmodule

