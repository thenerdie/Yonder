--[[

CLASS MAIN.LUA

I would highly recommend literally copy/pasting this script VERBATUM into your project. Game logic is not defined here anyway; it is defined in your screens,
with the exception of global game logic. If you have global game logic you'd like to implement, feel free to put it here.

]]--

local ScreenManager = require("ScreenManager")

function love.load()
    ScreenManager:SwitchStates("landing")
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
