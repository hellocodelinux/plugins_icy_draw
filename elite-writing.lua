-- Title: Elite Text Converter

-- Path: Text

-- Description: Converts text to the Elite typewriter font using CP437 characters for ANSI.

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- This script uses parameters defined in the LUA_PARAMETERS.txt file.

-- https://github.com/hellocodelinux/plugins_icy_draw

table = {
    ["a"] = "α", ["A"] = "Ä",
    ["b"] = "ß", ["B"] = "ß",
    ["c"] = "¢", ["C"] = "Ç",
    ["d"] = "δ", ["D"] = "Ð",
    ["e"] = "ε", ["E"] = "Σ",
    ["f"] = "ƒ", ["F"] = "ƒ",
    ["g"] = "g", ["G"] = "G",
    ["h"] = "h", ["H"] = "H",
    ["i"] = "¡", ["I"] = "I",
    ["j"] = "j", ["J"] = "J",
    ["k"] = "k", ["K"] = "K",
    ["l"] = "£", ["L"] = "£",
    ["m"] = "m", ["M"] = "M",
    ["n"] = "π", ["N"] = "π",
    ["o"] = "φ", ["O"] = "σ",
    ["p"] = "p", ["P"] = "P",
    ["q"] = "q", ["Q"] = "Q",
    ["r"] = "τ", ["R"] = "₧",
    ["s"] = "$", ["S"] = "$",
    ["t"] = "Γ", ["T"] = "T",
    ["u"] = "û", ["U"] = "∩",
    ["v"] = "v", ["V"] = "V",
    ["w"] = "w", ["W"] = "W",
    ["x"] = "æ", ["X"] = "æ",
    ["y"] = "µ", ["Y"] = "Y",
    ["z"] = "z", ["Z"] = "Z"
}

for y = start_y, end_y, 1 do
    for x = start_x, end_x, 1 do
        local ch = buf:pickup_char(x, y)
        if table[ch] then
            buf:set_char(x, y, table[ch])
        end
    end
end
