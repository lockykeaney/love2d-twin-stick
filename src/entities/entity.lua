local Object = require("lib/classic")

---@class Entity
local Entity = Object:extend()

-- Class constructor. Init with Entity(), not Entity:new()
---@param name string
---@param x number
---@param y number
function Entity:new(name, x, y)
	self.name = name
	self.x = x
	self.y = y
	print("entity", self.name)
end

function Entity:update(dt) end

function Entity:draw() end

return Entity
