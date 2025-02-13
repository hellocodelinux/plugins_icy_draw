-- Title: Random Block Fill Pattern

-- Description: Draws a random block fill pattern in a rectangular region.

local blocks = {'█', '▓', '▒', '░'}

math.randomseed(os.time())

for y = start_y, end_y do
    for x = start_x, end_x do
        local random_block = blocks[math.random(1, #blocks)]
        buf:set_char(x, y, random_block)
    end
end

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)