-- Title: Matrix Digital Rain Pattern
-- Path: Patterns
-- Description: Creates a Matrix-style digital rain pattern using katakana characters and numbers.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- A table containing Katakana characters and numbers to simulate the "Matrix" digital rain effect.
local matrix_chars = {
    'ｱ', 'ｲ', 'ｳ', 'ｴ', 'ｵ', 'ｶ', 'ｷ', 'ｸ', 'ｹ', 'ｺ', 'ｻ', 'ｼ', 'ｽ', 'ｾ', 'ｿ',
    'ﾀ', 'ﾁ', 'ﾂ', 'ﾃ', 'ﾄ', 'ﾅ', 'ﾆ', 'ﾇ', 'ﾈ', 'ﾉ', 'ﾊ', 'ﾋ', 'ﾌ', 'ﾍ', 'ﾎ',
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
}

-- Ensure that start_x is less than or equal to end_x. If not, swap them.
if start_x > end_x then start_x, end_x = end_x, start_x end

-- Ensure that start_y is less than or equal to end_y. If not, swap them.
if start_y > end_y then start_y, end_y = end_y, start_y end

-- Seed the random number generator with the current time to ensure different results each run.
math.randomseed(os.time())

-- Loop through each column (x-coordinate) from start_x to end_x.
for x = start_x, end_x do
    -- Generate a random density value between 2 and 4. This controls how often characters appear.
    local density = math.random(2, 4)
    
    -- Loop through each row (y-coordinate) from start_y to end_y.
    for y = start_y, end_y do
        -- Randomly decide whether to place a character at this position based on the density.
        if math.random(1, density) == 1 then
            -- Pick a random character from the `matrix_chars` table.
            local char = matrix_chars[math.random(1, #matrix_chars)]
            
            -- Set the character at the current (x, y) position in the buffer.
            buf:set_char(x, y, char)
            
            -- Randomly determine the color intensity of the character.
            local color_chance = math.random(1, 10)
            if color_chance <= 6 then
                -- 60% chance to set the foreground color to bright green (color code 10).
                buf:set_fg(x, y, 10)
            elseif color_chance <= 8 then
                -- 20% chance to set the foreground color to light gray (color code 7).
                buf:set_fg(x, y, 7)
            else
                -- 20% chance to set the foreground color to dark gray (color code 8).
                buf:set_fg(x, y, 8)
            end
            
            -- Randomly adjust the intensity of the character's color.
            local intensity = math.random(0, 3)
            if intensity == 0 then
                -- 25% chance to set the foreground color to very dim green (color code 2).
                buf:set_fg(x, y, 2)
            elseif intensity == 3 then
                -- 25% chance to set the foreground color to very bright white (color code 15).
                buf:set_fg(x, y, 15)
            end
        end
    end
end

