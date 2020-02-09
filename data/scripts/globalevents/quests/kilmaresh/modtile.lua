local posTile = {
	Pos1 = {x = 33829, y = 31616, z = 9},
	Pos2 = {x = 33831, y = 31616, z = 9},
	Pos3 = {x = 33833, y = 31616, z = 9},
	Pos4 = {x = 33835, y = 31616, z = 9},
}

local tilesRandom = {
	{413},
	{414},
	{415},
	{420},
}
 
local modtile = GlobalEvent("Modif Tile")

function modtile.onThink(interval)


local randomposi = tilesRandom[math.random(#tilesRandom)]

local fogotest1 = Tile(posTile.Pos1):getItemById(413)
local fogotest2 = Tile(posTile.Pos1):getItemById(414)
local fogotest3 = Tile(posTile.Pos1):getItemById(415)
local fogotest4 = Tile(posTile.Pos1):getItemById(420)

local fogotest5 = Tile(posTile.Pos2):getItemById(413)
local fogotest6 = Tile(posTile.Pos2):getItemById(414)
local fogotest7 = Tile(posTile.Pos2):getItemById(415)
local fogotest8 = Tile(posTile.Pos2):getItemById(420)

local fogotest9 = Tile(posTile.Pos3):getItemById(413)
local fogotest10 = Tile(posTile.Pos3):getItemById(414)
local fogotest11 = Tile(posTile.Pos3):getItemById(415)
local fogotest12 = Tile(posTile.Pos3):getItemById(420)

local fogotest13 = Tile(posTile.Pos4):getItemById(413)
local fogotest14 = Tile(posTile.Pos4):getItemById(414)
local fogotest15 = Tile(posTile.Pos4):getItemById(415)
local fogotest16 = Tile(posTile.Pos4):getItemById(420)

if fogotest1 then
	fogotest1:transform(414)
	fogotest5:transform(414)
	fogotest9:transform(414)
	fogotest13:transform(414)
elseif fogotest2 then
	fogotest2:transform(415)
	fogotest6:transform(415)
	fogotest10:transform(415)
	fogotest14:transform(415)
elseif fogotest3 then
	fogotest3:transform(420)
	fogotest7:transform(420)
	fogotest11:transform(420)
	fogotest15:transform(420)
elseif fogotest4 then
	fogotest4:transform(413)
	fogotest8:transform(413)
	fogotest12:transform(413)
	fogotest16:transform(413)
end


	
	
	
		


   return true
end

modtile:interval(5000)
modtile:register()














