-- Title: Uppercase to Lowercase Converter
-- Path: Text
-- Description: Converts all uppercase letters (A-Z) to lowercase (a-z).
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- A table (dictionary) that maps uppercase letters to their corresponding lowercase letters.
-- For example, "A" is mapped to "a", "B" to "b", and so on.
local table = {
    ["A"] = "a", ["B"] = "b", ["C"] = "c", ["D"] = "d", ["E"] = "e",
    ["F"] = "f", ["G"] = "g", ["H"] = "h", ["I"] = "i", ["J"] = "j",
    ["K"] = "k", ["L"] = "l", ["M"] = "m", ["N"] = "n", ["O"] = "o",
    ["P"] = "p", ["Q"] = "q", ["R"] = "r", ["S"] = "s", ["T"] = "t",
    ["U"] = "u", ["V"] = "v", ["W"] = "w", ["X"] = "x", ["Y"] = "y",
    ["Z"] = "z"
}

-- Loop through each row (y-coordinate) from start_y to end_y.
-- The loop increments by 1 each time (the third argument '1' is the step).
for y = start_y, end_y, 1 do
    -- Loop through each column (x-coordinate) from start_x to end_x.
    -- Similarly, this loop also increments by 1 each time.
    for x = start_x, end_x, 1 do
        -- Pick up the character at the current position (x, y) from the buffer.
        -- The function `buf:pickup_char(x, y)` retrieves the character at the specified coordinates.
        local ch = buf:pickup_char(x, y)
        
        -- Check if the character exists in the table (i.e., if it's an uppercase letter).
        -- If it exists, it means the character is an uppercase letter and has a lowercase equivalent.
        if table[ch] then
            -- Replace the uppercase letter with its lowercase equivalent.
            -- The function `buf:set_char(x, y, table[ch])` sets the new character at the same position.
            buf:set_char(x, y, table[ch])
        end
    end
end