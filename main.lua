-- Abstract: JungleScene sample project
-- Demonstrates sprite sheet animations, with different frame rates
-- Version: 1.0
-- Sample code is MIT licensed, see https://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.
-- Plants are from http://blender-archi.tuxfamily.org/Greenhouse
-- and are subject to creative commons license, http://creativecommons.org/licenses/by/3.0/
--	Supports Graphics 2.0
---------------------------------------------------------------------------------------
local function removeFlake(target)
        target:removeSelf()
        target = nil
end

local function spawnSnowFlake()
        local flake = display.newCircle(0,0,3)
        flake.x = math.random(display.contentWidth)
        flake.y = 2
        local wind = math.random(100) - 100
        transition.to(flake,{time=math.random(3000) + 3000, y = display.contentHeight + 100, x = flake.x + wind, onComplete=removeFlake})
end

local function makeSnow(event)
      if math.random(5) == 1 then -- adjust speed here by making the random number higher or lower
            spawnSnowFlake()
      end
      return true
end

Runtime:addEventListener("enterFrame",makeSnow)

--Background
display.setDefault("background", 61/255, 94/255, 144/255)

--Audio
local function narrationFinished( event )
    print( "Narration Finished on channel", event.channel )
    if ( event.completed ) then
        print( "Narration completed playback naturally" )
    else
        print( "Narration was stopped before completion" )
    end
end
-- Load two audio streams and one sound
local backgroundMusic = audio.loadStream( "Background01.mp3" )
-- Play the background music on channel 1, loop infinitely, and fade in over 5 seconds 
local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=3, fadein=5000 } )

-- Define reference points locations anchor ponts
local TOP_REF = 0
local BOTTOM_REF = 1
local LEFT_REF = 0
local RIGHT_REF = 1
local CENTER_REF = 0.5

display.setStatusBar( display.HiddenStatusBar )

--The sky as background
local background = display.newImageRect( "Night.jpg", 507, 267 )
background.x = display.contentCenterX
background.y = 120
local baseline = 250

-- a bunch of foliage
local Things = {}

Things[1] = display.newImage( "Cat.png" )
Things[1].xScale = 0.05; Things[1].yScale = 0.05
Things[1].anchorY = BOTTOM_REF
Things[1].x = 100; Things[1].y = baseline
Things[1].y = baseline - 8
Things[1].dx = 0.15

Things[2] = display.newImage( "House01.png" )
Things[2].xScale = 0.3; Things[2].yScale = 0.3
Things[2].anchorY = BOTTOM_REF
Things[2].x = 100; Things[2].y = baseline
Things[2].y = baseline - 10
Things[2].dx = 0.2

Things[3] = display.newImage( "Cloud01.png" )
Things[3].xScale = 0.5; Things[3].yScale = 0.5
Things[3].anchorY = BOTTOM_REF
Things[3].x = 350; Things[3].y = baseline
Things[3].y = baseline - 30
Things[3].dx = 0.44

Things[4] = display.newImage( "Tree02.png" )
Things[4].xScale = 0.4; Things[4].yScale = 0.4
Things[4].anchorY = BOTTOM_REF
Things[4].x = baseline; Things[4].y = baseline
Things[4].y = baseline - -10
Things[4].dx = 0.28

Things[5] = display.newImage( "Tree01.png" )
Things[5].xScale = 0.45; Things[5].yScale = 0.45
Things[5].anchorY = BOTTOM_REF
Things[5].x = 300; Things[5].y = baseline
Things[5].y = baseline - 10
Things[5].dx = 0.45

Things[6] = display.newImage( "Grass02.png" )
Things[6].xScale = -0.13; Things[6].yScale = 0.13
Things[6].anchorY = BOTTOM_REF
Things[6].x = 10; Things[6].y = baseline
Things[6].y = baseline - 10
Things[6].dx = 0.5

