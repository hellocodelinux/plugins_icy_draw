-- Title: Matrix Pattern
-- Path: Patterns
-- Description: Creates a more realistic Matrix-style digital rain pattern with varying speeds, lengths, and fades.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- A table containing Katakana characters, numbers, and some symbols to simulate the "Matrix" digital rain effect.
local matrix_chars = {
    'ｱ', 'ｲ', 'ｳ', 'ｴ', 'ｵ', 'ｶ', 'ｷ', 'ｸ', 'ｹ', 'ｺ', 'ｻ', 'ｼ', 'ｽ', 'ｾ', 'ｿ',
    'ﾀ', 'ﾁ', 'ﾂ', 'ﾃ', 'ﾄ', 'ﾅ', 'ﾆ', 'ﾇ', 'ﾈ', 'ﾉ', 'ﾊ', 'ﾋ', 'ﾌ', 'ﾍ', 'ﾎ',
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    '!', '@', '#', '$', '%', '^', '&', '*'
}

-- Ensure that start_x is less than or equal to end_x. If not, swap them.
if start_x > end_x then start_x, end_x = end_x, start_x end

-- Ensure that start_y is less than or equal to end_y. If not, swap them.
if start_y > end_y then start_y, end_y = end_y, start_y end

-- Seed the random number generator with the current time to ensure different results each run.
math.randomseed(os.time())

-- Function to generate a random color intensity
local function get_random_color_intensity()
    local color_chance = math.random(1, 10)
    if color_chance <= 5 then
        return 10  -- Bright green (50% chance)
    elseif color_chance <= 7 then
        return 7   -- Light gray (20% chance)
    elseif color_chance <= 9 then
        return 8    -- Dark gray(20% chance)
    else
        return 15 --very bright white(10% chance)
    end
end

-- Function to get the intensity of a color
local function get_intensity(intensity)
    if intensity == 0 then
        return 2   -- Very dim green
    elseif intensity == 1 then
        return 10   -- bright green
    elseif intensity == 2 then
        return 7   -- Light gray
    elseif intensity == 3 then
        return 15   --very bright white
    else
        return 8 --dark gray
    end
end

-- Function to create a tail effect
local function create_tail(x, y, length)
    local current_y = y
    for i = 1, length do
        if current_y >= start_y and current_y <= end_y then -- Check if within the selection area
            local tail_char = matrix_chars[math.random(1, #matrix_chars)]
            local tail_color = get_intensity(math.random(0, 3))
            if tail_color == 15 then
                tail_color = 10
            end
            buf:set_char(x, current_y, tail_char)
            buf:set_fg(x, current_y, tail_color)
        end
        current_y = current_y - 1
    end
end

-- Loop through each column (x-coordinate) from start_x to end_x.
for x = start_x, end_x do
    -- Generate a random density value between 1 and 24. This controls how often characters appear.
    local density = math.random(1, 24) -- Increased density range to make it less dense

    -- Randomize the length of the rain stream for a more natural effect
    local rain_length = math.random(5, 15)

    -- Loop start in random position. Now start from top to bottom.
    --local start_rain = math.random(start_y, end_y) -- Not needed anymore

    -- Loop through each row with the stream rain, going from top to bottom.
    --for y = end_y, start_y, -1 do -- Start from `end_y` and go down to `start_y`
    for y_offset = 0, (end_y - start_y) do
        local y = end_y - y_offset
        -- Randomly decide whether to place a character at this position based on the density.
        if math.random(1, density) == 1 then
            -- Pick a random character from the `matrix_chars` table.
            local char = matrix_chars[math.random(1, #matrix_chars)]

            -- Set the character at the current (x, y) position in the buffer.
            buf:set_char(x, y, char)

            -- Randomly determine the color intensity of the character.
            local color_fg = get_random_color_intensity()
            buf:set_fg(x, y, color_fg)

            -- Create the tail
            if color_fg == 10 or color_fg == 15 then
                create_tail(x, y-1, rain_length) -- y-1 because the tail starts below
            end

            -- Create the fade
            if y > start_y then -- Check if y is not the first row
                local next_char = buf:get_char(x, y - 1)
                if next_char ~= nil then
                    if color_fg == 10 then
                        buf:set_fg(x, y-1, 2)
                    elseif color_fg == 15 then
                        buf:set_fg(x, y-1, 10)
                    elseif color_fg == 7 then
                         buf:set_fg(x,y-1,8)
                    end
                end
            end
        end
    end
end
