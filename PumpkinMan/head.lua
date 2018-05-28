--Criando Heads
for a=1, 5, 1 do
    head = display.newImage("images/head1.png")
    head.name = ("head" .. a)
    head.id = a
    head.x = 800
    head.y = 500
    head.isAlive = false
    heads:insert(head)
end

  function updateHeads()
        --para cada cabeça que instanciamos, verifique o que está fazendo
    for a = 1, heads.numChildren, 1 do
                --se essa cabeça não está em jogo, não precisamos verificar qualquer outra coisa
        if(heads[a].isAlive == true) then
            (heads[a]):translate(5, 0)
                        --se a cabeça se moveu para fora da tela, então mate-a e retorne-a ao seu lugar original
            if(heads[a].x > 550) then
                heads[a].x = 800
                heads[a].y = 400
                heads[a].isAlive = false
            end
        end
                --verifique se há colisões entre as cabeças e os obstaculos
        for b = 1, obstaculos.numChildren, 1 do
            if(obstaculos[b].isAlive == true) then
                if(heads[a].y - 25 > obstaculos[b].y - 60 and heads[a].y + 10 < obstaculos[b].y + 60 and obstaculos[b].x - 20 < heads[a].x + 15 and obstaculos[b].x + 20 > heads[a].x - 10) then
                        heads[a].x = 800
                        heads[a].y = 500
                        heads[a].isAlive = false
                        obstaculos[b].x = 900
                        obstaculos[b].y = 500
                        obstaculos[b].isAlive = false
					 end
				end
			end  
		end
	end
	
function resetHeadss()
		
	for a = 1, heads.numChildren, 1 do
          heads[a].x = 800
          heads[a].y = 500
    end
end