-- Title: Increase Intensity

-- Path: Effects

-- Description: Replaces blocks with a more dense block, respecting the original block's color.

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- This script uses parameters defined in the LUA_PARAMETERS.txt file.

-- https://github.com/hellocodelinux/plugins_icy_draw

local soblock = '█'
local shblock = '▓'
local hablock = '▒'
local doblock = '░'
local noblock = ' '

local function get_replacement_block(char)
    if char == noblock then
        return doblock
    elseif char == doblock then
        return hablock
    elseif char == hablock then
        return shblock
    elseif char == shblock then
        return soblock
    else
        return char
    end
end

for y = start_y, end_y do
    for x = start_x, end_x do
        local current_char = buf:get_char(x, y)
        local fg_color = buf:get_fg(x, y)
        if current_char ~= noblock then
            local replacement_char = get_replacement_block(current_char)
            buf:set_char(x, y, replacement_char)
            buf:set_fg(x, y, fg_color)
        end
    end
end
