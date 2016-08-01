require "Cell"

local Game = {}

-- background
local sudokuBoard = love.graphics.newImage("sudokuBoard.png")

-- const vars
local BOARDTOP = 25
local BOARDLEFT = 150
local CELLTOP = 32
local CELLLEFT = 157
local FONT = love.graphics.newFont(45)

-- initialize all cells
local cells = {}

local xValue = CELLLEFT
local yValue = CELLTOP
local xCount = 1
local yCount = 1

for y = 1,9 do
  for x = 1,9 do
    cells[9*(y-1)+x] = Cell.new(xValue, yValue)
    xValue = xValue + cells[1].width - 1

    --every 3 cells, add 7 pixels (for borders)
    if xCount % 3 == 0 then
      xValue = xValue + 7
      xCount = 0
    end
    xCount = xCount + 1
  end

  yValue = yValue + cells[1].width - 1
  xValue = CELLLEFT

  --every 3 vertical cells, add 7 pixels (for borders)
  if yCount % 3 == 0 then
    yValue = yValue + 7
    yCount = 0
  end
  yCount = yCount + 1
end

function Game:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(sudokuBoard, BOARDLEFT, BOARDTOP, 0)

  --for every cell in Sudoku board
  for index,cell in ipairs(cells) do
    love.graphics.setFont(FONT)

    --if cell contains a pre-defined value, print value
    if cell.isStatic then
      love.graphics.setColor(0,0,0)
      love.graphics.printf(cell.value, cell.x, cell.y, cell.width, "center")
    else
      
        --if mouse is not hovering over cell
      if not cell:isInBounds(love.mouse.getX(), love.mouse.getY()) then

        --if cell contains a number, print value
        if cell.value ~= 0 then
          love.graphics.setColor(0,51,255)
          love.graphics.printf(cell.value, cell.x, cell.y,
                                cell.width, "center")
        end
      else

        --if cell contains a number
        if cell.value ~= 0 then
          love.graphics.setColor(0,51,255,75)
          love.graphics.printf(cell.value, cell.x, cell.y,
                                cell.width, "center")
        end
        cell:drawOptions()
      end
    end
  end
end

function Game:keypressed(key, scancode, isrepeat) end

return Game
