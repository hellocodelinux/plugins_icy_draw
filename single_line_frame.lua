-- Title: Single-Line Frame
-- Path: Borders
-- Description: Draws a single-line frame around a rectangular region.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define the characters used to draw the single-line frame.
local estilo_simple = {
    esquina_sup_izq = '┌',  -- Top-left corner
    esquina_sup_der = '┐',  -- Top-right corner
    esquina_inf_izq = '└',  -- Bottom-left corner
    esquina_inf_der = '┘',  -- Bottom-right corner
    horizontal = '─',       -- Horizontal line
    vertical = '│'          -- Vertical line
}

-- Ensure that start_x is less than or equal to end_x. If not, swap them.
if start_x > end_x then
    start_x, end_x = end_x, start_x
end

-- Ensure that start_y is less than or equal to end_y. If not, swap them.
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

-- Set the corner characters of the frame.
buf:set_char(start_x, start_y, estilo_simple.esquina_sup_izq)  -- Top-left corner
buf:set_char(end_x, start_y, estilo_simple.esquina_sup_der)    -- Top-right corner
buf:set_char(start_x, end_y, estilo_simple.esquina_inf_izq)    -- Bottom-left corner
buf:set_char(end_x, end_y, estilo_simple.esquina_inf_der)      -- Bottom-right corner

-- Draw the top and bottom horizontal lines of the frame.
for x = start_x + 1, end_x - 1 do
    buf:set_char(x, start_y, estilo_simple.horizontal)  -- Top horizontal line
    buf:set_char(x, end_y, estilo_simple.horizontal)    -- Bottom horizontal line
end

-- Draw the left and right vertical lines of the frame.
for y = start_y + 1, end_y - 1 do
    buf:set_char(start_x, y, estilo_simple.vertical)    -- Left vertical line
    buf:set_char(end_x, y, estilo_simple.vertical)      -- Right vertical line
end