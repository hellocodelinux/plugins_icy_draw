-- Title: Vertical Striped Pattern

-- Path: Patterns

-- Description: Draws a vertical striped pattern in a rectangular region.

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- This script uses parameters defined in the LUA_PARAMETERS.txt file.

-- https://github.com/hellocodelinux/plugins_icy_draw

local stripe_block = '█'
local empty_block = ' '

if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

for x = start_x, end_x do
    local block = (x % 2 == 0) and stripe_block or empty_block
    for y = start_y, end_y do
        buf:set_char(x, y, block)
    end
end
