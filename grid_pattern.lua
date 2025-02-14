-- Title: Grid Pattern

-- Description: Draws a grid pattern on the screen.

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- This script uses parameters defined in the LUA_PARAMETERS.txt file.

-- https://github.com/hellocodelinux/plugins_icy_draw

local spacing = 1

if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

for y = start_y, end_y, spacing do
    for x = start_x, end_x, spacing do
        buf:set_char(x, y, '┼')
    end
end
