local Object = require("lib/classic")

---@class Entity
local Entity = Object:extend()

-- Class constructor. Init with Entity(), not Entity:new()
function Entity:new(x, y)
	self.x = x
	self.y = y
end

function Entity:update(dt) end

function Entity:draw() end

return Entity
