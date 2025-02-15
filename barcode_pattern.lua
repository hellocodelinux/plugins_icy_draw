-- Title: Barcode Pattern Generator

-- Path: Patterns

-- Description: Generates a barcode-like pattern using half blocks.

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- This script uses parameters defined in the LUA_PARAMETERS.txt file.

-- https://github.com/hellocodelinux/plugins_icy_draw

local patterns = {'▌', '▐', ' '}
math.randomseed(os.time())

-- Generate horizontal pattern first
local horizontal_pattern = {}
for x = start_x, end_x do
    -- 60% chance for bars, 40% for spaces
    local rand = math.random(1, 10)
    if rand <= 6 then
        -- Alternate between left and right half blocks
        horizontal_pattern[x] = (x % 2 == 0) and patterns[1] or patterns[2]
    else
        horizontal_pattern[x] = patterns[3]
    end
end

-- Apply pattern vertically
for y = start_y, end_y do
    for x = start_x, end_x do
        buf:set_char(x, y, horizontal_pattern[x])
    end
end
