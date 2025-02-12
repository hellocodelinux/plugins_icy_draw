-- Title: vertical gradient

local soblock = '█'
local shblock = '▓'
local hablock = '▒'
local doblock = '░'

for y = start_y, end_y do
    local total_width = end_x - start_x + 1
    local zone_width = math.ceil(total_width / 4)
    
    for x = start_x, end_x do
        local relative_x = x - start_x
        local char_to_use
        
        if relative_x < zone_width then
            char_to_use = soblock
        elseif relative_x < zone_width * 2 then
            char_to_use = shblock
        elseif relative_x < zone_width * 3 then
            char_to_use = hablock
        else
            char_to_use = doblock
        end
        
        buf:set_char(x, y, char_to_use)
    end
end
