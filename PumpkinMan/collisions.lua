function checkCollisions()
	wasOnGround = onGround

	for a = 1, blocks.numChildren, 1 do
		if(collisionRect.y - 10> blocks[a].y - 170 and blocks[a].x - 40 < collisionRect.x and blocks[a].x + 40 > collisionRect.x) then
			speed = 0
			killHero()
		end
	end


	for a = 1, blocks.numChildren, 1 do
		if(hero.y >= blocks[a].y - 170 and blocks[a].x < hero.x + 60 and blocks[a].x > hero.x - 60) then
			hero.y = blocks[a].y - 171
			onGround = true
			break
		else
			onGround = false
		end
	end
end