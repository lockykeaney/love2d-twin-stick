local Object = require("lib/classic")

---@class Entity
local Entity = Object:extend()

-- Class constructor. Init with Entity(), not Entity:new()
---@param name string
function Entity:new(name)
	self.name = name
	self.logger = function()
		print(self.name)
	end
end

function Entity:update(dt)
	self.logger()
end

function Entity:draw() end

return Entity
