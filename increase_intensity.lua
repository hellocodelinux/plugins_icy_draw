-- Title: Increase Intensity
-- Path: Effects
-- Description: Replaces blocks with a more dense block, respecting the original block's color.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define the block characters from most dense to least dense
local soblock = '█'  -- solid block (most dense)
local shblock = '▓'  -- dark shade block
local hablock = '▒'  -- medium shade block
local doblock = '░'  -- light shade block
local noblock = ' '  -- empty space (least dense)

-- Function to determine which block should replace the current one
-- Returns the next denser block in the sequence
local function get_replacement_block(char)
    if char == noblock then
        return doblock       -- empty space becomes light shade
    elseif char == doblock then
        return hablock      -- light shade becomes medium shade
    elseif char == hablock then
        return shblock      -- medium shade becomes dark shade
    elseif char == shblock then
        return soblock      -- dark shade becomes solid block
    else
        return char        -- if not a recognized block, keep it unchanged
    end
end

-- Main loop: process each character in the selected area
for y = start_y, end_y do
    for x = start_x, end_x do
        -- Get current character and its foreground color
        local current_char = buf:get_char(x, y)
        local fg_color = buf:get_fg(x, y)
        
        -- Only process non-empty spaces
        if current_char ~= noblock then
            -- Replace with a denser block while keeping the original color
            local replacement_char = get_replacement_block(current_char)
            buf:set_char(x, y, replacement_char)
            buf:set_fg(x, y, fg_color)
        end
    end
end
