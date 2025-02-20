-- Title: Vertical Striped Pattern
-- Path: Patterns
-- Description: Draws a vertical striped pattern in a rectangular region.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define the characters used for the striped pattern.
local stripe_block = '█'  -- Solid block, used for the "striped" columns.
local empty_block = ' '   -- Empty space, used for the "empty" columns.

-- Ensure that start_x is less than or equal to end_x. If not, swap them.
if start_x > end_x then
    start_x, end_x = end_x, start_x
end

-- Ensure that start_y is less than or equal to end_y. If not, swap them.
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

-- Loop through each column (x-coordinate) from start_x to end_x.
for x = start_x, end_x do
    -- Determine whether the current column should be filled with the stripe block or left empty.
    -- Use modulo operation to alternate between stripe and empty blocks.
    local block = (x % 2 == 0) and stripe_block or empty_block
    
    -- Loop through each row (y-coordinate) from start_y to end_y.
    for y = start_y, end_y do
        -- Set the character at position (x, y) to the determined block (either stripe or empty).
        buf:set_char(x, y, block)
    end
end