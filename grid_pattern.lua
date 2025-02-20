-- Title: Grid Pattern
-- Path: Patterns
-- Description: Draws a grid pattern on the screen.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define the spacing between grid points
local spacing = 1

-- Ensure start coordinates are smaller than end coordinates
-- This makes the loop work correctly regardless of drawing direction
if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

-- Create the grid pattern by iterating through coordinates
-- Outer loop: vertical lines (y coordinates)
-- Inner loop: horizontal lines (x coordinates)
for y = start_y, end_y, spacing do
    for x = start_x, end_x, spacing do
        -- Place a cross character '┼' at each intersection point
        -- This creates the grid effect using ASCII/Unicode characters
        buf:set_char(x, y, '┼')
    end
end
