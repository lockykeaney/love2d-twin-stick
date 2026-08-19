local Object = require("lib/classic")

---@class Events
local Events = Object:extend()

-- Class constructor. Init with Entity(), not Entity:new()
function Events:new(x, y)
	self.log = {}
end

function Events:update(dt) end

function Events:draw() end

return Events
