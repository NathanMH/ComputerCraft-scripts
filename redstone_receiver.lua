rednet.open("top")

while true do
    local senderId, message, protocol = rednet.receive()

    local currentRS = redstone.getBundledOutput("back")
    local testColor = colors.test(currentRS, colors[message])
    print(testColor)

    if testColor then -- if color is already on, then turn off color from back
        redstone.setBundledOutput("back", colors.subtract(currentRS, colors[message]))
        print("Turned off: " .. message)

    else -- add color to back
        redstone.setBundledOutput("back", colors.combine(colors[message]))
        print("Turned on: " .. message)
    end
end