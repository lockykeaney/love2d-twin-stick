local Tile = require("tiles/tile")

---@class BoundaryTile
local BoundaryTile = Tile:extend()

function BoundaryTile:new(world, tx, ty, tileSize)
	self.tile = Tile(world, tx, ty, tileSize)
	self.tile.fixture:setUserData("boundary_tile")
end

function BoundaryTile:update(dt) end

function BoundaryTile:draw()
	local tileX = self.tile.x * self.tile.tileSize
	local tileY = self.tile.y * self.tile.tileSize
	local size = self.tile.tileSize
	love.graphics.setColor(0.95, 0.15, 0.95)
	love.graphics.rectangle("fill", tileX, tileY, size, size)
	love.graphics.setColor(0.5, 0.15, 0.5)
	love.graphics.rectangle("line", tileX, tileY, size, size)
	self.tile:draw()
end

return BoundaryTile
