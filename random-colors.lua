-- Title: Random Colors
-- Path: Colors
-- Description: Creates high-contrast random foreground colors while preserving backgrounds. Avoids low-contrast combinations.
-- Author: Eduardo Castillo (hellocodelinux@gmail.com)

-- A function to determine if a color is considered "bright."
-- Bright colors are those with a value greater than or equal to 7.
local function is_bright_color(color)
    return color >= 7
end

-- A function to generate a random dark color.
-- Dark colors are in the range 1 to 6.
local function get_random_dark()
    local color = math.random(1, 6)
    return color
end

-- A function to generate a random bright color.
-- Bright colors are in the range 9 to 14.
local function get_random_bright()
    return math.random(9, 14)
end

-- Ensure that start_x is less than or equal to end_x. If not, swap them.
if start_x > end_x then
    start_x, end_x = end_x, start_x
end

-- Ensure that start_y is less than or equal to end_y. If not, swap them.
if start_y > end_y then
    start_y, end_y = end_y, start_y
end

-- Seed the random number generator with the current time to ensure different results each run.
math.randomseed(os.time())

-- Loop through each row (y-coordinate) from start_y to end_y.
for y = start_y, end_y do
    -- Loop through each column (x-coordinate) from start_x to end_x.
    for x = start_x, end_x do
        -- Retrieve the background color at the current position (x, y).
        local bg = buf:get_bg(x, y)
        
        -- Initialize the foreground color variable.
        local color_fg
        
        -- Determine whether the background color is bright or dark.
        -- If the background is bright, choose a dark foreground color.
        -- If the background is dark, choose a bright foreground color.
        if is_bright_color(bg) then
            color_fg = get_random_dark()
        else
            color_fg = get_random_bright()
        end
        
        -- Ensure that the foreground color is not the same as the background color.
        -- This avoids low-contrast combinations where the text would blend into the background.
        while color_fg == bg do
            if is_bright_color(bg) then
                color_fg = get_random_dark()
            else
                color_fg = get_random_bright()
            end
        end
        
        -- Set the foreground color at the current position (x, y) to the chosen color.
        buf:set_fg(x, y, color_fg)
    end
end
