-- Title: Double-Line Frame
-- Path: Borders
-- Description: Draws a double-line frame around a rectangular region.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define the characters used for drawing the double-line frame
local estilo_doble = {
    esquina_sup_izq = '╔',  -- Top-left corner
    esquina_sup_der = '╗',  -- Top-right corner
    esquina_inf_izq = '╚',  -- Bottom-left corner
    esquina_inf_der = '╝',  -- Bottom-right corner
    horizontal = '═',       -- Horizontal line
    vertical = '║'         -- Vertical line
}

-- Ensure start coordinates are less than end coordinates
if start_x > end_x then
    start_x, end_x = end_x, start_x  -- Swap X coordinates if needed
end
if start_y > end_y then
    start_y, end_y = end_y, start_y  -- Swap Y coordinates if needed
end

-- Draw the corners of the frame
buf:set_char(start_x, start_y, estilo_doble.esquina_sup_izq)
buf:set_char(end_x, start_y, estilo_doble.esquina_sup_der)
buf:set_char(start_x, end_y, estilo_doble.esquina_inf_izq)
buf:set_char(end_x, end_y, estilo_doble.esquina_inf_der)

-- Draw horizontal lines (top and bottom)
for x = start_x + 1, end_x - 1 do
    buf:set_char(x, start_y, estilo_doble.horizontal)  -- Top line
    buf:set_char(x, end_y, estilo_doble.horizontal)    -- Bottom line
end

-- Draw vertical lines (left and right)
for y = start_y + 1, end_y - 1 do
    buf:set_char(start_x, y, estilo_doble.vertical)    -- Left line
    buf:set_char(end_x, y, estilo_doble.vertical)      -- Right line
end
