local Object = require("lib/classic")
local Player = require("player/player")
local ArenaTile = require("tiles/arena_tile")
local BoundaryTile = require("tiles/boundary_tile")

local function beginContact(a, b, coll)
	print("begin contact")
	print(a, b)
	print(coll:getNormal())
end

local function endContact(a, b, coll)
	print("end contact")
	print(a, b)
	print(coll:getNormal())
end

---@class Arena
local Arena = Object:extend()

function Arena:new()
	self.world = love.physics.newWorld(0, 0)
	self.world:setCallbacks(beginContact, endContact)
	self.screenWidth, self.screenHeight = love.graphics.getDimensions()
	self.player = Player(self.world, self.screenWidth / 2, self.screenHeight / 2)

	self.tiles = {}
	self.rows = 15
	self.cols = 30
	local tileSize = self.screenWidth / self.cols
	local screenPadding = self.screenHeight - tileSize * self.rows

	for yPos = 0, self.rows do
		for xPos = 0, self.cols do
			local t = {}
			if yPos == 0 or yPos == self.rows or xPos == 0 or xPos == self.cols - 1 then
				t = BoundaryTile(self.world, xPos, yPos, tileSize)
			else
				t = ArenaTile(self.world, xPos, yPos, tileSize)
			end
			table.insert(self.tiles, t)
		end
	end

	self.world:setCallbacks(function(a, b)
		print("begin collison", a, b)
	end, function(a, b)
		print("collison end")
	end)
end

function Arena:update(dt)
	self.world:update(dt)
	self.player:update(dt)
end

function Arena:draw()
	self.player:draw()

	for _, t in ipairs(self.tiles) do
		t:draw()
	end
end

return Arena
