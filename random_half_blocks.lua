-- Title: Random Half-Block Fill Pattern
-- Path: Patterns
-- Description: Draws a random half-block fill pattern in a rectangular region.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define an array of half-block characters.
-- These characters represent different "half-filled" block styles, creating a more detailed and varied pattern.
local blocks = {'▀', '▄', '▌', '▐'}

-- Seed the random number generator with the current time to ensure different results each run.
math.randomseed(os.time())

-- Loop through each row (y-coordinate) from start_y to end_y.
for y = start_y, end_y do
    -- Loop through each column (x-coordinate) from start_x to end_x.
    for x = start_x, end_x do
        -- Select a random half-block character from the `blocks` array.
        -- `math.random(1, #blocks)` generates a random index between 1 and the length of the `blocks` array.
        local random_block = blocks[math.random(1, #blocks)]
        
        -- Set the randomly selected half-block character at the current (x, y) position in the buffer.
        buf:set_char(x, y, random_block)
    end
end