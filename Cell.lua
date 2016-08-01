Cell = {}
Cell.__index = Cell
local font = love.graphics.newFont(15)

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

function Cell:drawOptions()
  love.graphics.setColor(255, 128, 0)
  love.graphics.setFont(font)
  love.graphics.rectangle("line", self.x, self.y, self.width, self.width)

  local x = 1 + self.x
  local y = 1 + self.y
  local size = 17
  for n = 1,9 do
    love.graphics.setColor(255,128,0)
    if love.mouse.isDown(1) then
      if love.mouse.getX() >= x and love.mouse.getX() < x + size and
          love.mouse.getY() >= y and love.mouse.getY() < y + size then
        love.graphics.rectangle("fill", x, y, size, size)
        love.graphics.setColor(255, 255, 255)
        self.value = n
      end
    end
    love.graphics.printf(n, x, y, size, "center")
    x = x + size

    if n % 3 == 0 then
      x = 1 + self.x
      y = y + size
    end
  end
end

