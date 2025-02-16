-- Title: Rainbow Gradient
-- Path: Colors
-- Description: Applies a rainbow gradient to the foreground color.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define an array of color codes representing different colors of the rainbow.
-- Each number corresponds to a specific color code used by the buffer system.
local colores = {1, 3, 2, 14, 4, 5}  -- Example: 1 = Red, 3 = Yellow, 2 = Green, etc.

-- Ensure that start_x is less than or equal to end_x. If not, swap them.
if start_x > end_x then
    start_x, end_x = end_x, start_x
end

-- Calculate the total width of the drawing area.
local ancho_total = end_x - start_x + 1

-- Divide the total width into segments, where each segment corresponds to one color in the rainbow.
-- `math.floor` ensures that the segment length is an integer.
local segmento = math.floor(ancho_total / #colores)

-- Loop through each row (y-coordinate) from start_y to end_y.
for y = start_y, end_y do
    -- Loop through each column (x-coordinate) from start_x to end_x.
    for x = start_x, end_x do
        -- Calculate the relative position of the current x-coordinate within the drawing area.
        local pos_rel = x - start_x
        
        -- Determine which color index to use based on the current position.
        -- The color index is determined by dividing the relative position by the segment length.
        local color_idx = math.floor(pos_rel / segmento) + 1
        
        -- Ensure that the color index does not exceed the number of available colors.
        color_idx = math.min(color_idx, #colores)
        
        -- Retrieve the current character and background color at position (x, y).
        local char = buf:get_char(x, y)
        local bg = buf:get_bg(x, y)
        
        -- Set the character back to its original value (no change to the character itself).
        buf:set_char(x, y, char)
        
        -- Set the foreground color to the corresponding color in the rainbow gradient.
        buf:set_fg(x, y, colores[color_idx])
        
        -- Retain the original background color.
        buf:set_bg(x, y, bg)
    end
end
