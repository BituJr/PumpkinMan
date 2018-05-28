-- Criando Chão
chaoHeight = 70
chaoOffset = 100-chaoHeight
chaoMin = screenYheight+chaoHeight
chaoMax = chaoMin-50
chaoLevel = chaoMin
blockXoffset = 79 

for a = 1, 8, 1 do
	isDone = false
	 
	numGen = math.random(2)
	local newBlock
	if(numGen == 1 and isDone == false) then
		newBlock = display.newImage("images/chao1.png")
		isDone = true
	end
	 
	if(numGen == 2 and isDone == false) then
		newBlock = display.newImage("images/chao2.png")
		isDone = true
	end
	 
	

	newBlock.name = ("block" .. a)
	newBlock.id = a
	 
	newBlock.x = ((a-5) * blockXoffset)
	newBlock.y = chaoLevel
	blocks:insert(newBlock)
end

function updateBlocks()
     for a = 1, blocks.numChildren, 1 do
          if(a > 1) then
               newX = (blocks[a - 1]).x + 79
          else
               newX = (blocks[8]).x + 79 - speed
          end
          if((blocks[a]).x < -65) then
			 if(inEvent == 11) then
				  (blocks[a]).x, (blocks[a]).y = newX, 600
			 else
				  (blocks[a]).x, (blocks[a]).y = newX, chaoLevel
				  updateScore()
			 end
			--by setting up the obstaculos this way we are guaranteed to
			--only have 3 obstaculos out at most at a time.
			if(inEvent == 12) then
				for a=1, obstaculos.numChildren, 1 do
					if(obstaculos[a].isAlive == true) then
					--do nothing
					else
					obstaculos[a].isAlive = true
					obstaculos[a].y = chaoLevel - 157
					obstaculos[a].x = newX
					break
					end
				end
			end
			 checkEvent()
			else
				 (blocks[a]):translate(speed * -1, 0)
			end
		 end
end

function resetChao()
	--reset the chaoLevel
	chaoLevel = chaoMin
	for a = 1, blocks.numChildren, 1 do
    blocks[a].x = ((a-1) * blockXoffset)
    blocks[a].y = chaoLevel
	end
end
