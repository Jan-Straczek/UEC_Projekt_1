# Copyright (C) 2023  AGH University of Science and Technology
# MTM UEC2
# Author: Piotr Kaczmarczyk
#
# Description:
# Project detiles required for generate_bitstream.tcl
# Make sure that project_name, top_module and target are correct.
# Provide paths to all the files required for synthesis and implementation.
# Depending on the file type, it should be added in the corresponding section.
# If the project does not use files of some type, leave the corresponding section commented out.

#-----------------------------------------------------#
#                   Project details                   #
#-----------------------------------------------------#
# Project name                                  -- EDIT
set project_name vga_project

# Top module name                               -- EDIT
set top_module top_vga_basys3

# FPGA device
set target xc7a35tcpg236-1

#-----------------------------------------------------#
#                    Design sources                   #
#-----------------------------------------------------#
# Specify .xdc files location                   -- EDIT
set xdc_files {
    constraints/top_vga_basys3.xdc
}

# Specify SystemVerilog design files location   -- EDIT
set sv_files {
    ../rtl/vga_pkg.sv
    ../rtl/vga_if.sv 
    ../rtl/top_vga/BtnCtl.sv
    ../rtl/top_vga/char_rom.sv
    ../rtl/top_vga/delay.sv
    ../rtl/top_vga/draw_bg.sv
    ../rtl/top_vga/draw_mouse.sv
    ../rtl/top_vga/draw_rect_char.sv
    ../rtl/top_vga/font_rom.sv
    ../rtl/top_vga/paint_panel.sv
    ../rtl/top_vga/top_vga.sv
    ../rtl/top_vga/vga_timing.sv
    rtl/top_vga_basys3.sv
    ../rtl/top_printer/top_printer.sv
    ../rtl/top_printer/printer_controller.sv
    ../rtl/top_printer/printer_movement.sv
}

# Specify Verilog design files location         -- EDIT
set verilog_files {
        rtl/clk_wiz_0.v
        rtl/clk_wiz_0_clk_wiz.v
 }

#Specify VHDL design files location            -- EDIT
set vhdl_files {
        ../rtl/top_vga/MouseDisplay.vhd
}

# Specify files for a memory initialization     -- EDIT
# set mem_files {
#    path/to/file.data
# }
