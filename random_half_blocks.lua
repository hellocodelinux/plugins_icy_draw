-- Title: Random Half-Block Fill Pattern

-- Description: Draws a random half-block fill pattern in a rectangular region.

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- This script uses parameters defined in the LUA_PARAMETERS.txt file.

-- https://github.com/hellocodelinux/plugins_icy_draw

local blocks = {'▀', '▄', '▌', '▐'}

math.randomseed(os.time())

for y = start_y, end_y do
    for x = start_x, end_x do
        local random_block = blocks[math.random(1, #blocks)]
        buf:set_char(x, y, random_block)
    end
end
