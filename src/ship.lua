
local ship = {}

local epsilon = 0.01

-- Ship
local ShipMethods = {}

function ShipMethods:moveShip()
   if dx < epsilon and dy < epsilon then
      dx = self.direction.x - self.x
      dy = self.direction.y - self.y

      dist = distance(self.x, self.y, self.direction.x, self.direction.y)

      self.x = self.x + (dx/dist)*(speed*width)
      self.y = self.y + (dy/dist)*(speed*height)
   end
end

-- can only be called in love.draw
function ShipMethods:draw()
   love.graphics.circle("fill", self.x, self.y, 10, 100)
end

local Ship = {__index = ShipMethods}

function ship.new()
   return setmetatable({
         x = 0, y = 0,
         direction = {
            x = 0,
            y = 0
         }
                }, Ship)
end

return ship
