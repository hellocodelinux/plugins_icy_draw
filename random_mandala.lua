-- Title: Random Mandala Generator
-- Path: Patterns
-- Description: Generates a symmetrical mandala pattern using half blocks.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define an array of block characters to use for the mandala pattern.
-- The characters include a solid block ('█') and a space (' ') for contrast.
local blocks = {'█', ' '}

-- Seed the random number generator with the current time to ensure different results each run.
math.randomseed(os.time())

-- Calculate the width and height of the drawing area.
local width = end_x - start_x + 1
local height = end_y - start_y + 1

-- Calculate the center of the drawing area.
-- The center is the midpoint between start_x and end_x, and start_y and end_y.
local center_x = start_x + math.floor(width / 2)
local center_y = start_y + math.floor(height / 2)

-- Define the radius as the maximum of the width and height.
-- This ensures that the mandala pattern can extend across the entire drawing area.
local radius = math.max(width, height)

-- A function to calculate mirrored positions for symmetry.
-- Given a point (x, y) and the center (cx, cy), this function returns three mirrored points:
-- 1. Horizontal mirror: Reflects across the vertical axis.
-- 2. Vertical mirror: Reflects across the horizontal axis.
-- 3. Diagonal mirror: Reflects across both axes (diagonally).
local function mirror_position(x, y, cx, cy)
    return {
        {cx - (x - cx), y},            -- Horizontal mirror
        {x, cy - (y - cy)},            -- Vertical mirror
        {cx - (x - cx), cy - (y - cy)} -- Diagonal mirror
    }
end

-- Loop through each row (y-coordinate) from start_y to the center_y.
for y = start_y, center_y do
    -- Loop through each column (x-coordinate) from start_x to the center_x.
    for x = start_x, center_x do
        -- Check if the current position (x, y) is within the circular boundary defined by the radius.
        if math.sqrt((x - center_x)^2 + (y - center_y)^2) <= radius then
            -- Select a random block character from the `blocks` array.
            local block = blocks[math.random(1, #blocks)]
            
            -- Set the randomly selected block character at the current (x, y) position in the buffer.
            buf:set_char(x, y, block)
            
            -- Get the mirrored positions for the current (x, y) coordinate.
            local mirrors = mirror_position(x, y, center_x, center_y)
            
            -- Loop through each mirrored position and set the same block character there.
            for _, pos in ipairs(mirrors) do
                -- Ensure that the mirrored position is within the drawing area bounds.
                if pos[1] <= end_x and pos[2] <= end_y then
                    buf:set_char(pos[1], pos[2], block)
                end
            end
        end
    end
end
