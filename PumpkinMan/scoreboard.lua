-- Creating Scoreboard
score = 0
scoreText = display.newText("Score: 0", 0, 0, "Fixedsys", 30)
scoreText:setFillColor(0, 0.4, 0.1)

function updateScore()
	score = score + 1
	scoreText.text = "Score: " .. score
	scoreText.anchorX, scoreText.anchorY = 0, .5
	scoreText.x, scoreText.y = 10, 20
end

function resetScore()
	score = 0
	scoreText.text = "Score: " .. score
end
