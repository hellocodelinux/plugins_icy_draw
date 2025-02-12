-- Title: Invert Colors

-- Plugin: Convertir colores oscuros a brillantes y brillantes a oscuros

-- Tabla de inversión de colores ANSI (oscuros <-> brillantes)
local inversion_colores = {
    [0] = 8, [1] = 9, [2] = 10, [3] = 11, [4] = 12, [5] = 13, [6] = 14, [7] = 15,
    [8] = 0, [9] = 1, [10] = 2, [11] = 3, [12] = 4, [13] = 5, [14] = 6, [15] = 7
}

-- Asegurarse de que las coordenadas de inicio sean menores o iguales a las de fin
if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

-- Recorrer el área seleccionada
for y = start_y, end_y do
    for x = start_x, end_x do
        -- Obtener los colores actuales (usando los métodos 'fg' y 'bg' definidos en el código Rust)
        local fg = buf:get_fg(x, y)
        local bg = buf:get_bg(x, y)

        -- Invertir los colores de primer plano y fondo utilizando la tabla de inversión
        local fg_invertido = inversion_colores[fg] or fg
        local bg_invertido = inversion_colores[bg] or bg

        -- Establecer los colores invertidos utilizando los métodos de Icy Draw
        buf:set_fg(x, y, fg_invertido)
        buf:set_bg(x, y, bg_invertido)
    end
end

