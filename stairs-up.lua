local function placeStairs()
    if turtle.place() then
        turtle.up()
        turtle.forward()
    else
        findNonEmpty()
    end
end

local function findNonEmpty()

    local count = 1
    turtle.select(count)

    while turtle.getItemCount() == 0 do
        count = count + 1
        turtle.select(count)
    end

end

while true do
    placeStairs()
end