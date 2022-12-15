local function dropAll()
    for i=2,16 do
        turtle.select(i)
        turtle.drop()
    end
    turtle.select(1)
end

-- For a Python Set equivalent
local function inKeys(table, key)
  return table[key] ~= nil
end

-- For a Python Set equivalent
function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end
