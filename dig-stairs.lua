local function digStairs()
    turtle.digDown()
    turtle.down()
    turtle.dig()
    turtle.forward()
    turtle.dig()
    turtle.digUp()
end

while true do

    digStairs()


end