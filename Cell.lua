Cell = {}
Cell.__index = Cell

function Cell.new(x, y)
  local c = {}
  setmetatable(c, Cell)
  c.value = 0
  c.x = x
  c.y = y
  c.width = 53
  c.isStatic = false
  return c
end

function Cell:isInBounds(x, y)
  return x >= self.x and x < self.x + self.width and
        y >= self.y and y < self.y + self.width
end
