

speed = 1/10000

function love.load()
   print("Welcome to spacesim")
   width, height = love.graphics.getDimensions()
   print("Screen dimensions: "..tostring(width).."x"..tostring(height))

   love.mouse.setGrabbed(true)

   myship = Ship:new()
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

-- Ship
Ship = {
   x = 0, y = 0,
   direction = {
      x = 0,
      y = 0
   }
}
function Ship:new(o)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   return o
end

function Ship:moveShip()
   if self.direction.x ~= 0 and self.direction.y ~= 0 then
      dx = self.direction.x - self.x
      dy = self.direction.y - self.y

      dist = distance(self.x, self.y, self.direction.x, self.direction.y)

      self.x = self.x + (dx/dist)*(speed*width)
      self.y = self.y + (dy/dist)*(speed*height)
   end
end

-- can only be called in love.draw
function Ship:draw()
   love.graphics.circle("fill", self.x, self.y, 10, 100)
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
