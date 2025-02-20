-- Title: Vertical Gradient Pattern
-- Path: Patterns
-- Description: Draws a vertical gradient pattern in a rectangular region.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define block characters with different densities to simulate a gradient effect.
local soblock = '█'  -- Solid block (darkest)
local shblock = '▓'  -- Semi-heavy block (darker)
local hablock = '▒'  -- Half block (lighter)
local doblock = '░'  -- Dotted block (lightest)

-- Loop through each row (y-coordinate) from start_y to end_y.
for y = start_y, end_y do
    -- Calculate the total width of the drawing area.
    local total_width = end_x - start_x + 1
    
    -- Divide the total width into four zones, each corresponding to a different block character.
    -- `math.ceil` ensures that each zone has an integer width, even if the total width is not divisible by 4.
    local zone_width = math.ceil(total_width / 4)
    
    -- Loop through each column (x-coordinate) from start_x to end_x.
    for x = start_x, end_x do
        -- Calculate the relative position of the current x-coordinate within the drawing area.
        local relative_x = x - start_x
        
        -- Determine which character to use based on the relative position.
        local char_to_use
        
        if relative_x < zone_width then
            -- First zone: Use the darkest block.
            char_to_use = soblock
        elseif relative_x < zone_width * 2 then
            -- Second zone: Use a darker block.
            char_to_use = shblock
        elseif relative_x < zone_width * 3 then
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