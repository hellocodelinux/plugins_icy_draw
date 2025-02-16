-- Title: Barcode Pattern Generator
-- Path: Patterns
-- Description: Generates a barcode-like pattern using half blocks.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define the characters we'll use for the barcode pattern
-- '▌' is a left half block, '▐' is a right half block
local patterns = {'▌', '▐'}

-- Initialize random number generator with current time as seed
math.randomseed(os.time())

-- Create a horizontal pattern array
-- This will store one character for each column, which will be repeated vertically
local horizontal_pattern = {}

-- Fill the horizontal pattern with random left/right blocks
-- start_x and end_x are provided by the editor
for x = start_x, end_x do
    -- Randomly choose between pattern[1] (▌) and pattern[2] (▐)
    -- math.random(1,2) returns either 1 or 2
    horizontal_pattern[x] = (math.random(1, 2) == 1) and patterns[1] or patterns[2]
end

-- Draw the pattern to the screen buffer
-- Each column's pattern is repeated from start_y to end_y
for y = start_y, end_y do
    for x = start_x, end_x do
        -- Set the character at current position using the pre-generated pattern
        buf:set_char(x, y, horizontal_pattern[x])
    end
end
