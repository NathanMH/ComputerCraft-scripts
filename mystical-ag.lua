while true do
    suc, details = turtle.inspect()
    if details.name ~= nil then 
        if details.state.age == 7 then
            turtle.dig()
            turtle.place()
            turtle.select(2)
            turtle.dropUp()
            turtle.select(1)
        else
            turtle.turnRight()
        end
    else
        turtle.turnRight()
    end
end