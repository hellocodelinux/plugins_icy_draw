-- Title: Vertical Mirror Pattern
-- Path: Effects
-- Description: Creates a vertical mirror copy outside of a rectangular region.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Loop through each row (y-coordinate) from start_y to end_y.
for y = start_y, end_y do
    -- Loop through each column (x-coordinate) from start_x to end_x.
    for x = start_x, end_x do
        -- Calculate the mirrored x-coordinate.
        -- The mirrored position is calculated as `end_x + (end_x - x) + 1`.
        -- This ensures that the mirrored character appears outside the original rectangular region.
        local mirror_x = end_x + (end_x - x) + 1
        
        -- Retrieve the character at the current position (x, y).
        local char_to_copy = buf:get_char(x, y)
        
        -- Retrieve the foreground and background colors at the current position (x, y).
        local fg_color = buf:get_fg(x, y)
        local bg_color = buf:get_bg(x, y)
        
        -- Set the mirrored character at the calculated mirrored position (mirror_x, y).
        buf:set_char(mirror_x, y, char_to_copy)
        
        -- Set the same foreground and background colors for the mirrored character.
        buf:set_fg(mirror_x, y, fg_color)
        buf:set_bg(mirror_x, y, bg_color)
    end
end