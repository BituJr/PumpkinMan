-- Criando Game Over
gameOver = display.newImage("images/gameOver.png")
gameOver.name = "gameOver"
gameOver.x = 0
gameOver.y = 500

function endGame()
	speed = 0

	gameOver.x = screenXcenter
	gameOver.y = screenYcenter
	personagem:setSequence("jumping")
	personagem:pause()
	
end

function restartGame()
	--move menu
	gameOver.x = 0
	gameOver.y = screenYheight * 2
	
	resetScore()
	resetSpeed()
	resetPersonagem()
	resetChao()
	resetBackgrounds()
	resetObstaculos()
	resetHeadss()
end
