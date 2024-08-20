`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2024 11:53:10
// Design Name: 
// Module Name: printer_movement
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


module printer_movement #(
parameter pWIDTH = 20)(
    input logic clk,
    input logic rst,
    input logic x_dir,
    input logic x_step,
    input logic y_dir,
    input logic y_step,
    input logic z_dir,
    input logic z_step,
    output logic x_direction,
    output logic x_pulse,
    output logic y_direction,
    output logic y_pulse,
    output logic z_direction,
    output logic z_pulse
);

logic [pWIDTH-1:0] High_Count_Signal = 40000;
logic [pWIDTH-1:0] Full_Count_Signal = 80000;
logic [pWIDTH-1:0] x_counter = 0;
logic [pWIDTH-1:0] y_counter = 0;
logic [pWIDTH-1:0] z_counter = 0;

always_ff @(posedge clk) begin
    if(rst) begin
        x_counter <= 0;
        y_counter <= 0;
        z_counter <= 0;
        x_direction <= 0;
        x_pulse <= 0;
        y_direction <= 0;
        y_pulse <= 0;
        z_direction <= 0;
        z_pulse <= 0;
    end else begin
        if(x_step) begin
            x_direction <= x_dir;
            x_counter <= x_counter + 1;
            y_counter <= 0;
            z_counter <= 0;
            
            if(x_counter < High_Count_Signal) begin
                x_pulse <= 1;
            end else if(x_counter >= High_Count_Signal && x_counter < Full_Count_Signal) begin
                x_pulse <= 0;
            end else begin
                x_pulse <= 1;
                x_counter <= 0;
            end
        end else if(y_step) begin
            y_direction <= y_dir;
            y_counter <= y_counter + 1;
            x_counter <= 0;
            z_counter <= 0;
            
            if(y_counter < High_Count_Signal) begin
                y_pulse <= 1;
            end else if(y_counter >= High_Count_Signal && y_counter < Full_Count_Signal) begin
                y_pulse <= 0;
            end else begin
                y_pulse <= 1;
                y_counter <= 0;
            end
        end else if(z_step) begin
            z_direction <= z_dir;
            z_counter <= z_counter + 1;
            x_counter <= 0;
            y_counter <= 0;
            
            if(z_counter < High_Count_Signal) begin
                z_pulse <= 1;
            end else if(z_counter >= High_Count_Signal && z_counter < Full_Count_Signal) begin
                z_pulse <= 0;
            end else begin
                z_pulse <= 1;
                z_counter <= 0;
            end
        end else begin
            x_counter <= 0;
            y_counter <= 0;
            z_counter <= 0;
            x_direction <= 0;
            x_pulse <= 0;
            y_direction <= 0;
            y_pulse <= 0;
            z_direction <= 0;
            z_pulse <= 0;
        end
    
    
    
    
//        counter <= counter + 1;
//        x_direction <= 1;
        
//        if(counter < High_Count_Signal) begin
//            x_pulse <= 1;
//        end else if(counter >= High_Count_Signal && counter < Full_Count_Signal) begin
//            x_pulse <= 0;
//        end else begin
//            x_pulse <= 1;
//            counter <= 0;
//        end
    end
    
end


endmodule



//logic [pWIDTH-1:0] x_count;
//logic [pWIDTH-1:0] y_count;
//logic [pWIDTH-1:0] z_count;
//logic [pWIDTH-1:0] freq_div = 100000;


//always_ff @(posedge clk) begin
//    if(rst) begin
//        x_direction <= 0;
//        x_pulse <= 0;
//        y_direction <= 0;
//        y_pulse <= 0;
//        z_direction <= 0;
//        z_pulse <= 0;
//    end else begin
//        if(x_step) begin
//            x_direction <= x_dir;
//            if(x_count < freq_div / 2 - 1) begin
//                x_count <= x_count + 1;
//            end else begin
//                x_count <= 0;
//                x_pulse <= ~x_pulse;
//            end
//        end
//        if(y_step) begin
//            y_direction <= y_dir;
//            if(y_count < freq_div / 2 - 1) begin
//                y_count <= y_count + 1;
//            end else begin
//                y_count <= 0;
//                y_pulse <= ~y_pulse;
//            end
//        end
//        if(z_step) begin
//            z_direction <= z_dir;
//            if(z_count < freq_div / 2 - 1) begin
//                z_count <= z_count + 1;
//            end else begin
//                z_count <= 0;
//                z_pulse <= ~z_pulse;
//            end
//        end
        
//    end
//end