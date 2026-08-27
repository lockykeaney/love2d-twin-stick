local Object = require("lib/classic")
local Gun = require("gun")

local directions = {
	up = -1,
	down = 1,
	left = -1,
	right = 1,
}

---@class Player
local Player = Object:extend()

---@param world love.World
---@param x number
---@param y number
function Player:new(world, x, y)
	self.world = world
	self.x = x
	self.y = y
	self.body = love.physics.newBody(world, x, y, "static")
	self.shape = love.physics.newCircleShape(30)
	self.fixture = love.physics.newFixture(self.body, self.shape)
	-- self.fixture:setRestitution(0.1)
	self.fixture:setUserData("player")

	self.facingX = 1
	self.facingY = 0

	self.accel = 200
	self.decel = 800
	self.baseSpeed = 400
	self.maxSpeed = 1000

	self.gun = Gun(self.body, self.shape:getRadius(), self.x, self.y)
end

function Player:update(dt)
	-- Axis directions
	local dx, dy = 0.0, 0.0

	-- Vertical movement handler
	if love.keyboard.isDown("down", "s") then
		print("move down")
		dy = directions.down
	elseif love.keyboard.isDown("up", "w") then
		print("move up")
		dy = directions.up
	end
	-- Horizontal movement handler
	if love.keyboard.isDown("left", "a") then
		dx = directions.left
	elseif love.keyboard.isDown("right", "d") then
		dx = directions.right
	end

	if dx ~= 0 and dy ~= 0 then
		dx = dx / math.sqrt(2)
		dy = dy / math.sqrt(2)
	end

	self.x = self.x + dx * self.baseSpeed * dt
	self.y = self.y + dy * self.baseSpeed * dt

	local vx, vy = self.body:getLinearVelocity()
	vx = vx + dx + self.accel * dt
	vy = vy + dy + self.accel * dt
	self.body:setLinearVelocity(vx, vy)
	self.gun:update(dt)
end

function Player:draw(dt)
	local size = self.shape:getRadius()
	love.graphics.circle("fill", self.x, self.y, size)
	self.gun:draw(self.x, self.y)
end

return Player