Things[7] = display.newImage( "Grass01.png" )
Things[7].xScale = 0.2; Things[7].yScale = 0.2
Things[7].anchorY = BOTTOM_REF
Things[7].x = 420; Things[7].y = baseline
Things[7].y = baseline - 12
Things[7].dx = 0.55

Things[8] = display.newImage( "Ghost01.png" )
Things[8].xScale = 0.15; Things[8].yScale = 0.15
Things[8].anchorY = BOTTOM_REF
Things[8].x = 320; Things[8].y = baseline
Things[8].y = baseline - 100
Things[8].dx = 0.48

Things[9] = display.newImage( "Grass01.png" )
Things[9].xScale = -0.25; Things[9].yScale = 0.25
Things[9].anchorY = BOTTOM_REF
Things[9].x = 100; Things[9].y = baseline
Things[9].y = baseline - 12
Things[9].dx = 0.6

--Character03
local sheet3 = graphics.newImageSheet( "002.png", { width=143.3, height=210, numFrames=6 } )
local instance3 = display.newSprite( sheet3, { name="Ghost02", start=1, count=6, time=1200 } )
instance3.x = 3 * display.contentWidth / 8
instance3.y = baseline - 95
instance3.xScale = .8
instance3.yScale = .8
instance3:play()

--Character04
local sheet4 = graphics.newImageSheet( "001.png", { width=270, height=300, numFrames=4 } )
local instance4 = display.newSprite( sheet4, { name="Ghost01", start=1, count=4, time=800 } )
instance4.x = 4 * display.contentWidth / 15
instance4.y = baseline - 150
instance4.xScale = .2
instance4.yScale = .2
instance4:play()

--Character05
local sheet5 = graphics.newImageSheet( "003.png", { width=144, height=250, numFrames=9 } )
local instance5 = display.newSprite( sheet5, { name="Ghost03", start=1, count=9, time=1800 } )
instance5.x = 4 * display.contentWidth / 18
instance5.y = baseline - 75
instance5.xScale = .5
instance5.yScale = .5
instance5:play()

--Character06
local sheet6 = graphics.newImageSheet( "004.png", { width=207, height=300, numFrames=8 } )
local instance6 = display.newSprite( sheet6, { name="Character06", start=1, count=8, time=1000 } )
instance6.x = 4 * display.contentWidth / 6
instance6.y = baseline - 65
instance6.xScale = .4
instance6.yScale = .4
instance6:play()

-- Grass
-- This is doubled so we can slide it
-- When one of the grass images slides offscreen, we move it all the way to the right of the next one.
local Grass = display.newImage( "Grass.png" )
Grass.xScale = 0.4; Grass.yScale = 0.4
Grass.anchorX = LEFT_REF
Grass.x = 0
Grass.y = baseline - -20
local Grass2 = display.newImage( "Grass.png" )
Grass2.xScale = 0.4; Grass2.yScale = 0.4
Grass2.anchorX = LEFT_REF
Grass2.x = 480
Grass2.y = baseline - -20

-- A per-frame event to move the elements
local tPrevious = system.getTimer()
local function move(event)
	local tDelta = event.time - tPrevious
	tPrevious = event.time

	local xOffset = ( 0.2 * tDelta )

	Grass.x = Grass.x - xOffset
	Grass2.x = Grass2.x - xOffset
	
	if (Grass.x + Grass.contentWidth) < 0 then
		Grass:translate( 480 * 2, 0)
	end
	if (Grass2.x + Grass2.contentWidth) < 0 then
		Grass2:translate( 480 * 2, 0)
	end
	
	local i
	for i = 1, #Things, 1 do
		Things[i].x = Things[i].x - Things[i].dx * tDelta * 0.2
		if (Things[i].x + Things[i].contentWidth) < 0 then
			Things[i]:translate( 480 + Things[i].contentWidth * 2, 0 )
		end
	end
end

-- Start everything moving
Runtime:addEventListener( "enterFrame", move );

--D1064422309 陸繼杵/美術
--D1064422304 郭勇發/程式
--D1064421302 關瑋程/美術
--D1064421307 蔡觀耀/美術