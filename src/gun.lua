local Object = require("lib/classic")

local directions = {
	up = -1,
	down = 1,
	left = -1,
	right = 1,
}

---@class Gun
local Gun = Object:extend()

-- Class constructor. Init with Entity(), not Entity:new()
---@param body love.Body
---@param size number
---@param x number
---@param y number
function Gun:new(body, size, x, y)
	self.body = body
	self.size = size
	self.x = x
	self.y = y
	self.fire_rate = 300
	self.bullet_speed = 800

	self.is_firing = false
	self.timer = 0

	self.direction_x = directions.right
	self.direction_y = 0
end

function Gun:update(dt)
	-- direction player is facing
	if love.keyboard.isDown("k") then
		self.direction_y = directions.down
		self.direction_x = 0
	end

	if love.keyboard.isDown("i") then
		self.direction_y = directions.up
		self.direction_x = 0
	end

	if love.keyboard.isDown("l") then
		self.direction_y = 0
		self.direction_x = directions.right
		self.is_firing = true
	end

	if love.keyboard.isDown("j") then
		self.direction_y = 0
		self.direction_x = directions.left
	end
end

function Gun:draw()
	local xPos = self.body:getX()
	local yPos = self.body:getY()

	love.graphics.circle("fill", xPos + self.size * self.direction_x, yPos + self.size * self.direction_y, 10)
end

return Gun
