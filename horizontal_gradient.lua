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
for y = start_y, end_y do
    -- Calculate dimensions and positions
    local total_height = end_y - start_y + 1  -- Total height of drawing area
    local zone_height = math.ceil(total_height / 4)  -- Height of each gradient zone
    local relative_y = y - start_y  -- Current position relative to start
    local char_to_use

    -- Determine which block character to use based on vertical position
    if relative_y < zone_height then
        char_to_use = soblock  -- First quarter: darkest
    elseif relative_y < zone_height * 2 then
        char_to_use = shblock  -- Second quarter: dark
    elseif relative_y < zone_height * 3 then
        char_to_use = hablock  -- Third quarter: medium
    else
        char_to_use = doblock  -- Last quarter: lightest
    end
    
    -- Draw the current line of the gradient
    for x = start_x, end_x do
        buf:set_char(x, y, char_to_use)  -- Place character at current position
    end
end

