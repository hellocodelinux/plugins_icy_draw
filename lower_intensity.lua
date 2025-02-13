-- Title: Lower Intensity

-- Description: Replaces blocks with a less dense block, respecting the original block's color.

local soblock = '█'
local shblock = '▓'
local hablock = '▒'
local doblock = '░'
local noblock = ' '

local function get_replacement_block(char)
    if char == soblock then
        return shblock
    elseif char == shblock then
        return hablock
    elseif char == hablock then
        return doblock
    elseif char == doblock then
        return noblock
    else
        return char
    end
end

for y = start_y, end_y do
    for x = start_x, end_x do
        local current_char = buf:get_char(x, y)
        if current_char ~= noblock then
            local replacement_char = get_replacement_block(current_char)
            buf:set_char(x, y, replacement_char)
        end
    end
end

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
