--[[
This program is good for wheat, flax and melons/pumpkins and will drop items into a chest above the turtle
--]]

-- Drops all items into a chest/drawer controller above the turtle
local function dropAll()
    for i=4,16 do
        turtle.select(i)
        turtle.dropUp()
    end
    turtle.select(1)
end

-- Wheat is in slot 1
local function wheat()
    local success, result = turtle.inspect()
    if result.state.age == 7 then
        turtle.dig()
        turtle.select(1)
        turtle.place()
    end
end

-- Flax is in slot 2
local function flax()
    turtle.dig()
    turtle.select(2)
    turtle.place()
end

-- Main routine
while true do

    local success, result = turtle.inspect()
    if success and result.name == "minecraft:wheat" then
        wheat()
    elseif result.name == "minecraft:melon" or result.name == "minecraft:pumpkin" then
        turtle.dig()
    elseif result.name == "thermal:flax" then
        if result.state.age == 6 then
            flax()
        end
    end
    turtle.turnRight()
    dropAll()
end