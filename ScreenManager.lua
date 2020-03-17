--[[

CLASS SCREEN MANAGER

Welcome to the main gamestate logic! Be sure that in main.lua you are ALWAYS calling the below methods, as was intended.

How do you call them?

Simple! All you have to do is do "require(<directory to this module>)" in main.lua, and call each of these methods according to their love class equivalent.

For details check out main.lua in this repo: https://github.com/thenerdie/Yonder

]]--

local verbose = true
local very_verbose = false

local function puts(str, reqVeryVerbosePerms)
	if reqVeryVerbosePerms then
		if verbose and very_verbose then
			print(str)
		end
	else
		if verbose then
			print(str)
		end
	end
end

local gameStates = { -- this is where you set the directories of your screens
	["landing"] = require("Screens/LandingScreen");
	["songs"] = require("Screens/SongSelect")
}

local currState = nil

local self = {}
-----------------------
function self:SwitchStates(newState, supressLoad)
	if not gameStates[newState] then
		currState = nil
		error("Error SM106: newState not found in gameStates")
	else
		currState = newState
		if not supressLoad then
			puts("Loaded screen \"" .. newState .. "\"; :Load() suppressed = " .. tostring(not not supressLoad))
			self:Load()
		end
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
			puts(":Update called; DT = " .. dt .. "; FPS = " .. 1/dt, true)
		else
			puts(":Update called but unimplemented; DT = " .. dt .. "; FPS = " .. 1/dt, true)
		end
	end
end
function self:Quit()
	if currState ~= nil then
		if gameStates[currState].Quit then
			gameStates[currState]:Quit()
			puts("Exiting game...")
		end
	end
end
function self:MousePressed(x, y, button)
	if currState ~= nil then
		if gameStates[currState].MousePressed then
			gameStates[currState]:MousePressed(x, y, button)
			puts("Mouse pressed; x = " .. x .. "; y = " .. y)
		end
	end
end
function self:MouseReleased(x, y, button)
	if currState ~= nil then
		if gameStates[currState].MouseReleased then
			gameStates[currState]:MouseReleased(x, y, button)
			puts("Mouse released; x = " .. x .. "; y = " .. y)
		end
	end
end
function self:KeyPressed(key)
	if currState ~= nil then
		if gameStates[currState].KeyPressed then
			gameStates[currState]:KeyPressed(key)
			puts("Key pressed; key = " .. key)
		end
	end
end
function self:KeyReleased(key)
	if currState ~= nil then
		if gameStates[currState].KeyReleased then
			gameStates[currState]:KeyReleased(key)
			puts("Key released; key = " .. key)
		end
	end
end
function self:Load()
	if currState ~= nil then
		if gameStates[currState].Load then
			gameStates[currState]:Load(self)
			puts("Loaded screen \"" .. currState .. "\" successfully!")
		else
			puts(":Load() unimplemented in Screen")
		end
	end
end
function self:MouseMoved(x, y, dx, dy, istouch)
	if currState ~= nil then
		if gameStates[currState].MouseMoved then
			gameStates[currState]:MouseMoved(x, y, dx, dy, istouch)
			puts("Mouse moved; x = " .. x .. "; y = " .. y, true)
		end
	end
end
puts("ScreenManager class initialized successfully!")
-----------------------
return self
