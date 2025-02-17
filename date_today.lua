-- Title: Insert Today's Date
-- Path: Text
-- Description: Inserts today's date into the screen at a specified position.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

-- Get the current date in the format "YYYY-MM-DD"
local fecha_actual = os.date("%Y-%m-%d")

-- Loop through each character of the date string
for i = 1, #fecha_actual do
    -- Extract the current character from the date string
    local caracter = string.sub(fecha_actual, i, i)
    
    -- Set the character at the corresponding position on the screen
    buf:set_char(start_x + i - 1, start_y, caracter)
end