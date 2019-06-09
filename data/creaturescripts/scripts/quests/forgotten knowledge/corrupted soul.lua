local function removeVortex2(position)
	local vortex = Tile(position):getItemById(26394) or Tile(position):getItemById(26395) or Tile(position):getItemById(26396)
	if vortex then
		vortex:remove()
	end
end
function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end
	local position = targetMonster:getPosition()
	local vortex = Tile(position):getItemById(26394) or Tile(position):getItemById(26395) or Tile(position):getItemById(26396)
	if not vortex then
		Game.createItem(26394, 1, position)
		return true
	end
	if vortex:getId() == 26394 then
		vortex:transform(26395)
	elseif vortex:getId() == 26395 then
		vortex:transform(26396)
	end
	addEvent(removeVortex2, 30 * 1000, position)
	return true
end
