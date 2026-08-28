local Tile = require("tiles/tile")

---@class ArenaTile
local ArenaTile = Tile:extend()

---@param world love.World
---@param tx number
---@param ty number
---@param tileSize number
function ArenaTile:new(world, tx, ty, tileSize)
	self.tile = Tile(world, tx, ty, tileSize)
	self.tile.fixture:setUserData("arena_tile")
end

function ArenaTile:update(dt) end

function ArenaTile:draw()
	love.graphics.setColor(0.15, 0.65, 0.95, 0.2)
	self.tile:draw()
end

return ArenaTile
