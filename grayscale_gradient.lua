-- Title: Grayscale Gradient
-- Path: Colors
-- Description: Applies a grayscale gradient to the foreground color
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define the colors for the gradient (from white to gray to black)
local colores = {15, 7, 8}

-- Ensure start_x is always less than end_x
if start_x > end_x then
    start_x, end_x = end_x, start_x
end

-- Calculate the total width and segment size for the gradient
local ancho_total = end_x - start_x + 1
local segmento = math.floor(ancho_total / #colores)

-- Iterate through each pixel in the selection area
for y = start_y, end_y do
    for x = start_x, end_x do
        -- Calculate relative position and color index for gradient
        local pos_rel = x - start_x
        local color_idx = math.floor(pos_rel / segmento) + 1
        -- Ensure color index doesn't exceed array bounds
        color_idx = math.min(color_idx, #colores)
        
        -- Preserve the original character and background color
        local char = buf:get_char(x, y)
        local bg = buf:get_bg(x, y)
        
        -- Apply the gradient color while keeping original character and background
        buf:set_char(x, y, char)
        buf:set_fg(x, y, colores[color_idx])
        buf:set_bg(x, y, bg)
    end
end
