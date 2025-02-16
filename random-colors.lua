-- Title: Random Colors
-- Path: Colors
-- Description: Creates high-contrast random foreground colors while preserving backgrounds. Uses bright colors (8-15) on dark backgrounds and dark colors (0-7) on bright backgrounds for optimal readability.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

local function is_bright_color(color)
    return color >= 7
end

local function get_random_dark()
    return math.random(0, 7)
end

local function get_random_bright()
    return math.random(8, 15)
end

if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

math.randomseed(os.time())

for y = start_y, end_y do
    for x = start_x, end_x do
        local bg = buf:get_bg(x, y)
        local color_fg
        
        if is_bright_color(bg) then
            color_fg = get_random_dark()
        else
            color_fg = get_random_bright()
        end
        
        while color_fg == bg do
            if is_bright_color(bg) then
                color_fg = get_random_dark()
            else
                color_fg = get_random_bright()
            end
        end
        
        buf:set_fg(x, y, color_fg)
    end
end
