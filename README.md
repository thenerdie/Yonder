# Yonder
A very simple game state management library written in Lua, for the LOVE2D framework.

To use it, simply follow these steps:

1. Make a screen

This is done by copy/pasting the the sample screen as the basis for a new screen.

2. Now, you add your screen at the top of ScreenManager.lua, like so:

```
local gameStates = { -- this is where you set the directories of your screens
	["screenGAMEMAIN"] = require("<directory to your new screen>");
}
```

3. Require ScreenManager and switch to your first screen!

The bundled `main.lua` should work for all projects. It calls the major methods called by `love` in ScreenManager.lua. To switch screens, simply call `:SwitchStates()` in the ScreenManager from an screen! The `:Load()` callback contains a reference to ScreenManager, so you can have full access to the state manager without having to `require()`.
