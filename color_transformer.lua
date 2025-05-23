-- Title: Color Transformer
-- Path: Colors
-- Description: Transforms the colors of a rectangular region by inverting them.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Color inversion map: each key maps to its inverted color value (0-15)
-- For example: color 0 becomes 8, color 1 becomes 9, etc.
local inversion_colores = {
    [0] = 8, [1] = 9, [2] = 10, [3] = 11, [4] = 12, [5] = 13, [6] = 14, [7] = 15,
    [8] = 0, [9] = 1, [10] = 2, [11] = 3, [12] = 4, [13] = 5, [14] = 6, [15] = 7
}

-- Ensure start coordinates are less than end coordinates
-- This normalizes the selection rectangle
if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

-- Iterate through each cell in the selected rectangle
for y = start_y, end_y do
    for x = start_x, end_x do
        -- Get current foreground and background colors
        local fg = buf:get_fg(x, y)
        local bg = buf:get_bg(x, y)

        -- Convert colors to their inverted values
        -- If color not found in map, keep original color
        local fg_invertido = inversion_colores[fg] or fg
        local bg_invertido = inversion_colores[bg] or bg

        -- Apply the inverted colors to the cell
        buf:set_fg(x, y, fg_invertido)
        buf:set_bg(x, y, bg_invertido)
    end
end
