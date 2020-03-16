--[[

CLASS MAIN.LUA

I would highly recommend literally copy/pasting this script verbatum into your project. Game logic is not defined here anyway; it is defined in your screens,
with the exception of global game logic. If you have global game logic you'd like to implement, feel free to put it here.

DONT FORGET TO INITIALIZE YOUR GAME BY CALLING ScreenManager:SwitchStates(<string> state)!

AND DONT FORGET TO ADD ALL OF YOUR SCREENS TO THE "gameStates" ARRAY IN THE SCREENMANAGER CLASS!

]]--

local ScreenManager = require("ScreenManager")

function love.load() -- this is where you need to switch to your first screen
    ScreenManager:SwitchStates("exampleScreen") -- dont forget to add the screen before trying to index it by name
end

-- Everything below is handled automatically in the ScreenManager class. Just make sure you call all below methods according to the corresponding "love" event to ensure full functionality.

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
