-- Title: shadow

-- Plugin: Crear sombra punteada

-- Caracteres de bloques
local solid_block = '█'  -- Bloque sólido
local dotted_block = '░' -- Bloque punteado para la sombra

-- Recorrer el área seleccionada
for y = start_y, end_y do
    for x = start_x, end_x do
        -- Obtener el carácter en la posición actual
        local ch = buf:get_char(x, y)
        -- Verificar si es un bloque sólido
        if ch == solid_block then
            -- Obtener el carácter a la derecha
            local right_char = buf:get_char(x + 1, y)
            -- Si no hay carácter a la derecha, agregar sombra
            if right_char == ' ' or right_char == nil then
                -- Obtener colores del bloque actual
                local fg = buf:get_fg(x, y)
                local bg = buf:get_bg(x, y)
                -- Establecer el carácter de sombra punteada a la derecha
                buf:set_char(x + 1, y, dotted_block)
                buf:set_fg(x + 1, y, fg) -- Mantener el mismo color de primer plano
                buf:set_bg(x + 1, y, bg) -- Mantener el mismo color de fondo
            end
        end
    end
end