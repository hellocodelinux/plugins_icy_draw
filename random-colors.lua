-- Title: Random Colors

if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

math.randomseed(os.time())

for y = start_y, end_y do
    for x = start_x, end_x do
        local color_fg = math.random(0, 15)
        local bg = buf:get_bg(x, y)
        
        while color_fg == bg do
            color_fg = math.random(0, 15)
        end
        
        buf:set_fg(x, y, color_fg)
    end
end
