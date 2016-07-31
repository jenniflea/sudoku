require "Cell"

local Game = {}

-- background
local sudokuBoard = love.graphics.newImage("sudokuBoard.png")

-- initialize all cells (aka 3 for testing purposes)
local cells = {}
local xValues = {157, 209, 261} --temporary thing
for index,xValue in ipairs(xValues) do -- also temp
  cells[index] = Cell.new(xValue, 32)
end

-- const vars
local BOARDTOP = 25
local BOARDLEFT = 150

function Game:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(sudokuBoard, BOARDLEFT, BOARDTOP, 0)

  -- this looks awful, i know. i'd prefer to not have a for loop here
  for index,cell in ipairs(cells) do
    if cell:isInBounds(love.mouse.getX(), love.mouse.getY()) then
      love.graphics.setColor(255, 128, 0)

      if love.mouse.isDown(1) then
        love.graphics.rectangle("fill", cell.x, cell.y,
                                cell.width, cell.width)
      else
        love.graphics.rectangle("line", cell.x, cell.y,
                                cell.width, cell.width)
      end
      break
    end
  end
end

function Game:keypressed(key, scancode, isrepeat) end

return Game
