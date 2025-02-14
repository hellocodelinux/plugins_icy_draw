-- Title: Horizontal Gradient Pattern

-- Description: Draws a horizontal gradient pattern in a rectangular region.

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- This script uses parameters defined in the LUA_PARAMETERS.txt file.

-- https://github.com/hellocodelinux/plugins_icy_draw

local soblock = '█'
local shblock = '▓'
local hablock = '▒'
local doblock = '░'

for y = start_y, end_y do
    local total_height = end_y - start_y + 1
    local zone_height = math.ceil(total_height / 4)
    local relative_y = y - start_y
    local char_to_use
    
    if relative_y < zone_height then
        char_to_use = soblock
    elseif relative_y < zone_height * 2 then
        char_to_use = shblock
    elseif relative_y < zone_height * 3 then
        char_to_use = hablock
    else
        char_to_use = doblock
    end
    
    for x = start_x, end_x do
        buf:set_char(x, y, char_to_use)
    end
end

