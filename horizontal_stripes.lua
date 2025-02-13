-- Title: Horizontal Striped Pattern

-- Description: Draws a horizontal striped pattern in a rectangular region.

local stripe_block = '█'
local empty_block = ' '

if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

for y = start_y, end_y do
    local block = (y % 2 == 0) and stripe_block or empty_block
    for x = start_x, end_x do
        buf:set_char(x, y, block)
    end
end

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)