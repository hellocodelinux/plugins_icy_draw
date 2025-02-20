-- Title: Lowercase to Uppercase Converter
-- Path: Text
-- Description: Converts all lowercase letters (a-z) to uppercase (A-Z).
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- A table (dictionary) that maps lowercase letters to their corresponding uppercase letters.
-- For example, "a" is mapped to "A", "b" to "B", and so on.
local table = {
    ["a"] = "A", ["b"] = "B", ["c"] = "C", ["d"] = "D", ["e"] = "E",
    ["f"] = "F", ["g"] = "G", ["h"] = "H", ["i"] = "I", ["j"] = "J",
    ["k"] = "K", ["l"] = "L", ["m"] = "M", ["n"] = "N", ["o"] = "O",
    ["p"] = "P", ["q"] = "Q", ["r"] = "R", ["s"] = "S", ["t"] = "T",
    ["u"] = "U", ["v"] = "V", ["w"] = "W", ["x"] = "X", ["y"] = "Y",
    ["z"] = "Z"
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
        
        -- Check if the character exists in the table (i.e., if it's a lowercase letter).
        -- If it exists, it means the character is a lowercase letter and has an uppercase equivalent.
        if table[ch] then
            -- Replace the lowercase letter with its uppercase equivalent.
            -- The function `buf:set_char(x, y, table[ch])` sets the new character at the same position.
            buf:set_char(x, y, table[ch])
        end
    end
end