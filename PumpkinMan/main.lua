-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")

-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )

math.randomseed( os.time() )

audio.reserveChannels( 1 )

audio.setVolume( 0.2, { channel=1 } )

composer.gotoScene("menu")

