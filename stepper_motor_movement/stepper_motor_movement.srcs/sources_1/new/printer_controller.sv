`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2024 11:52:50
// Design Name: 
// Module Name: printer_controller
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


module printer_controller(
    input logic clk,
    input logic rst,
    input logic sw_up,
    input logic btn_up,
    input logic btn_down,
    input logic btn_left,
    input logic btn_right,
    input logic btn_center,
    output logic x_direction,
    output logic x_stepper,
    output logic y_direction,
    output logic y_stepper,
    output logic z_direction,
    output logic z_stepper
);

logic x_dir_nxt = 0;
logic x_step_nxt = 0;
logic y_dir_nxt = 0;
logic y_step_nxt = 0;
logic z_dir_nxt = 0;
logic z_step_nxt = 0;

always_ff @(posedge clk) begin
    if(rst) begin
        x_direction <= '0;
        x_stepper <= '0;
        y_direction <= '0;
        y_stepper <= '0;
        z_direction <= '0;
        z_stepper <= '0;
    end else begin
        x_direction <= x_dir_nxt;
        x_stepper <= x_step_nxt;
        y_direction <= y_dir_nxt;
        y_stepper <= y_step_nxt;
        z_direction <= z_dir_nxt;
        z_stepper <= z_step_nxt;
    end
end

always_comb begin
    if(btn_up) begin
        x_dir_nxt = 1;
        x_step_nxt = 1;
    end else if(btn_down) begin
        x_dir_nxt = 0;
        x_step_nxt = 1;
    end else if(btn_left) begin
        y_dir_nxt = 1;
        y_step_nxt = 1;
    end else if(btn_right) begin
        y_dir_nxt = 0;
        y_step_nxt = 1;
        end else if(btn_center) begin
        z_dir_nxt = 1;
        z_step_nxt = 1;
    end else if(sw_up) begin
        z_dir_nxt = 0;
        z_step_nxt = 1;
    end else begin
        x_dir_nxt = 0;
        x_step_nxt = 0;
        y_dir_nxt = 0;
        y_step_nxt = 0;
        z_dir_nxt = 0;
        z_step_nxt = 0;
    end
end

endmodule
