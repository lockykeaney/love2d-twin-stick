local Object = require("lib/classic")

---@class Bullet
local Bullet = Object:extend()

-- Class constructor. Init with Entity(), not Entity:new()
function Bullet:new(x, y, dx, dy)
	self.x = x
	self.y = y
	self.dx = dx
	self.dy = dy
	self.speed = 500
end

function Bullet:update(dt)
	self.y = self.y + self.dy * self.speed * dt
	self.x = self.x + self.dx * self.speed * dt
end

function Bullet:draw()
	love.graphics.setColor(1, 1, 0.2)
	love.graphics.circle("fill", self.x, self.y, 10)
end

return Bullet
