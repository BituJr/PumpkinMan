-----------------------------------
-------Importando a Fisica---------
local physics = require("physics")
-----------------------------------
-------Ocultando o Status Bar------
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------
------Importando a Composer--------
local composer = require("composer")
-----------------------------------
-----------Criando a cena----------
local scene = composer.newScene()


local musicTrack
musicTrack = audio.loadStream( "audio/Life-in-a-Mystical-Village.mp3")

local function playGame()
    composer.removeScene("jogo")
    composer.gotoScene("jogo", { time=800, effect="crossFade" } )
    audio.stop( 1 )
end

local function creditosGame()
    composer.removeScene("creditos")
    composer.gotoScene("creditos", { time=800, effect="crossFade" } )
end

local function exitGame()
    timer.performWithDelay( 1000,
    function()
      if( system.getInfo("platformName")=="Android" ) then
        native.requestExit()
      else
        os.exit()
      end
    end )
end




function scene:create(event)

    local sceneGroup = self.view
    -- Carregando o background
    local background = display.newImageRect(sceneGroup,"images/BackgroundMenu.png", 650, 400)
    background.x = 230
    background.y = display.contentCenterY

    -- Botao Jogar
    local playButton = display.newImageRect(sceneGroup,"images/jogar.png", 160,50)
    playButton.x = display.contentCenterX
    playButton.y =  130
   -- playButton.rotation = 05

   -- Botao Pontos
    local creditosButton = display.newImageRect(sceneGroup,"images/creditos.png", 160,50)
    creditosButton.x = display.contentCenterX 
    creditosButton.y = 200
   -- creditosButton.rotation = -05
	
    -- Botao Sair
    local exitButton = display.newImageRect(sceneGroup,"images/sair.png", 160,50)
    exitButton.x = display.contentCenterX
    exitButton.y = 270
    --exitButton.rotation = 05
    
    
    playButton:addEventListener("tap", playGame)
	
	creditosButton:addEventListener("tap", creditosGame)
	
    exitButton:addEventListener("tap", exitGame)
	
	audio.play( musicTrack, { channel=1, loops=-1 } )

end

scene:addEventListener("create", create)
return scene
