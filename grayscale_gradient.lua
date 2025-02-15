-- Title: Grayscale Gradient
-- Path: Colors
-- Description: Applies a grayscale gradient to the foreground color
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

local colores = {15, 7, 8}

if start_x > end_x then
    start_x, end_x = end_x, start_x
end

local ancho_total = end_x - start_x + 1
local segmento = math.floor(ancho_total / #colores)

for y = start_y, end_y do
    for x = start_x, end_x do
        local pos_rel = x - start_x
        local color_idx = math.floor(pos_rel / segmento) + 1
        color_idx = math.min(color_idx, #colores)
        
        local char = buf:get_char(x, y)
        local bg = buf:get_bg(x, y)
        
        buf:set_char(x, y, char)
        buf:set_fg(x, y, colores[color_idx])
        buf:set_bg(x, y, bg)
    end
end
