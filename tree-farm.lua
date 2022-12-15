local function drop()
    turtle.turnRight()
    turtle.select(1)
    local logs = turtle.getItemCount() - 1
    turtle.drop(logs)

    for i=3,16 do
        turtle.select(i)
        turtle.drop()
    end
    turtle.select(1)
    turtle.turnLeft()
end

local function replant()
    turtle.select(2)
    turtle.place()
    turtle.select(1)
end

local function chop()
    turtle.dig()
    turtle.forward()
    while turtle.detectUp() do
        turtle.digUp()
        turtle.up()
    end
    while not turtle.detectDown() do
        if turtle.detect() then
            turtle.dig()
            turtle.turnRight()
            turtle.dig()
            turtle.turnRight()
            turtle.dig()
            turtle.turnRight()
            turtle.dig()
            turtle.turnRight()
        end
        turtle.down()
    end
    turtle.back()
    replant()
    turtle.back()
    drop()
end

local function detect()
    turtle.forward()
    local success, block = turtle.inspect()
    print(block["name"])
    if block["name"] == "biomesoplenty:redwood_log" then
        chop()
    else
        turtle.back()
    end
end


while true do
    detect()
    sleep(10)
end
