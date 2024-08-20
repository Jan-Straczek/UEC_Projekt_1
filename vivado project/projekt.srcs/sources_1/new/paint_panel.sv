`timescale 1ns / 1ps

module paint_panel(
    input logic clk,
    input logic rst,
    input logic [11:0] xpos,
    input logic [11:0] ypos,
    input logic mouse_left,
    vga_if.in vga_in,
    vga_if.out vga_out
);

import vga_pkg::*;
 
logic [11:0] rgb_nxt;
logic [1:0] posx_mem [PANEL_WIDTH-1:0];
logic [1:0] posy_mem [PANEL_HEIGHT-1:0];
logic pos_mem[PANEL_WIDTH-1:0][PANEL_HEIGHT-1:0];


always_ff @(posedge clk) begin
    if (rst) begin
        vga_out.vcount <= '0;
        vga_out.vsync  <= '0;
        vga_out.vblnk  <= '0;
        vga_out.hcount <= '0;
        vga_out.hsync  <= '0;
        vga_out.hblnk  <= '0;
        vga_out.rgb    <= '0;
    end else begin
        vga_out.vcount <= vga_in.vcount;
        vga_out.vsync  <= vga_in.vsync;
        vga_out.vblnk  <= vga_in.vblnk;
        vga_out.hcount <= vga_in.hcount;
        vga_out.hsync  <= vga_in.hsync;
        vga_out.hblnk  <= vga_in.hblnk;
        vga_out.rgb    <= rgb_nxt;
        
        if((xpos >= HOR_PANEL_START) && (xpos <=HOR_PANEL_START + PANEL_WIDTH) && (ypos >= VER_PANEL_START) && (ypos <=VER_PANEL_START + PANEL_HEIGHT) && mouse_left) begin
//            posx_mem[xpos - HOR_PANEL_START] <= 'h1;   
//            posy_mem[ypos - VER_PANEL_START] <= 'h1;
              pos_mem[xpos - HOR_PANEL_START][ypos - VER_PANEL_START] <= 'h1;
        end 
        else begin
            posx_mem[xpos - HOR_PANEL_START] <= 'h0;   
            posy_mem[ypos - VER_PANEL_START] <= 'h0;
        end
    end
end


always_comb begin
    if((vga_in.hcount >= HOR_PANEL_START) && (vga_in.hcount <=HOR_PANEL_START + PANEL_WIDTH) && (vga_in.vcount >= VER_PANEL_START) && (vga_in.vcount <=VER_PANEL_START + PANEL_HEIGHT)) begin  
          rgb_nxt = 12'hf_f_f; 
          if(pos_mem[vga_in.hcount - HOR_PANEL_START][vga_in.vcount - VER_PANEL_START]) begin
            rgb_nxt = 12'h0_0_0; 
          end
//          if(posx_mem[vga_in.hcount - HOR_PANEL_START] && posy_mem[vga_in.vcount - VER_PANEL_START]) begin
//            rgb_nxt = 12'h0_0_0; 
//          end
    end else begin
        rgb_nxt = vga_in.rgb;
    end
end

endmodule



//`timescale 1ns / 1ps

//module paint_panel(
//    input logic clk,
//    input logic rst,
//    input logic [11:0] xpos,
//    input logic [11:0] ypos,
//    input logic mouse_left,
//    vga_if.in vga_in,
//    vga_if.out vga_out
//);

//import vga_pkg::*;

//logic [11:0] rgb_nxt;
//logic [11:0] line_start_x, line_start_y;
//logic drawing_line;

//always_ff @(posedge clk) begin
//    if (rst) begin
//        vga_out.vcount <= '0;
//        vga_out.vsync  <= '0;
//        vga_out.vblnk  <= '0;
//        vga_out.hcount <= '0;
//        vga_out.hsync  <= '0;
//        vga_out.hblnk  <= '0;
//        vga_out.rgb    <= '0;

//        drawing_line <= 0;
//        line_start_x <= '0;
//        line_start_y <= '0;
//    end else begin
//        vga_out.vcount <= vga_in.vcount;
//        vga_out.vsync  <= vga_in.vsync;
//        vga_out.vblnk  <= vga_in.vblnk;
//        vga_out.hcount <= vga_in.hcount;
//        vga_out.hsync  <= vga_in.hsync;
//        vga_out.hblnk  <= vga_in.hblnk;
//        vga_out.rgb    <= rgb_nxt;

//        if (mouse_left) begin
//            if (!drawing_line) begin
//                line_start_x <= xpos;
//                line_start_y <= ypos;
//                drawing_line <= 1;
//            end
//        end else begin
//            drawing_line <= 0;
//        end
//    end
//end

//always_comb begin
//    if((vga_in.hcount >= HOR_PANEL_START) && (vga_in.hcount <= HOR_PANEL_START + PANEL_WIDTH) &&
//       (vga_in.vcount >= VER_PANEL_START) && (vga_in.vcount <= VER_PANEL_START + PANEL_HEIGHT)) begin
//        rgb_nxt = 12'hf_f_f; // Bia³e t³o domyœlnie

//        if (drawing_line) begin
//            // U¿ycie interpolacji do rysowania linii od (line_start_x, line_start_y) do (xpos, ypos)
//            if (vga_in.hcount == line_start_x && vga_in.vcount == line_start_y) begin
//                rgb_nxt = 12'h0_0_0; // Zaczynaj rysowaæ liniê
//            end
//        end
//    end else begin
//        rgb_nxt = vga_in.rgb;
//    end
//end

//endmodule

