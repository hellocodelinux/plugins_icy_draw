-- Title: Vertical Mirror Pattern

-- Path: Patterns

-- Description: Creates a vertical mirror copy outside of a rectangular region.

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- This script uses parameters defined in the LUA_PARAMETERS.txt file.

-- https://github.com/hellocodelinux/plugins_icy_draw

for y = start_y, end_y do
    for x = start_x, end_x do
        local mirror_x = end_x + (end_x - x) + 1
        local char_to_copy = buf:get_char(x, y)
        local fg_color = buf:get_fg(x, y)
        local bg_color = buf:get_bg(x, y)
        buf:set_char(mirror_x, y, char_to_copy)
        buf:set_fg(mirror_x, y, fg_color)
        buf:set_bg(mirror_x, y, bg_color)
    end
end
