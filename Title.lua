local Title = {}
local font
local smallerFont

function Title:load()
  font = love.graphics.newFont(60)
  smallerFont = love.graphics.newFont(30)
end

function Title:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.setFont(font)
  love.graphics.print("SUDOKU!", 50, 25)
  love.graphics.setFont(smallerFont)
  love.graphics.print("To start, press ENTER", 400, 450)
end

function Title:keypressed(key, scancode, isrepeat)
  if key == "return" then
    currentState = Game
  end
end

return Title
