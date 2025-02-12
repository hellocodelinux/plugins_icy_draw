-- Title: random blocks fill

local blocks = {'█', '▓', '▒', '░'}

math.randomseed(os.time())

for y = start_y, end_y do
    for x = start_x, end_x do
        local random_block = blocks[math.random(1, #blocks)]
        buf:set_char(x, y, random_block)
    end
end
