-- Criando Animação do personagem
function killPersonagem()
	personagem.isAlive = false
end

function resetPersonagem()
	personagem.x = 100
	personagem.y = screenYcenter 
	personagem.gravity = -6
	personagem.accel = 0
	personagem.isAlive = true
	personagem:setSequence("running")
	personagem:play()
	personagem.rotation = 0
end

local options =
{ frames = {
    
		        {
            -- Run (1)
            x=1,
            y=1,
            width=57,
            height=91,

        },
        {
            -- Run (2)
            x=60,
            y=1,
            width=56,
            height=93,

        },
        {
            -- Run (3)
            x=118,
            y=1,
            width=60,
            height=86,

        },
        {
            -- Run (4)
            x=180,
            y=1,
            width=56,
            height=89,

        },
        {
            -- Run (5)
            x=238,
            y=1,
            width=56,
            height=91,

        },
        {
            -- Run (6)
            x=296,
            y=1,
            width=60,
            height=93,

        },
        {
            -- Run (7)
            x=358,
            y=1,
            width=65,
            height=88,

        },
        {
            -- Run (8)
            x=425,
            y=1,
            width=59,
            height=90,

        },
       	    },
}
local imageSheet = graphics.newImageSheet( "images/personagem.png", options )

local sequenceData =
{
    { name="running", frames={1, 2, 3, 4, 5, 6, 7, 8 }, time=600 },
    { name="jumping", start=3, count=1, time=300 }
}
personagem = display.newSprite( imageSheet, sequenceData )

resetPersonagem()

collisionRect = display.newRect(personagem.x + 22, personagem.y, 1, 70)
collisionRect.strokeWidth = 1
collisionRect:setFillColor(140, 140, 140)
collisionRect:setStrokeColor(180, 180, 180)
collisionRect.alpha = 0

character = display.newGroup()
character:insert(personagem)
character:insert(collisionRect)

characters:insert(character)

function updateCharacter()
	--if our personagem is jumping then switch to the jumping animation
	--if not keep playing the running animation
	if(personagem.isAlive == true) then
		if(onGround) then
			if(wasOnGround) then

			else
				personagem:setSequence("running")
				personagem:play()
			end
		else
			personagem:setSequence("jumping")
			personagem:play()
		end
		
		if(personagem.accel > 0) then
			personagem.accel = personagem.accel - 1
		end
		
		personagem.y = personagem.y - personagem.accel
		personagem.y = personagem.y - personagem.gravity
	end
	collisionRect.y = personagem.y

end
