-- Title: Radial Gradient Pattern
-- Path: Patterns
-- Description: Draws a radial gradient pattern from a center point.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define block characters with different densities to simulate a gradient effect.
local soblock = '█'  -- Solid block (darkest)
local shblock = '▓'  -- Semi-heavy block (darker)
local hablock = '▒'  -- Half block (lighter)
local doblock = '░'  -- Dotted block (lightest)

-- Calculate the center of the drawing area.
-- The center is the midpoint between start_x and end_x, and start_y and end_y.
local center_x = (start_x + end_x) // 2
local center_y = (start_y + end_y) // 2

-- Calculate the maximum radius in both the x and y directions.
-- This is half the width and height of the drawing area.
local max_radius_x = (end_x - start_x) / 2
local max_radius_y = (end_y - start_y) / 2

-- Loop through each row (y-coordinate) from start_y to end_y.
for y = start_y, end_y do
    -- Loop through each column (x-coordinate) from start_x to end_x.
    for x = start_x, end_x do
        -- Normalize the x and y coordinates relative to the center.
        -- This converts the coordinates into a range between -1 and 1.
        local normalized_x = (x - center_x) / max_radius_x
        local normalized_y = (y - center_y) / max_radius_y
        
        -- Calculate the Euclidean distance from the current point to the center.
        -- This gives us a value between 0 and 1, where 0 is the center and 1 is the edge.
        local distance = math.sqrt(normalized_x ^ 2 + normalized_y ^ 2)
        
        -- Determine which character to use based on the distance from the center.
        local char_to_use
        
        if distance < 0.25 then
            -- Closest to the center, use the darkest block.
            char_to_use = soblock
        elseif distance < 0.5 then
            -- Slightly further out, use a darker block.
            char_to_use = shblock
        elseif distance < 0.75 then
            -- Even further out, use a lighter block.
            char_to_use = hablock
        else
            -- Furthest from the center, use the lightest block.
            char_to_use = doblock
        end
        
        -- Set the character at the current (x, y) position in the buffer.
        buf:set_char(x, y, char_to_use)
    end
end

