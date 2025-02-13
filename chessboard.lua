-- Title: Chessboard Pattern

-- Description: This script draws a chessboard pattern.

local black_block = '█'
local white_block = ' '

if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

for y = start_y, end_y do
    for x = start_x, end_x do
        if (x + y) % 2 == 0 then
            buf:set_char(x, y, black_block)
        else
            buf:set_char(x, y, white_block)
        end
    end
end

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
