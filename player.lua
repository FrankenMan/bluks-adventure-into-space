--[[
	Player is 30x60.
--]]
player = {}
player.graphic = false
player.health = 100
player.falling = false
player.jumping = false
player.pos = {
	x = 120,
	y = 120
}
player.inv = {}

function player.Draw()
	bgui.img( nPlr, player.pos[ "x" ], player.pos[ "y" ], { 255 - world.time, 255 - world.time, 255 - world.time } )
end

function player.PlayerGraphics()
	nPlr = bgui.Image( "graphics/nPlr0.png" )
	player.graphic = nPlr
end

function player.Physics()
	local sFall = true
	for i, t in pairs( world.blocks ) do
		if math.Between( player.pos[ "y" ], t[ "by" ] - 60, t[ "by" ] ) and math.Between( player.pos[ "x" ], t[ "bx" ], t[ "bx" ] + 120 ) and t[ "bt" ][ "collisions" ] then
			sFall = false
			player.falling = false
		end
	end
	if sFall and player.jumping == false then
		player.pos[ "y" ] = player.pos[ "y" ] + 2
		player.falling = true
	end
end

function player.Control()
	if love.keyboard.isDown( "a" ) then
		player.MoveLeft()
	end
	
	if love.keyboard.isDown( "d" ) then
		player.MoveRight()
	end
	
	if love.keyboard.isDown( "space" ) then
		player.Jump()
	end
end

function player.MoveLeft()
	local cMove = true
	if player.pos[ "x" ] == 0 - world.xlimit then
		cMove = false
	end
	if cMove then
		player.pos[ "x" ] = player.pos[ "x" ] - 4
	end
end

function player.MoveRight()
	local cMove = true
	if player.pos[ "x" ] == width - 30 then
		cMove = false
	end
	if cMove then
		player.pos[ "x" ] = player.pos[ "x" ] + 4
	end
end

function player.Jump()
	if player.falling == false then
		for i = 9, 0, -0.025 do
			player.pos[ "y" ] = player.pos[ "y" ] - 0.15
			player.jumping = true
		end
		player.jumping = false
	end
end

function player.HUD()
	bgui.text( "Health: " .. player.health, 10, height - 30, "font/VarelaRound.ttf", 25, { 255, 255, 255, 255 }, "left" )
	bgui.text( "MouseX - " .. mousex, 0, 0, "font/Merriweather.ttf", 10, { 255, 255, 255, 255 }, "left" )
	bgui.text( "MouseY - " .. mousey, 0, 15, "font/Merriweather.ttf", 10, { 255, 255, 255, 255 }, "left" )
	bgui.text( "PlayerX - " .. player.pos[ "x" ], 0, 30, "font/Merriweather.ttf", 10, { 255, 255, 255, 255 }, "left" )
	bgui.text( "PlayerY - " .. player.pos[ "y" ], 0, 45, "font/Merriweather.ttf", 10, { 255, 255, 255, 255 }, "left" )
	bgui.text( "WTime - " .. world.time, 0, 60, "font/Merriweather.ttf", 10, { 255, 255, 255, 255 }, "left" )
	bgui.text( "FPS - " .. tostring( love.timer.getFPS() ), 0, 75, "font/Merriweather.ttf", 10, { 255, 255, 255, 255 }, "left" )
end