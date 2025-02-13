-- Title: Diagonal Stripe Pattern

-- Description: Draws a diagonal stripe pattern in a rectangular region.

local diagonal_block = '█'
local empty_block = ' '

if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

for y = start_y, end_y do
    for x = start_x, end_x do
        if (x - y) % 2 == 0 then
            buf:set_char(x, y, diagonal_block)
        else
            buf:set_char(x, y, empty_block)
        end
    end
end

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)