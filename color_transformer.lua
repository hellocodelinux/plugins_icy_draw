-- Title: Color Transformer

-- Description: Transforms the colors of a rectangular region by inverting them.

local inversion_colores = {
    [0] = 8, [1] = 9, [2] = 10, [3] = 11, [4] = 12, [5] = 13, [6] = 14, [7] = 15,
    [8] = 0, [9] = 1, [10] = 2, [11] = 3, [12] = 4, [13] = 5, [14] = 6, [15] = 7
}

if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

for y = start_y, end_y do
    for x = start_x, end_x do
        local fg = buf:get_fg(x, y)
        local bg = buf:get_bg(x, y)

        local fg_invertido = inversion_colores[fg] or fg
        local bg_invertido = inversion_colores[bg] or bg

        buf:set_fg(x, y, fg_invertido)
        buf:set_bg(x, y, bg_invertido)
    end
end

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)