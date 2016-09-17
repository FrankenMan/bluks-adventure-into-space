-- Libraries --
BScr = require "/lib/BScrMain"  -- BScr Library --
-- Files --
playerfile = require "player" 
entityfile = require "entities"

function love.load()
	entdata.EntGraphics()
	player.PlayerGraphics()
	ents.Spawn()
	selectBox = bgui.Image( "graphics/selectBox.png" )
	square10 = bgui.Image( "graphics/square10.png" )
	square20 = bgui.Image( "graphics/square20.png" )
	square30 = bgui.Image( "graphics/square30.png" )
	
	-- Bullet
	entdata.Register( 0, "plrWpB0", "Bullet", square10, "wep", { 255, 255, 255 }, 0, 0,
	function( s ) -- Spawn Gen
	return false end,
	function( i, self ) -- Spawn
	end,
	function( i, self ) -- Think
		self.pos.y = self.pos.y - 1.5
		for li, t in pairs( activeEnts ) do
			if t.et.etype == "enm" and math.Between( self.pos.x, t.pos.x, t.pos.x + t.et.graphic:getWidth() ) and math.Between( self.pos.y, t.pos.y, t.pos.y + t.et.graphic:getHeight() ) then
				t.et.kill( li, t )
				self.et.kill( i, self )
			end
		end
		if self.pos.y < 0 then
			self.et.kill( i, self )
		end
	end,
	function( i, self ) -- Kill
		activeEnts[ i ] = nil
	end )
	
	-- Weak Enemy 1
	entdata.Register( 1, "wEnem1", "Enemy", square20, "enm", { 255, 0, 0 }, 10, 0,
	function( i ) -- Spawn Gen
		for w = width, 0, -50 do
			entdata.spawnEnt( game.ents[ i ], w, 90, 10, activeEntCount + 1 )
		end
	end,
	function( i, self ) -- Spawn
	end,
	function( i, self ) -- Think
	end,
	function( i, self ) -- Kill
		activeEnts[ i ] = nil
	end )
	for i, t in pairs( game.ents ) do
		t.genEnt( i )
	end
end

function love.update()
	width, height = bgui.Dimensions()
	mousex, mousey = game.mousePos()
	player.Control()
	ents.Think()
end

function love.draw()
	love.graphics.push()
	love.graphics.rotate( 0 )
	love.graphics.scale( 1.25 )
	player.Draw()
	ents.Draw()
	love.graphics.pop()
	player.HUD()
end

function love.mousepressed( x, y, button, isTouch )
	
end

function love.keypressed( key, scancode, isTouch )
	if scancode == "space" then
		entdata.spawnEnt( game.ents[ 0 ], player.pos.x + 15, player.pos.y - 10, 0, activeEntCount + 1 )
	end
	
	if scancode == "escape" then
		
	end
end

-- BScrLib Functions -- CreateData -- SaveData -- LoadData --
function game.CreateData( datafile ) -- Create Data File --
	datafile:write( "nil" ) -- / --
end

function game.SaveData( datafile ) -- Save Data File --
	datafile:write( "nil" )
end

function game.LoadData( save, data ) -- Load Data File --
end