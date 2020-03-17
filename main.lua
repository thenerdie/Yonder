local ScreenManager = require("Yonder").ScreenManager

local defaultGameResolution = {x=1980,y=1080}

function love.load()
    love.window.setTitle("Your Yonder App")
    ScreenManager:SwitchStates("exampleScreen")
end

function love.draw()
    local dimX, dimY = love.graphics.getDimensions()
    love.graphics.push()
    love.graphics.scale(dimX/defaultGameResolution.x, dimY/defaultGameResolution.y)
    ScreenManager:Draw()
    love.graphics.pop()
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

function love.mousemoved(x, y, dx, dy, istouch)
    ScreenManager:MouseMoved(x, y, dx, dy, istouch)
end
