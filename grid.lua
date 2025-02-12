-- Title: Grid Pattern

local spacing = 1

if start_x > end_x then
    start_x, end_x = end_x, start_x
end
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

for y = start_y, end_y, spacing do
    for x = start_x, end_x, spacing do
        buf:set_char(x, y, '┼')
    end
end
