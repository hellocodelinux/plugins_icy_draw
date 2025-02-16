-- Title: Lower Intensity
-- Path: Effects
-- Description: Replaces blocks with a less dense block, respecting the original block's color.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define the block characters from most dense to least dense
-- Full block, dark shade, medium shade, light shade and empty space
local soblock = '█'
local shblock = '▓'
local hablock = '▒'
local doblock = '░'
local noblock = ' '

-- This function returns the next less dense block character
-- If input is a full block, returns dark shade, and so on
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
        -- If character is not recognized, return it unchanged
        return char
    end
end

-- Main loop: process each character in the selected area
-- start_x, start_y, end_x, end_y are provided by the editor
for y = start_y, end_y do
    for x = start_x, end_x do
        -- Get current character and its foreground color
        local current_char = buf:get_char(x, y)
        local fg_color = buf:get_fg(x, y)
        
        -- Only process non-empty blocks
        if current_char ~= noblock then
            -- Get the less dense replacement and maintain the original color
            local replacement_char = get_replacement_block(current_char)
            buf:set_char(x, y, replacement_char)
            buf:set_fg(x, y, fg_color)
        end
    end
end

