local basalt = require("basalt")

local main = basalt.createFrame()
local button = main:addButton()
  :setPosition(3,3)
  :setSize(12,3)
  :setText("Hover")

function buttonOnHover()
  basalt.debug("The mouse hovers over the button!")
end
button:onHover(buttonOnHover)


basalt.autoUpdate() -- As soon as we call basalt.autoUpdate, the event and draw handlers will listen to any incomming events (and draw if necessary)