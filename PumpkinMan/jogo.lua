local composer = require("composer")

local ragdogLib = require "ragdogLib";
-----------------------------------
-----------Criando a cena----------
local scene = composer.newScene()


display.setStatusBar(display.HiddenStatusBar)
function scene:create(event)

    local sceneGroup = self.view

	-- variáveis do jogo
	screenXwidth = display.contentWidth
	screenXcenter = screenXwidth/2
	screenYheight = display.contentHeight
	screenYcenter = screenYheight/2-20

	inEvent = 0
	eventRun = 0

	-- Grupos
	blocks = display.newGroup()
	characters = display.newGroup()
	screen = display.newGroup()
	obstaculos = display.newGroup()
	heads = display.newGroup()
	
	require("scoreboard")
	require("chao")
	require("background")
	require("collisions")
	require("events")
	require("personagem")
	require("game_over")	
	require("speed")
	require("obstaculo")
	require("head")
	
	screen:insert(backbackground)
	screen:insert(backgroundM1)
	screen:insert(backgroundM2)
	screen:insert(backgroundA1)
	screen:insert(backgroundA2)
	screen:insert(blocks)
	screen:insert(personagem)
	screen:insert(obstaculos)
	screen:insert(heads)
	screen:insert(collisionRect)
	screen:insert(scoreText)
	screen:insert(gameOver)


	local function update( event )
		if personagem.isAlive then
			checkCollisions()
			updateSpeed()
			updateBackgrounds()
			updateBlocks()
			updateCharacter()
			updateObstaculos()
			updateHeads()
		else
			endGame()
		end
	end

function touched( event )
		if(event.phase == "began") then
        if(event.x < 241) then
            if(onGround) then
                personagem.accel = personagem.accel + 20
            end
        else
            for a=1, heads.numChildren, 1 do
                if(heads[a].isAlive == false) then
                    heads[a].isAlive = true
                    heads[a].x = personagem.x + 50
                    heads[a].y = personagem.y
                    break
                end
            end
        end
    
		else
			if(event.x < gameOver.x + 150 and event.x > gameOver.x - 150 and event.y < gameOver.y + 95 and event.y > gameOver.y - 95) then
				restartGame()
			end
		end
	end


	timer.performWithDelay(1, update, -1)
	Runtime:addEventListener("touch", touched, -1)

end

scene:addEventListener("create", create)
return scene
