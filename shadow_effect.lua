-- Title: Shadow Effect

-- Description: This script creates a shadow effect by adding a dotted block to the right of each solid block in the selected area.

local solid_block = '█'
local dotted_block = '░'

if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

for y = start_y, end_y do
    for x = start_x, end_x do
        local ch = buf:get_char(x, y)
        if ch == solid_block then
            local right_char = buf:get_char(x + 1, y)
            if right_char == ' ' or right_char == nil then
                local fg = buf:get_fg(x, y)
                local bg = buf:get_bg(x, y)
                buf:set_char(x + 1, y, dotted_block)
                buf:set_fg(x + 1, y, fg)
                buf:set_bg(x + 1, y, bg)
            end
        end
    end
end

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)