-- Title: Barcode Pattern Generator

-- Path: Patterns

-- Description: Generates a barcode-like pattern using half blocks.

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- This script uses parameters defined in the LUA_PARAMETERS.txt file.

-- https://github.com/hellocodelinux/plugins_icy_draw

local patterns = {'▌', '▐'}
math.randomseed(os.time())

-- Generate horizontal pattern first
local horizontal_pattern = {}
for x = start_x, end_x do
    -- Randomly choose between left and right half blocks
    horizontal_pattern[x] = (math.random(1, 2) == 1) and patterns[1] or patterns[2]
end

-- Apply pattern vertically
for y = start_y, end_y do
    for x = start_x, end_x do
        buf:set_char(x, y, horizontal_pattern[x])
    end
end
