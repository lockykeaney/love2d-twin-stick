local Object = require("lib/classic")

---@class Bullets
local Bullets = Object:extend()

-- Class constructor. Init with Entity(), not Entity:new()
function Bullets:new(x, y)
	self.x = x
	self.y = y
	self.table = {}
end

function Bullets:create()
	local new_bullet = {
		x = self.x,
		y = self.y,
		dx = 0,
		dy = 0,
	}
	table.insert(self.table, 1, new_bullet)
end

function Bullets:update(dt) end

function Bullets:draw()
	love.graphics.setColor(1, 1, 0.2)
	love.graphics.circle("fill", self.x, self.y, 10)
end

return Bullets
