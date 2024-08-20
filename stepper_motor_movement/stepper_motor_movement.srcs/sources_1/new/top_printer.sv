`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2024 11:44:29
// Design Name: 
// Module Name: top_printer
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


module top_printer(
    input wire clk,
    input wire sw0,
    input wire sw1,
    input wire btnU,
    input wire btnD,
    input wire btnL,
    input wire btnR,
    input wire btnC,
    output wire JB1,
    output wire JB2,
    output wire JB3,
    output wire JB4,
    output wire JB5,
    output wire JB6
);

wire x_dir;
wire x_step;
wire y_dir;
wire y_step;
wire z_dir;
wire z_step;


printer_controller u_printer_controller (
    .clk(clk),
    .rst(sw0),
    .sw_up(sw1),
    .btn_up(btnU),
    .btn_down(btnD),
    .btn_left(btnL),
    .btn_right(btnR),
    .btn_center(btnC),
    .x_direction(x_dir),
    .x_stepper(x_step),
    .y_direction(y_dir),
    .y_stepper(y_step),
    .z_direction(z_dir),
    .z_stepper(z_step)
);

printer_movement u_printer_movement (
    .clk(clk),
    .rst(sw0),
    .x_dir(x_dir),
    .x_step(x_step),
    .y_dir(y_dir),
    .y_step(y_step),
    .z_dir(z_dir),
    .z_step(z_step),
    .x_direction(JB1),
    .x_pulse(JB2),
    .y_direction(JB3),
    .y_pulse(JB4),
    .z_direction(JB5),
    .z_pulse(JB6)
);
endmodule
