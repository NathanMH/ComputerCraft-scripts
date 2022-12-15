local function dropAll()
    for i=2,16 do
        turtle.select(i)
        turtle.drop()
    end
    turtle.select(1)
end

local function flax()
    turtle.dig()
    turtle.select(1)
    turtle.place()
end

local function wheat()
    local success, result = turtle.inspect()
    if result.state.age == 7 then
        turtle.dig()
        turtle.select(1)
        turtle.place()
    end
end


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
    elseif result.name == "storagedrawers:controller" then
        dropAll()
    end
        turtle.turnRight()
end