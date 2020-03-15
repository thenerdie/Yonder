local ScreenManager = require("ScreenManager")

function love.load()
    ScreenManager:SwitchStates("landing", true)
    ScreenManager:Load()
end

function love.draw()
    ScreenManager:Draw()
end

function love.update(dt)
    ScreenManager:Update(dt)
end

function love.keypressed(key)
    ScreenManager:KeyPressed(key)
end

function love.keyreleased(key)
    ScreenManager:KeyReleased(key)
end

function love.mousepressed(x, y, button)
    ScreenManager:MousePressed(x, y, button)
end

function love.mousereleased(x, y, button)
    ScreenManager:MouseReleased(x, y, button)
end
