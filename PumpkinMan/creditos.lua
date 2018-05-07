local composer = require( "composer" )

local scene = composer.newScene()

local ragdogLib = require "ragdogLib";
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
-- Initialize variables

 function gotoMenu()

    composer.gotoScene( "menu", { time=800, effect="crossFade" } )
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
    local background = display.newImageRect(sceneGroup,"images/BackgroundCerditos1.png", 550, 350)
    background.x = 230
    background.y = display.contentCenterY

    local criado = display.newText( sceneGroup, "Desenvolvido por:" , display.contentCenterX, 15, "Fixedsys.ttf", 35 )
    criado:setFillColor( ragdogLib.convertHexToRGB("#054904") )

    local photo = display.newImageRect( sceneGroup,"images/ivan-photo.png", 70, 70 )    
    photo.x = display.contentCenterX
    photo.y = 70

    local nome = display.newText( sceneGroup, "José Ivan Bitu B Júnior" , display.contentCenterX, 100, "Fixedsys.ttf", 25 )
    nome.x = display.contentCenterX
    nome.y = display.contentCenterY - 40
    nome:setFillColor( ragdogLib.convertHexToRGB("#040e6e") )

    local email = display.newText( sceneGroup, "ivanbbj@gmail.com" , display.contentCenterX, 100, "Fixedsys.ttf", 25 )
    email.x = display.contentCenterX
    email.y = 150
    email:setFillColor( ragdogLib.convertHexToRGB("#040e6e") )

    local github = display.newText( sceneGroup, "github.com/BituJr" , display.contentCenterX, 100, "Fixedsys.ttf", 25 )
    github.x = display.contentCenterX
    github.y = 180
    github:setFillColor( ragdogLib.convertHexToRGB("#040e6e") )

    local orientado = display.newText( sceneGroup, "Orientado por:" , display.contentCenterX, 100, "Fixedsys.ttf", 35 )
    orientado.x = display.contentCenterX
    orientado.y = 210
    orientado:setFillColor( ragdogLib.convertHexToRGB("#054904") )

    local nome2 = display.newText( sceneGroup, "Eduardo Mendes de Oliveira" , display.contentCenterX, 100, "Fixedsys.ttf", 25 )
    nome2.x = display.contentCenterX
    nome2.y = 240
    nome2:setFillColor( ragdogLib.convertHexToRGB("#040e6e") )

    local botaoVoltar = display.newImageRect( sceneGroup,"images/botao-voltar.png", 80, 50 )    
    botaoVoltar.x = display.contentCenterX
    botaoVoltar.y = 285
	botaoVoltar:addEventListener( "tap", gotoMenu )
    
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
		
	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		--audio.play( soundHighscore, { channel=3, loops=-1 } )
	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)
		
	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
	musicTrack = audio.loadStream( "audio/Life-in-a-Mystical-Village.mp3")
end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene