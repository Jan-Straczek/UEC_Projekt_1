module char_rom(
    input logic clk,
    input logic[7:0] char_xy,
    output logic [6:0] char_code
);

import vga_pkg::*;

reg [0:15][7:0] char_line1 = "Drukarka 3D";
reg [0:15][7:0] char_line2 = "Test";
reg [0:15][7:0] char_line3 = "";
reg [0:15][7:0] char_line4 = "";
reg [0:15][7:0] char_line5 = "";
reg [0:15][7:0] char_line6 = "";
reg [0:15][7:0] char_line7 = "";
reg [0:15][7:0] char_line8 = "";
reg [0:15][7:0] char_line9 = "";
reg [0:15][7:0] char_line10 = "";
reg [0:15][7:0] char_line11 = "";
reg [0:15][7:0] char_line12 = "";
reg [0:15][7:0] char_line13 = "";
reg [0:15][7:0] char_line14 = "";
reg [0:15][7:0] char_line15 = "";
reg [0:15][7:0] char_line16 = "";
reg [0:15][7:0] char_line_sel;

always_comb begin
    case (char_xy[7:4])
        0:char_line_sel = char_line1;
        1:char_line_sel = char_line2;
        2:char_line_sel = char_line3;
        3:char_line_sel = char_line4;
        4:char_line_sel = char_line5;
        5:char_line_sel = char_line6;
        6:char_line_sel = char_line7;
        7:char_line_sel = char_line8;
        8:char_line_sel = char_line9;
        9:char_line_sel = char_line10;
        10:char_line_sel = char_line11;
        11:char_line_sel = char_line12;
        12:char_line_sel = char_line13;
        13:char_line_sel = char_line14;
        14:char_line_sel = char_line15;
        15:char_line_sel = char_line16;
    endcase
end

always_ff @(posedge clk) begin
    char_code <= char_line_sel[char_xy[3:0]][6:0];
end

endmodule