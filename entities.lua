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
entdata = {}
ents = {}

function entdata.EntGraphics()
	entBluk0 = bgui.Image( "graphics/entBluk0.png" )
end

function entdata.Register( id, name, sname, graphic, etype, colour, health, damage, think )
	local t = {
		id = id,
		name = name,
		sname = sname,
		graphic = graphic,
		etype = etype,
		collour = colour,
		health = health,
		damage = damage,
		think = think
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
	activeEnts[ uid ] = t
	print( "Spawned " .. enttable.name .. " at " .. x .. ", " .. y )
	return t
end

function ents.Spawn( style )
end

function ents.Draw( style )
	for i, t in pairs( activeEnts ) do
		bgui.img( t.et.graphic, t.pos.x, t.pos.y, { 255, 255, 255 } )
	end
end

function ents.Think()
	for i, t in pairs( activeEnts ) do
		t.et.think( t )
	end
end