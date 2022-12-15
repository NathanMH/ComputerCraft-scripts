function inTable(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

local function unfill_8()
    local crafting_spaces = {1,2,3,5,7,9,10,11}
    for i=1,11 do
        if inTable(crafting_spaces, i) then
            turtle.select(i)
            turtle.dropUp()
        end
    end
end

local function fill_8()
    local crafting_spaces = {1,2,3,5,7,9,10,11}
    for i=1,11 do
        if inTable(crafting_spaces, i) then
            turtle.select(i)
            turtle.suckUp()
            if turtle.getItemCount() ~= 64 then
                unfill_8()
                sleep(30)
                return "Not enough melons"
            end
        end
    end
end

local function fruit_punch()
    -- need spaces [1,2,3,5,7,9,10,11]
    fill_8()
    turtle.craft(64)
    turtle.select(11)
    turtle.dropDown()
end

local function melon_juice()
    -- get juicer item from chest in front and melons from above
    turtle.select(1)
    turtle.suck()

    -- Get 2 full stacks of melon
    turtle.select(2)
    turtle.suckUp()
    local melon1 = turtle.getItemCount()
    turtle.select(3)
    turtle.suckUp()
    local melon2 = turtle.getItemCount()

    -- If full stacks then craft and ready for punch
    if melon1 == 64 and melon2 == 64 then
        turtle.select(6) -- middle for next craft
        turtle.craft(64)
        -- drop the juicer in chest in front
        turtle.select(1)
        turtle.drop()
    else
        turtle.select(2)
        turtle.dropUp()
        turtle.select(3)
        turtle.dropUp()
    end
    sleep(15)
end

while true do
    -- Check slot 1 and 6 to see which func to run
    turtle.select(1)
    local curr_stat_1 = turtle.getItemDetail() or {name = "none"}
    turtle.select(6)
    local curr_stat_6 = turtle.getItemDetail() or {name = "none"}


    if curr_stat_1.name == "pamhc2foodcore:juiceritem" then
        melon_juice()
    elseif curr_stat_6.name == "pamhc2foodcore:melonjuiceitem" then
        fruit_punch()
    elseif curr_stat_1.name == "none" then
        melon_juice()
    else
        sleep(30)
    end
end