-- Title: Single-Line Frame
-- Path: Borders
-- Description: Draws a single-line frame around a rectangular region.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

local estilo_simple = {
    esquina_sup_izq = '┌',
    esquina_sup_der = '┐',
    esquina_inf_izq = '└',
    esquina_inf_der = '┘',
    horizontal = '─',
    vertical = '│'
}

if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

buf:set_char(start_x, start_y, estilo_simple.esquina_sup_izq)
buf:set_char(end_x, start_y, estilo_simple.esquina_sup_der)
buf:set_char(start_x, end_y, estilo_simple.esquina_inf_izq)
buf:set_char(end_x, end_y, estilo_simple.esquina_inf_der)

for x = start_x + 1, end_x - 1 do
    buf:set_char(x, start_y, estilo_simple.horizontal)
    buf:set_char(x, end_y, estilo_simple.horizontal)
end

for y = start_y + 1, end_y - 1 do
    buf:set_char(start_x, y, estilo_simple.vertical)
    buf:set_char(end_x, y, estilo_simple.vertical)
end