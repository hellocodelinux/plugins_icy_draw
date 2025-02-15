-- Title: Radial Gradient Pattern

-- Path: Patterns

-- Description: Draws a radial gradient pattern from a center point.

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- This script uses parameters defined in the LUA_PARAMETERS.txt file.

-- https://github.com/hellocodelinux/plugins_icy_draw

local soblock = '█'
local shblock = '▓'
local hablock = '▒'
local doblock = '░'

local center_x = (start_x + end_x) // 2
local center_y = (start_y + end_y) // 2
local max_radius_x = (end_x - start_x) / 2
local max_radius_y = (end_y - start_y) / 2

for y = start_y, end_y do
    for x = start_x, end_x do
        local normalized_x = (x - center_x) / max_radius_x
        local normalized_y = (y - center_y) / max_radius_y
        local distance = math.sqrt(normalized_x ^ 2 + normalized_y ^ 2)
        local char_to_use
        
        if distance < 0.25 then
            char_to_use = soblock
        elseif distance < 0.5 then
            char_to_use = shblock
        elseif distance < 0.75 then
            char_to_use = hablock
        else
            char_to_use = doblock
        end
        
        buf:set_char(x, y, char_to_use)
    end
end

