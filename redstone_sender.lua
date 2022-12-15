local basalt = require("basalt") --> Load the basalt framework into the variable called "basalt"

rednet.open("bottom")

--> Now we want to create a base frame, we call the variable "main" - by default everything you create is visible. (you don't need to use :show())
local main = basalt.createFrame():setMonitor("top")

local coalButton = main:addButton()
-- coalButton:setPosition(4, 4)
coalButton:setPosition("parent.w * 0.25 - 8", "parent.h * 0.25")
coalButton:setSize(16, 3)
coalButton:setBorder(colors.red, "left", "right", "top", "bottom")
coalButton:setText("Coal Power")

local creosoteButton = main:addButton()
creosoteButton:setPosition("parent.w * 0.75 - 8", "parent.h * 0.25")
creosoteButton:setSize(16, 3)
creosoteButton:setBorder(colors.red, "left", "right", "top", "bottom")
creosoteButton:setText("Creosote Power")

local fruitButton = main:addButton()
fruitButton:setPosition("parent.w * 0.25 - 8", "parent.h * 0.75")
fruitButton:setSize(16, 3)
fruitButton:setBorder(colors.red, "left", "right", "top", "bottom")
fruitButton:setText("Fruit Power")

local ToDoButton = main:addButton()
ToDoButton:setPosition("parent.w * 0.75 - 8", "parent.h * 0.75")
ToDoButton:setSize(16, 3)
ToDoButton:setBorder(colors.red, "left", "right", "top", "bottom")
ToDoButton:setText("BLANK")

local function rsPower(comp, color) --> Let us create a function we want to call when the button gets clicked 
    rednet.send(comp, color)
end

local function setupButtonColoring(self, event, button, x, y)
    self:onClick(function()
        self:setBackground(colors.black)
        self:setForeground(colors.lightGray)
        rednet.send(event[1], event[2])
    end)
    self:onClickUp(function()
        self:setBackground(colors.gray)
        self:setForeground(colors.black)
    end)
    self:onLoseFocus(function()
        self:setBackground(colors.gray)
        self:setForeground(colors.black)
    end)
end


-- Now we just need to register the function to the buttons onClick event handlers, this is how we can achieve that:
setupButtonColoring(coalButton, {9, "black"})
setupButtonColoring(creosoteButton, {9, "brown"})
setupButtonColoring(fruitButton, {9, "pink"})
setupButtonColoring(ToDoButton, {9, "white"})


basalt.autoUpdate() -- As soon as we call basalt.autoUpdate, the event and draw handlers will listen to any incomming events (and draw if necessary)