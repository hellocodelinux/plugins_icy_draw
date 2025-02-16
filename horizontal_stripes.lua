-- Title: Horizontal Striped Pattern
-- Path: Patterns
-- Description: Draws a horizontal striped pattern in a rectangular region.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define the characters used for drawing the pattern
-- stripe_block is a full block character that creates the visible stripe
-- empty_block is a space character that creates the gap between stripes
local stripe_block = '█'
local empty_block = ' '

-- Ensure start coordinates are always less than end coordinates
-- This makes the script work correctly regardless of drawing direction
if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

-- Main drawing loop
-- Iterate through each row (y coordinate) in the drawing area
for y = start_y, end_y do
    -- Determine which block to use based on whether y is even or odd
    -- This creates alternating stripes pattern
    local block = (y % 2 == 0) and stripe_block or empty_block
    
    -- Fill the entire row with either stripe_block or empty_block
    for x = start_x, end_x do
        buf:set_char(x, y, block)
    end
end
