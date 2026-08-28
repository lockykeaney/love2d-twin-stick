local Entity = require("entities/entity")

local Bullet = Entity:extend()

---@param x number
---@param y number
---@param dx number
---@param dy number
function Bullet:new(x, y, dx, dy)
	Bullet.super.new(self, "Bullet", x, y)
	self.dx = dx
	self.dy = dy
	self.speed = 1000
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
