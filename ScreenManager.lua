--[[

CLASS SCREEN MANAGER

Welcome to the main gamestate logic! Be sure that in main.lua you are ALWAYS calling the below methods, as was intended.

How do you call them?

Simple! All you have to do is do "require(<directory to this module>)" in main.lua, and call each of these methods according to their love class equivalent.

For details check out main.lua in this repo: https://github.com/thenerdie/Yonder

]]--

local gameStates = { -- this is where you set the directories of your screens
	["exampleScreen"] = require("exampleScreen")
}

-- dont touch anything below unless you know what you are doing :)

local currState = nil

local self = {}
-----------------------
function self:SwitchStates(newState, supressLoad)
	if not gameStates[newState] then
		currState = nil
		error("Error SM106: newState not found in gameStates")
	else
		currState = newState
		if not supressLoad then self:Load() end
	end
end
--// Common LOVE2D functions, wrapped in ScreenManager
function self:Draw(dt) -- In your screen, if you want to switch states from that screen, you need to return a string in either the :Draw() or the :Update() methods indentifying what screen you want to switch to.
	if currState ~= nil then
		if gameStates[currState].Draw then
			gameStates[currState]:Draw(dt)
		end
	end
end
function self:Update(dt)
	if currState ~= nil then
		if gameStates[currState].Update then
			gameStates[currState]:Update(dt)
		end
	end
end
function self:Quit()
	if currState ~= nil then
		if gameStates[currState].Quit then
			gameStates[currState]:Quit()
		end
	end
end
function self:MousePressed(x, y, button)
	if currState ~= nil then
		if gameStates[currState].MousePressed then
			gameStates[currState]:MousePressed(x, y, button)
		end
	end
end
function self:MouseReleased(x, y, button)
	if currState ~= nil then
		if gameStates[currState].MouseReleased then
			gameStates[currState]:MouseReleased(x, y, button)
		end
	end
end
function self:KeyPressed(key)
	if currState ~= nil then
		if gameStates[currState].KeyPressed then
			gameStates[currState]:KeyPressed(key)
		end
	end
end
function self:KeyReleased(key)
	if currState ~= nil then
		if gameStates[currState].KeyReleased then
			gameStates[currState]:KeyReleased(key)
		end
	end
end
function self:Load()
	if currState ~= nil then
		if gameStates[currState].Load then
			gameStates[currState]:Load(self)
		end
	end
end
-----------------------
return self
