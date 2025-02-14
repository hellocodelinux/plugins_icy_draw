-- Title: Matrix Digital Rain Pattern

-- Description: Creates a Matrix-style digital rain pattern using katakana characters and numbers.

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- This script uses parameters defined in the LUA_PARAMETERS.txt file.

-- https://github.com/hellocodelinux/plugins_icy_draw

local matrix_chars = {
    'ｱ', 'ｲ', 'ｳ', 'ｴ', 'ｵ', 'ｶ', 'ｷ', 'ｸ', 'ｹ', 'ｺ', 'ｻ', 'ｼ', 'ｽ', 'ｾ', 'ｿ',
    'ﾀ', 'ﾁ', 'ﾂ', 'ﾃ', 'ﾄ', 'ﾅ', 'ﾆ', 'ﾇ', 'ﾈ', 'ﾉ', 'ﾊ', 'ﾋ', 'ﾌ', 'ﾍ', 'ﾎ',
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
}

if start_x > end_x then start_x, end_x = end_x, start_x end
if start_y > end_y then start_y, end_y = end_y, start_y end

math.randomseed(os.time())

for x = start_x, end_x do
    local density = math.random(2, 4)
    for y = start_y, end_y do
        if math.random(1, density) == 1 then
            local char = matrix_chars[math.random(1, #matrix_chars)]
            buf:set_char(x, y, char)
            local color_chance = math.random(1, 10)
            if color_chance <= 6 then
                buf:set_fg(x, y, 10)
            elseif color_chance <= 8 then
                buf:set_fg(x, y, 7)
            else
                buf:set_fg(x, y, 8)
            end
            local intensity = math.random(0, 3)
            if intensity == 0 then
                buf:set_fg(x, y, 2)
            elseif intensity == 3 then
                buf:set_fg(x, y, 15)
            end
        end
    end
end

