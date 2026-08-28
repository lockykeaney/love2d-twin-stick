local Object = require("lib/classic")
local Entity = require("entities/entity")
local Bullet = require("bullet")

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
	self.dx = directions.right
	self.dy = 0
	self.fire_rate = 0.08 -- os.clock is in seconds.

	self.timer = 0
	self.bullets = {}
end

function Gun:update(player, dt)
	self.x = player.x
	self.y = player.y

	local function handle_firing()
		local now = os.clock()
		local can_shoot = now - self.timer >= self.fire_rate
		if can_shoot then
			local b = Bullet(self.x, self.y, self.dx, self.dy)
			table.insert(self.bullets, b)
			self.timer = os.clock()
		end
	end
	for _, b in ipairs(self.bullets) do
		b:update(dt)
	end
	-- direction player is facing
	if love.keyboard.isDown("k") then
		self.dy = directions.down
		self.dx = 0
		handle_firing()
	elseif love.keyboard.isDown("i") then
		self.dy = directions.up
		self.dx = 0
		handle_firing()
	elseif love.keyboard.isDown("l") then
		self.dy = 0
		self.dx = directions.right
		handle_firing()
	elseif love.keyboard.isDown("j") then
		self.dy = 0
		self.dx = directions.left
		handle_firing()
	end
end

function Gun:draw(x, y)
	love.graphics.circle("fill", x + self.size * self.dx, y + self.size * self.dy, 10)

	for _, b in ipairs(self.bullets) do
		b:draw()
	end
end

return Gun
