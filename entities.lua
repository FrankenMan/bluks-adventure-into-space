--[[
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
--]] -- no idea
game.ents = {}
activeEnts = {}
activeEntCount = 0
entdata = {}
ents = {}

function entdata.EntGraphics()
	entBluk0 = bgui.Image( "graphics/entBluk0.png" )
end

function entdata.Register( id, name, sname, graphic, etype, colour, health, damage, genEnt, onSpawn, think, kill )
	local t = {
		id = id,
		name = name,
		sname = sname,
		graphic = graphic,
		etype = etype,
		colour = colour,
		health = health,
		damage = damage,
		genEnt = genEnt,
		onSpawn = onSpawn,
		think = think,
		kill = kill
	}
	game.ents[ id ] = t
	return t
end

function entdata.spawnEnt( enttable, x, y, health, uid )
	local t = {
		et = enttable,
		uid = uid,
		pos = { x = x, y = y },
		health = health
	}
	t.et.onSpawn( uid, t )
	activeEnts[ uid ] = t
	activeEntCount = activeEntCount + 1
	print( "Spawned " .. enttable.name .. " at " .. x .. ", " .. y )
	return t
end

function ents.Spawn( style )
end

function ents.Draw( style )
	for i, t in pairs( activeEnts ) do
		bgui.img( t.et.graphic, t.pos.x, t.pos.y, t.et.colour )
	end
end

function ents.Think()
	for i, t in pairs( activeEnts ) do
		t.et.think( i, t )
	end
end