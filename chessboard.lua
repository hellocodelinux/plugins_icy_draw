-- Title: Chessboard Pattern
-- Path: Patterns
-- Description: This script draws a chessboard pattern.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define the characters for black and white squares
-- '█' is a full block, ' ' is an empty space
local black_block = '█'
local white_block = ' '

-- Ensure coordinates are in correct order (start < end)
-- This swaps the values if they're in wrong order
if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

-- Draw the chessboard pattern
-- Loop through each row and column in the selected area
for y = start_y, end_y do
    for x = start_x, end_x do
        -- Use modulo operator to alternate between black and white
        -- When (x + y) is even, place a black block
        -- When (x + y) is odd, place a white block
        if (x + y) % 2 == 0 then
            buf:set_char(x, y, black_block)
        else
            buf:set_char(x, y, white_block)
        end
    end
end
