local posTile = {
	Pos1 = {x = 33830, y = 31628, z = 9},
	Pos2 = {x = 33832, y = 31628, z = 9},
	Pos3 = {x = 33834, y = 31628, z = 9},
}

local firesRandom = {
	fireon = 7527,
	fireoff = 1485,
}





local modfire = GlobalEvent("Modif Fire")

function modfire.onThink(interval)


local randomfire = firesRandom[math.random(#firesRandom)]
local randomposi = posTile[math.random(#posTile)]

local fogotest1 = Tile(posTile.Pos1):getItemById(7527)
local fogotest2 = Tile(posTile.Pos1):getItemById(1485)

local fogotest3 = Tile(posTile.Pos2):getItemById(7527)
local fogotest4 = Tile(posTile.Pos2):getItemById(1485)

local fogotest5 = Tile(posTile.Pos3):getItemById(7527)
local fogotest6 = Tile(posTile.Pos3):getItemById(1485)


if fogotest1 then
	fogotest1:transform(1485)
	fogotest3:transform(1485)
	fogotest5:transform(1485)
elseif fogotest2 then
	fogotest2:transform(7527)
	fogotest4:transform(7527)
	fogotest6:transform(7527)
end

	-- fogotest1:remove(7527)
	-- Game.createItem(7527, 1, posTile.Pos1)
	-- Tile:remove(posTile.Pos1, 1)
	-- Game.createItem(7527, 1, posTile.Pos1)
	-- item:transform(item.itemid == 7527 and 1485)



   return true
end

modfire:interval(3000)
modfire:register()














