-- Creating Animated Character
function killHero()
	hero.isAlive = false
end

function resetHero()
	hero.x = 100
	hero.y = screenYcenter -- fall from middle of screen to start
	hero.gravity = -6
	hero.accel = 0
	hero.isAlive = true
	hero:setSequence("running")
	hero:play()
	hero.rotation = 0
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
hero = display.newSprite( imageSheet, sequenceData )

resetHero()

collisionRect = display.newRect(hero.x + 22, hero.y, 1, 70)
collisionRect.strokeWidth = 1
collisionRect:setFillColor(140, 140, 140)
collisionRect:setStrokeColor(180, 180, 180)
collisionRect.alpha = 0

character = display.newGroup()
character:insert(hero)
character:insert(collisionRect)

characters:insert(character)

function updateCharacter()
	--if our hero is jumping then switch to the jumping animation
	--if not keep playing the running animation
	if(hero.isAlive == true) then
		if(onGround) then
			if(wasOnGround) then

			else
				hero:setSequence("running")
				hero:play()
			end
		else
			hero:setSequence("jumping")
			hero:play()
		end
		
		if(hero.accel > 0) then
			hero.accel = hero.accel - 1
		end
		
		hero.y = hero.y - hero.accel
		hero.y = hero.y - hero.gravity
	end
	collisionRect.y = hero.y

end