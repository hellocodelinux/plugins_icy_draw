-- Title: Random Mandala Generator
-- Path: Patterns
-- Description: Generates a symmetrical mandala pattern using half blocks
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)
-- This script uses parameters defined in the LUA_PARAMETERS.txt file.
-- https://github.com/hellocodelinux/plugins_icy_draw

local blocks = {'█', ' '}
math.randomseed(os.time())

local width = end_x - start_x + 1
local height = end_y - start_y + 1
local center_x = start_x + math.floor(width / 2)
local center_y = start_y + math.floor(height / 2)
local radius = math.max(width, height)

local function mirror_position(x, y, cx, cy)
    return {
        {cx - (x - cx), y},           
        {x, cy - (y - cy)},           
        {cx - (x - cx), cy - (y - cy)} 
    }
end

for y = start_y, center_y do
    for x = start_x, center_x do
        if math.sqrt((x - center_x)^2 + (y - center_y)^2) <= radius then
            local block = blocks[math.random(1, #blocks)]
            
            buf:set_char(x, y, block)
            
            local mirrors = mirror_position(x, y, center_x, center_y)
            for _, pos in ipairs(mirrors) do
                if pos[1] <= end_x and pos[2] <= end_y then
                    buf:set_char(pos[1], pos[2], block)
                end
            end
        end
    end
end
