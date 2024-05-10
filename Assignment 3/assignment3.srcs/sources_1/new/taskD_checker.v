`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2024 14:45:55
// Design Name: 
// Module Name: taskD_checker
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


module taskD_checker(input sw15, clock100,
                     output reg D_active = 0);

    wire c1_out;
    reg [8:0] count = 0;
    
    always @ (posedge clock100) 
    begin
        if (sw15) begin
            count <= (count == 300) ? 300 : count + 1;
        end else begin
            count <= 0;
        end
        
        if (count == 300) begin
            D_active <= 1;
        end else begin
            D_active <= 0;
        end
    end

endmodule
