

local ship = require 'ship'

speed = 1/10000

function love.load()
   print("Welcome to spacesim")
   width, height = love.graphics.getDimensions()
   print("Screen dimensions: "..tostring(width).."x"..tostring(height))

   love.mouse.setGrabbed(true)

   myship = ship.new()
end

function love.draw()
   love.graphics.print("position: "..tostring(myship.x)..", "..tostring(myship.y).."\n".."direction: "..tostring(myship.direction.x)..", "..tostring(myship.direction.y))

   myship:draw()
end

function love.update(dt)
   myship:moveShip()
end

function love.mousepressed(x, y, button)
   if button == "r" then
      myship.direction.x = x
      myship.direction.y = y
   end
end

-- move point1 to point2
--[[
   d = point2 - point1
   newpoint1 = point1 + d/dist(d)
--]]

-- coordinate math
function distance(x1,y1, x2,y2)
   return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end
