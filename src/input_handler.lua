local Object = require("lib/classic")

local default_key_map = {
	left = "left",
	right = "right",
	up = "up",
	down = "down",
}

---@class InputHandler
local InputHandler = Object:extend()

function InputHandler:new()
	print("initialized handler")
end

function InputHandler:update(dt) end

function InputHandler:draw() end

return InputHandler
