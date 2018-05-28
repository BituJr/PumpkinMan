-- Criando Colisões

function checkCollisions()
	wasOnGround = onGround

	for a = 1, blocks.numChildren, 1 do
		if(collisionRect.y - 10> blocks[a].y - 170 and blocks[a].x - 40 < collisionRect.x and blocks[a].x + 40 > collisionRect.x) then
			speed = 0
			killPersonagem()
		end
	end
	
	--stop the game if the monster runs into a obstaculo wall
	for a = 1, obstaculos.numChildren, 1 do
		if(obstaculos[a].isAlive == true) then
			if(collisionRect.y - 10> obstaculos[a].y - 60 and obstaculos[a].x - 50 < collisionRect.x and obstaculos[a].x + 25 > collisionRect.x) then
				killPersonagem()
				speed = 0
			end
		end
	end


	for a = 1, blocks.numChildren, 1 do
		if(personagem.y >= blocks[a].y - 170 and blocks[a].x < personagem.x + 60 and blocks[a].x > personagem.x - 60) then
			personagem.y = blocks[a].y - 171
			onGround = true
			break
		else
			onGround = false
		end
	end
end
