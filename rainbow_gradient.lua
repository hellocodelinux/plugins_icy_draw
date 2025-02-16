-- Title: Rainbow Gradient
-- Path: Colors
-- Description: Applies a rainbow gradient to the foreground color.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Define an array of color codes representing different colors of the rainbow.
local colores = {1, 3, 2, 14, 4, 5}  -- Example: 1 = Red, 3 = Yellow, 2 = Green, etc.

-- Ensure that start_x is less than or equal to end_x. If not, swap them.
if start_x > end_x then
    start_x, end_x = end_x, start_x
end

-- Calculate the total width of the drawing area.
local ancho_total = end_x - start_x + 1

-- Divide the total width into segments, where each segment corresponds to one color in the rainbow.
local segmento = math.floor(ancho_total / #colores)  -- Base segment length
local residuo = ancho_total % #colores               -- Remaining pixels after division

-- Loop through each row (y-coordinate) from start_y to end_y.
for y = start_y, end_y do
    -- Track the current x position for distributing the residual pixels.
    local x_actual = start_x

    -- Loop through each color in the rainbow.
    for i = 1, #colores do
        -- Determine the width of the current segment.
        local ancho_segmento = segmento
        if i <= residuo then
            ancho_segmento = ancho_segmento + 1  -- Distribute the residual pixels.
        end

        -- Apply the current color to the segment.
        for x = x_actual, x_actual + ancho_segmento - 1 do
            if x > end_x then break end  -- Ensure we don't exceed the drawing area.

            -- Retrieve the current character and background color at position (x, y).
            local char = buf:get_char(x, y)
            local bg = buf:get_bg(x, y)

            -- Set the character back to its original value (no change to the character itself).
            buf:set_char(x, y, char)

            -- Set the foreground color to the corresponding color in the rainbow gradient.
            buf:set_fg(x, y, colores[i])

            -- Retain the original background color.
            buf:set_bg(x, y, bg)
        end

        -- Update the current x position for the next segment.
        x_actual = x_actual + ancho_segmento
    end
end
