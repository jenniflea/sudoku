Title = require "Title"
Game = require "Game"

currentState = Title

function love.load()
  currentState.load()
end

function love.draw()
  currentState.draw()
end

function love.keypressed(key, scancode, isrepeat)
  currentState.keypressed(key, scancode, isrepeat)
end

