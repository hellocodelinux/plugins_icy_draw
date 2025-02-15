-- Title: Lowercase to Uppercase Converter
-- Path: Text
-- Description: Converts all lowercase letters (a-z) to uppercase (A-Z).
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

local table = {
    ["a"] = "A", ["b"] = "B", ["c"] = "C", ["d"] = "D", ["e"] = "E",
    ["f"] = "F", ["g"] = "G", ["h"] = "H", ["i"] = "I", ["j"] = "J",
    ["k"] = "K", ["l"] = "L", ["m"] = "M", ["n"] = "N", ["o"] = "O",
    ["p"] = "P", ["q"] = "Q", ["r"] = "R", ["s"] = "S", ["t"] = "T",
    ["u"] = "U", ["v"] = "V", ["w"] = "W", ["x"] = "X", ["y"] = "Y",
    ["z"] = "Z"
}

for y = start_y, end_y, 1 do
    for x = start_x, end_x, 1 do
        local ch = buf:pickup_char(x, y)
        if table[ch] then
            buf:set_char(x, y, table[ch])
        end
    end
end
