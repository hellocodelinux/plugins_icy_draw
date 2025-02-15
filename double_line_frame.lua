-- Title: Double-Line Frame

-- Path: Borders

-- Description: Draws a double-line frame around a rectangular region.

-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- This script uses parameters defined in the LUA_PARAMETERS.txt file.

-- https://github.com/hellocodelinux/plugins_icy_draw

local estilo_doble = {
    esquina_sup_izq = '╔',
    esquina_sup_der = '╗',
    esquina_inf_izq = '╚',
    esquina_inf_der = '╝',
    horizontal = '═',
    vertical = '║'
}

if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

buf:set_char(start_x, start_y, estilo_doble.esquina_sup_izq)
buf:set_char(end_x, start_y, estilo_doble.esquina_sup_der)
buf:set_char(start_x, end_y, estilo_doble.esquina_inf_izq)
buf:set_char(end_x, end_y, estilo_doble.esquina_inf_der)

for x = start_x + 1, end_x - 1 do
    buf:set_char(x, start_y, estilo_doble.horizontal)
    buf:set_char(x, end_y, estilo_doble.horizontal)
end

for y = start_y + 1, end_y - 1 do
    buf:set_char(start_x, y, estilo_doble.vertical)
    buf:set_char(end_x, y, estilo_doble.vertical)
end
