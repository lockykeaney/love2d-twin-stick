---@param image love.Image
---@param row number
---@param count number
local function buildQuads(image, row, count)
	local quads = {}
	local imageWidth, imageHeight = image:getDimensions()
	local frameWidth = imageWidth / count
	local frameHeight = imageHeight

	for col = 0, count - 1 do
		quads[col + 1] = love.graphics.newQuad(
			col * frameWidth,
			row * frameHeight,
			frameWidth,
			frameHeight,
			imageWidth,
			imageHeight
		)
	end

	return quads
end

local function clamp(val, min, max)
	return math.max(min, math.min(max, val))
end

return { buildQuads = buildQuads, clamp = clamp }
