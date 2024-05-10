`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 21:19:05
// Design Name: 
// Module Name: test_my_assignment
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_my_assignment();

    // Simulation Inputs
    reg [6:0]sim_A;
    reg [6:0]sim_B;
    reg sim_pb;
    
    // Simulation Outputs
    wire [6:0]sim_S;
    wire [5:0]sim_T;
    wire [3:0]sim_an;
    wire [7:0]sim_seg;
    
    // Instantiation of the module to be simulated
    assignment2 dut(.A(sim_A), .B(sim_B), .pb(sim_pb), .S(sim_S), .T(sim_T), .an(sim_an), .seg(sim_seg));
    
    // Stimuli
    initial begin
        sim_A = 7'b0001111; sim_B = 7'b0000000; sim_pb = 1'b0; #10;
        sim_A = 7'b0001010; sim_B = 7'b0010001; sim_pb = 1'b0; #10;
        sim_A = 7'b0101011; sim_B = 7'b0001101; sim_pb = 1'b0; #10;
        sim_A = 7'b0001111; sim_B = 7'b0000000; sim_pb = 1'b1; #10;
        sim_A = 7'b0001010; sim_B = 7'b0010001; sim_pb = 1'b1; #10;
        sim_A = 7'b0101011; sim_B = 7'b0001101; sim_pb = 1'b1; #10;
    end
endmodule
