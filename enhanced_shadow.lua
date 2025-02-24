-- Title: Enhanced Shadow Effect
-- Path: Effects
-- Description: Creates an improved shadow effect with adjustable direction and intensity
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define the characters used for the shadow effect with different intensity levels
local solid_block = '█'  -- Solid block character, representing the main object
local shadow_blocks = {
    strong = '▓',  -- Strong shadow (closest to object)
    medium = '▒',  -- Medium shadow
    light = '░'    -- Light shadow (furthest from object)
}

-- Shadow direction (1 = right, 2 = down-right, 3 = down, 4 = down-left)
local shadow_direction = 2

-- Shadow length (how many characters the shadow extends)
local shadow_length = 2

-- Ensure that start_x is less than or equal to end_x. If not, swap them.
if start_x > end_x then
    start_x, end_x = end_x, start_x
end

-- Ensure that start_y is less than or equal to end_y. If not, swap them.
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

-- Define direction offsets for different shadow directions
local direction_offsets = {
    { x = 1, y = 0 },  -- Right
    { x = 1, y = 1 },  -- Down-right
    { x = 0, y = 1 },  -- Down
    { x = -1, y = 1 }  -- Down-left
}

-- Get the selected offset based on shadow_direction
local offset = direction_offsets[shadow_direction]

-- First pass: collect positions of all solid blocks
local solid_positions = {}
for y = start_y, end_y do
    for x = start_x, end_x do
        local ch = buf:get_char(x, y)
        if ch == solid_block then
            table.insert(solid_positions, {x = x, y = y})
        end
    end
end

-- Second pass: add shadows (this ensures shadows don't interfere with other solid blocks)
for _, pos in ipairs(solid_positions) do
    local x, y = pos.x, pos.y
    local fg = buf:get_fg(x, y)
    local bg = buf:get_bg(x, y)
    
    -- Create gradient shadow based on shadow_length
    for i = 1, shadow_length do
        local shadow_x = x + (offset.x * i)
        local shadow_y = y + (offset.y * i)
        
        -- Check if position is within buffer bounds
        if shadow_x >= 0 and shadow_y >= 0 and shadow_x <= buf.width and shadow_y <= buf.height then
            -- Check if the position is empty or doesn't have a solid block
            local existing_char = buf:get_char(shadow_x, shadow_y)
            if existing_char == ' ' or existing_char == nil or existing_char ~= solid_block then
                -- Select shadow intensity based on distance
                local shadow_char
                if i == 1 then
                    shadow_char = shadow_blocks.strong
                elseif i == 2 then
                    shadow_char = shadow_blocks.medium
                else
                    shadow_char = shadow_blocks.light
                end
                
                -- Set the shadow character
                buf:set_char(shadow_x, shadow_y, shadow_char)
                
                -- Apply slightly darker color for shadow
                -- We'll make the foreground slightly darker to simulate shadow
                -- You can adjust these color transformations to your preference
                buf:set_fg(shadow_x, shadow_y, fg)
                buf:set_bg(shadow_x, shadow_y, bg)
            end
        end
    end
end