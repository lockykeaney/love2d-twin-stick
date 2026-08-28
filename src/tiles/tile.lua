local Entity = require("entities/entity")

local Tile = Entity:extend()

---@param world love.World
---@param tx number
---@param ty number
---@param tileSize number
function Tile:new(world, tx, ty, tileSize)
	Tile.super.new(self, "Tile", tx, ty)
	self.tileSize = tileSize
	self.body = love.physics.newBody(world, tx, ty, "static")
	self.shape = love.physics.newRectangleShape(tileSize, tileSize)
	self.fixture = love.physics.newFixture(self.body, self.shape)
	self.fixture:setRestitution(0.1)
end

function Tile:update(dt) end

function Tile:draw()
	love.graphics.rectangle("line", self.x * self.tileSize, self.y * self.tileSize, self.tileSize, self.tileSize)
end

return Tile
