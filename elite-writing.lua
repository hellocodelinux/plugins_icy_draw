-- Title: Elite Text Converter
-- Path: Text
-- Description: Converts text to the Elite typewriter font using CP437 characters for ANSI.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Conversion table that maps regular letters to their Elite font equivalents
-- Each letter has a normal and uppercase variant
table = {
    -- Lowercase 'a' becomes 'α', uppercase 'A' becomes 'Ä'
    ["a"] = "α", ["A"] = "Ä",
    -- Lowercase and uppercase 'b' become 'ß'
    ["b"] = "ß", ["B"] = "ß",
    -- Lowercase 'c' becomes '¢', uppercase 'C' becomes 'Ç'
    ["c"] = "¢", ["C"] = "Ç",
    -- Lowercase 'd' becomes 'δ', uppercase 'D' becomes 'Ð'
    ["d"] = "δ", ["D"] = "Ð",
    -- Lowercase 'e' becomes 'ε', uppercase 'E' becomes 'Σ'
    ["e"] = "ε", ["E"] = "Σ",
    -- Lowercase 'f' becomes 'ƒ', uppercase 'F' becomes 'ƒ'
    ["f"] = "ƒ", ["F"] = "ƒ",
    -- Lowercase 'g' becomes 'g', uppercase 'G' becomes 'G'
    ["g"] = "g", ["G"] = "G",
    -- Lowercase 'h' becomes 'h', uppercase 'H' becomes 'H'
    ["h"] = "h", ["H"] = "H",
    -- Lowercase 'i' becomes '¡', uppercase 'I' becomes 'I'
    ["i"] = "¡", ["I"] = "I",
    -- Lowercase 'j' becomes 'j', uppercase 'J' becomes 'J'
    ["j"] = "j", ["J"] = "J",
    -- Lowercase 'k' becomes 'k', uppercase 'K' becomes 'K'
    ["k"] = "k", ["K"] = "K",
    -- Lowercase 'l' becomes '£', uppercase 'L' becomes '£'
    ["l"] = "£", ["L"] = "£",
    -- Lowercase 'm' becomes 'm', uppercase 'M' becomes 'M'
    ["m"] = "m", ["M"] = "M",
    -- Lowercase 'n' becomes 'π', uppercase 'N' becomes 'π'
    ["n"] = "π", ["N"] = "π",
    -- Lowercase 'o' becomes 'φ', uppercase 'O' becomes 'σ'
    ["o"] = "φ", ["O"] = "σ",
    -- Lowercase 'p' becomes 'p', uppercase 'P' becomes 'P'
    ["p"] = "p", ["P"] = "P",
    -- Lowercase 'q' becomes 'q', uppercase 'Q' becomes 'Q'
    ["q"] = "q", ["Q"] = "Q",
    -- Lowercase 'r' becomes 'τ', uppercase 'R' becomes '₧'
    ["r"] = "τ", ["R"] = "₧",
    -- Lowercase 's' becomes '$', uppercase 'S' becomes '$'
    ["s"] = "$", ["S"] = "$",
    -- Lowercase 't' becomes 'Γ', uppercase 'T' becomes 'T'
    ["t"] = "Γ", ["T"] = "T",
    -- Lowercase 'u' becomes 'û', uppercase 'U' becomes '∩'
    ["u"] = "û", ["U"] = "∩",
    -- Lowercase 'v' becomes 'v', uppercase 'V' becomes 'V'
    ["v"] = "v", ["V"] = "V",
    -- Lowercase 'w' becomes 'w', uppercase 'W' becomes 'W'
    ["w"] = "w", ["W"] = "W",
    -- Lowercase 'x' becomes 'æ', uppercase 'X' becomes 'æ'
    ["x"] = "æ", ["X"] = "æ",
    -- Lowercase 'y' becomes 'µ', uppercase 'Y' becomes 'Y'
    ["y"] = "µ", ["Y"] = "Y",
    -- Lowercase 'z' becomes 'z', uppercase 'Z' becomes 'Z'
    ["z"] = "z", ["Z"] = "Z"
}

-- Main loop that processes the selected area in the buffer
-- Iterates through each character position vertically (y-axis)
for y = start_y, end_y, 1 do
    -- For each row, iterate through each character horizontally (x-axis)
    for x = start_x, end_x, 1 do
        -- Get the character at the current position
        local ch = buf:pickup_char(x, y)
        -- If the character exists in our conversion table, replace it
        if table[ch] then
            buf:set_char(x, y, table[ch])
        end
    end
end
