local Arena = require("arena")

local arena

function love.load()
	arena = Arena()
end

function love.update(dt)
	arena:update(dt)
end

-- function love.keypressed(key)
-- 	print("key pressed: ", key)
-- 	if key == "l" then
-- 		print("l keypressed")
-- 	end
-- end
--
-- function love.keyreleased(key)
-- 	if key == "l" then
-- 		print("l keyreleased")
-- 	end
-- end

function love.draw()
	love.graphics.setBackgroundColor(0.3, 0.3, 0.3)
	arena:draw()
end
