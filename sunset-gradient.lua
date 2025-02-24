-- Title: Sunset Gradient
-- Path: Colors
-- Description: Applies a sunset gradient effect (orange to purple) to the selected area
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define sunset gradient colors (ANSI color indices)
local sunset_colors = {
    1,   -- Red
    9,   -- Bright Red
    3,   -- Yellow
    11,  -- Bright Yellow
    13,  -- Bright Magenta
    5,   -- Magenta
    4    -- Blue (for night sky)
}

-- Ensure start coordinates are less than end coordinates
if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

-- Calculate the height of the selection
local height = end_y - start_y + 1
-- Calculate how many rows each color should span
local rows_per_color = math.max(1, math.floor(height / #sunset_colors))

-- Iterate through the selection
for y = start_y, end_y do
    -- Calculate which color to use based on vertical position
    local color_index = math.min(
        #sunset_colors,
        math.floor((y - start_y) / rows_per_color) + 1
    )
    local current_color = sunset_colors[color_index]
    
    for x = start_x, end_x do
        -- Get the current character and background color
        local char = buf:get_char(x, y)
        local bg = buf:get_bg(x, y)
        
        -- Only apply color to non-empty characters
        if char ~= ' ' and char ~= nil then
            -- Apply the sunset color to foreground
            buf:set_fg(x, y, current_color)
        end
    end
end
