require "Cell"

local Game = {}

-- background
local sudokuBoard = love.graphics.newImage("sudokuBoard.png")

-- const vars
local BOARDTOP = 25
local BOARDLEFT = 150
local CELLTOP = 32
local CELLLEFT = 157

-- initialize all cells
local cells = {}

local xValue = CELLLEFT
local yValue = CELLTOP
local counter = 1
local count = 1

--this is gross, i know. i'll fix it when it's not 3:30am
for y = 1,9 do
  for x = 1,9 do
    cells[9*(y-1)+x] = Cell.new(xValue, yValue)
    xValue = xValue + cells[1].width - 1

    if count % 3 == 0 then
      xValue = xValue + 7
      count = 0
    end
    count = count + 1
  end

  yValue = yValue + cells[1].width - 1
  xValue = CELLLEFT

  if counter % 3 == 0 then
    yValue = yValue + 7
    counter = 0
  end
  counter = counter + 1
end

function Game:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(sudokuBoard, BOARDLEFT, BOARDTOP, 0)

  local c = 0
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
