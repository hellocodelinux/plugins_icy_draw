-- Title: Uppercase to Lowercase Converter

-- Path: Text

-- Description: Converts all uppercase letters (A-Z) to lowercase (a-z).

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- This script uses parameters defined in the LUA_PARAMETERS.txt file.

-- https://github.com/hellocodelinux/plugins_icy_draw

local table = {
    ["A"] = "a", ["B"] = "b", ["C"] = "c", ["D"] = "d", ["E"] = "e",
    ["F"] = "f", ["G"] = "g", ["H"] = "h", ["I"] = "i", ["J"] = "j",
    ["K"] = "k", ["L"] = "l", ["M"] = "m", ["N"] = "n", ["O"] = "o",
    ["P"] = "p", ["Q"] = "q", ["R"] = "r", ["S"] = "s", ["T"] = "t",
    ["U"] = "u", ["V"] = "v", ["W"] = "w", ["X"] = "x", ["Y"] = "y",
    ["Z"] = "z"
}

for y = start_y, end_y, 1 do
    for x = start_x, end_x, 1 do
        local ch = buf:pickup_char(x, y)
        if table[ch] then
            buf:set_char(x, y, table[ch])
        end
    end
end
