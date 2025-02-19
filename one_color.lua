-- Title: Change to a color
-- Path: Colors
-- Description: Changes the entire foreground color of the selection to the selected color
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Ensure that start_x is less than or equal to end_x. If not, swap them.
if start_x > end_x then
    start_x, end_x = end_x, start_x
end

-- Ensure that start_y is less than or equal to end_y. If not, swap them.
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

-- The following block loops through every position (x, y) within the selected area.
-- It starts from the top-left corner (start_x, start_y) and goes to the bottom-right corner (end_x, end_y).

for y = start_y, end_y do  -- Loop through each row (Y coordinate) from start_y to end_y.
    for x = start_x, end_x do  -- Loop through each column (X coordinate) from start_x to end_x.

        -- For each position (x, y), get the character at that location in the buffer.
        -- This retrieves ONLY the character without considering foreground color.
        local char = buf:get_char(x, y)
        local fondo = buf:get_bg(x, y)

-- Returns the colorless character, preserving the background color
        buf:set_char(x, y, char)
        buf:set_bg(x, y, fondo)
    end
end

