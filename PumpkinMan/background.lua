-- Criando Background
 --backgroundMusic = audio.loadStream( "backgroundMusic.m4a" )
backbackground = display.newImage("images/ceu1.png")
backbackground.x = 240
backbackground.y = 160

backgroundM1 = display.newImage("images/montanhas2.png")
backgroundM1.x = screenXcenter
backgroundM1.y = screenYcenter-chaoOffset

backgroundM2 = display.newImage("images/montanhas2.png")
backgroundM2.x = screenXwidth*2.5
backgroundM2.y = screenYcenter-chaoOffset

backgroundA1 = display.newImage("images/arvores.png")
backgroundA1.x = screenXcenter
backgroundA1.y = screenYcenter-chaoOffset

backgroundA2 = display.newImage("images/arvores.png")
backgroundA2.x = screenXwidth*1.5
backgroundA2.y = screenYcenter-chaoOffset

function updateBackgrounds()
	--Movimentando das montanhas
	backgroundM1.x = backgroundM1.x - (speed/55)
	if(backgroundM1.x < -(screenXwidth-1)) then
		backgroundM1.x = screenXwidth*2-1
	end

	backgroundM2.x = backgroundM2.x - (speed/55)
	if(backgroundM2.x < -(screenXwidth-1)) then
		backgroundM2.x = screenXwidth*2-1
	end
	 
	--Movimentando das árvores
	backgroundA1.x = backgroundA1.x - (speed/5)
	if(backgroundA1.x < -(screenXcenter-1)) then
		backgroundA1.x = screenXwidth*1.5
	end
	 
	backgroundA2.x = backgroundA2.x - (speed/5)
	if(backgroundA2.x < -(screenXcenter-1)) then
		backgroundA2.x = screenXwidth*1.5
	end
end

function resetBackgrounds()
	backbackground.x = screenXcenter
	backbackground.y = screenYcenter-chaoOffset

	backgroundM1.x = screenXcenter
	backgroundM1.y = screenYcenter-chaoOffset

	backgroundM2.x = screenXwidth*2.5
	backgroundM2.y = screenYcenter-chaoOffset

	backgroundA1.x = screenXcenter
	backgroundA1.y = screenYcenter-chaoOffset

	backgroundA2.x = screenXwidth*1.5
	backgroundA2.y = screenYcenter-chaoOffset
end
