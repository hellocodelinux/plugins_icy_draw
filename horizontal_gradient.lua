-- Title: Horizontal Gradient Pattern
-- Path: Patterns
-- Description: Draws a horizontal gradient pattern in a rectangular region.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define Unicode block characters for different gradient levels
-- From darkest to lightest
local soblock = '█' -- Full block (darkest)
local shblock = '▓' -- Dark shade block
local hablock = '▒' -- Medium shade block
local doblock = '░' -- Light shade block (lightest)

-- Main loop to draw the gradient
-- Calculate the total height of the drawing area.
local total_height = end_y - start_y + 1

-- Divide the total height into four zones, each corresponding to a different block character.
-- `math.ceil` ensures that each zone has an integer height, even if the total height is not divisible by 4.
local zone_height = math.ceil(total_height / 4)

for x = start_x, end_x do
    for y = start_y, end_y do
        -- Calculate the relative position of the current y-coordinate within the drawing area.
        local relative_y = y - start_y

        -- Determine which character to use based on the relative position.
        local char_to_use

        if relative_y < zone_height then
            -- First zone: Use the darkest block.
            char_to_use = soblock
        elseif relative_y < zone_height * 2 then
            -- Second zone: Use a darker block.
            char_to_use = shblock
        elseif relative_y < zone_height * 3 then
            -- Third zone: Use a lighter block.
            char_to_use = hablock
        else
            -- Fourth zone: Use the lightest block.
            char_to_use = doblock
        end

        -- Set the character at the current (x, y) position in the buffer.
        buf:set_char(x, y, char_to_use)
    end
end
