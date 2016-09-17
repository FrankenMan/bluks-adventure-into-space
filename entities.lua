--[[
	Non-Boss entities should be 40x40.
	!!! ENTDATA FORMAT !!!
		ENT ID
		ENT NAME
		ENT SIMPLENAME
		ENT GRAPHIC
		ENT TYPE
		ENT COLOUR
		ENT HEALTH
		ENT DAMAGE
	!!! ENTDATA FORMAT !!!
	!!! WORLDENT FORMAT !!!
		ENT UNIQUE ID
		ENT TABLE
		ENT POS[ X, Y ]
		ENT HEALTH
	!!! WORLDENT FORMAT !!!
--]]
game.ents = {}
world.ents = {}
world.activeEnts = 0
entdata = {}
ents = {}

function entdata.EntGraphics()
	entBluk0 = bgui.Image( "graphics/entBluk0.png" )
end

function entdata.Register( id, name, sname, graphic, etype, colour, health, damage )
	local bd = {
		id = id,
		name = name,
		sname = sname,
		graphic = graphic,
		etype = etype,
		colour = colour,
		health = health,
		damage = damage
	}
	game.ents[ id ] = bd
	return bd
end

function blockdata.getRegisteredEnts( filter, filterby )
	local returnEnts = {}
	if filter == true then
		for k, v in pairs( game.ents ) do
			if v[ k ] == filter then
				table.insert( returnEnts, v )
			end
		end
	else
		return game.ents
	end
	return returnEnts
end

function entdata.spawnEnt( enttable, x, y, health )
	world.activeEnts = world.activeEnts + 1
	local ed = {
		id = world.activeEnts,
		et = enttable,
		pos = { x = x, y = y },
		health = health
	}
	world.ents[ world.activeEnts ] = ed
	print( "Spawned " .. enttable[ "name" ] .. " at " .. x .. ", " .. y )
	return ed
end

function ents.Spawn( style )
	print( "Spawning entities..." )
	for h = height, 0, -30 do
		for w = world.xlimit, -world.xlimit, -30 do
			if h < 360 and math.random( 14, 1500 ) < 17 then
				entdata.spawnEnt( game.ents[ 1 ], w, h, game.ents[ 1 ][ "health" ] )
			end
		end
	end
	print( "Spawned entities." )
end

function ents.Draw( style )
	for i, t in pairs( world.ents ) do
		bgui.img( t[ "et" ][ "graphic" ], t[ "pos" ][ "x" ], t[ "pos" ][ "y" ], { t[ "et" ][ "colour" ][ 1 ] - world.time, t[ "et" ][ "colour" ][ 2 ] - world.time, t[ "et" ][ "colour" ][ 3 ] - world.time, t[ "et" ][ "colour" ][ 4 ] } )
		bgui.text( t[ "et" ][ "sname" ], t[ "pos" ][ "x" ] + 8, t[ "pos" ][ "y" ] + 40, "font/SourceSansProBold.ttf", 12, { 255, 255, 255, 255 }, "left" )
		bgui.text( t[ "health" ], t[ "pos" ][ "x" ] + 15, t[ "pos" ][ "y" ] + 48, "font/SourceSansProBold.ttf", 10, { 255, 255, 255, 255 }, "left" )
	end
end

function ents.Physics()
	for k, e in pairs( world.ents ) do
		local sFall = true
		for i, t in pairs( world.blocks ) do
			if math.Between( e[ "pos" ][ "y" ], t[ "by" ] - 40, t[ "by" ] ) and math.Between( e[ "pos" ][ "x" ], t[ "bx" ], t[ "bx" ] + 120 ) and t[ "bt" ][ "collisions" ] then
				sFall = false
			end
		end
		if sFall == true then
			e[ "pos" ][ "y" ] = e[ "pos" ][ "y" ] + 2
		end
	end
end