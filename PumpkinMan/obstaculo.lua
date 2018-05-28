--Criando Obstáculos
for a = 1, 3, 1 do
    obstaculo = display.newImage("images/setas.png")
    obstaculo.name = ("obstaculo" .. a)
    obstaculo.id = a
	obstaculo.x = 900
    obstaculo.y = 500
    obstaculo.isAlive = false
    obstaculos:insert(obstaculo)
end


function updateObstaculos()
    for a = 1, obstaculos.numChildren, 1 do
        if(obstaculos[a].isAlive == true) then
            (obstaculos[a]):translate(speed * -1, 0)
            if(obstaculos[a].x < -80) then
                obstaculos[a].x = 900
                obstaculos[a].y = 500
                obstaculos[a].isAlive = false
            end
        end
    end
end

function resetObstaculos()
		
	for a = 1, obstaculos.numChildren, 1 do
          obstaculos[a].x = 900
          obstaculos[a].y = 500
    end
end