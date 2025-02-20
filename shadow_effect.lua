-- Title: Shadow Effect
-- Path: Effects
-- Description: This script creates a shadow effect by adding a dotted block to the right of each solid block in the selected area.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define the characters used for the shadow effect.
local solid_block = '█'  -- Solid block character, representing the main object.
local dotted_block = '▒'  -- Dotted block character, representing the shadow.

-- Ensure that start_x is less than or equal to end_x. If not, swap them.
if start_x > end_x then
    start_x, end_x = end_x, start_x
end

-- Ensure that start_y is less than or equal to end_y. If not, swap them.
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

-- Loop through each row (y-coordinate) from start_y to end_y.
for y = start_y, end_y do
    -- Loop through each column (x-coordinate) from start_x to end_x.
    for x = start_x, end_x do
        -- Retrieve the character at the current position (x, y).
        local ch = buf:get_char(x, y)
        
        -- Check if the current character is a solid block ('█').
        if ch == solid_block then
            -- Check the character to the right of the current position (x + 1, y).
            -- If it's either empty (' ') or doesn't exist (nil), we can place the shadow there.
            local right_char = buf:get_char(x + 1, y)
            if right_char == ' ' or right_char == nil then
                -- Retrieve the foreground and background colors of the current solid block.
                local fg = buf:get_fg(x, y)
                local bg = buf:get_bg(x, y)
                
                -- Set the dotted block ('▒') as the shadow to the right of the solid block.
                buf:set_char(x + 1, y, dotted_block)
                
                -- Apply the same foreground and background colors to the shadow block,
                -- ensuring the shadow matches the color of the original block.
                buf:set_fg(x + 1, y, fg)
                buf:set_bg(x + 1, y, bg)
            end
        end
    end
end