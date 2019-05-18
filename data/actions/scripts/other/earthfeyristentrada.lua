function onUse(creature, item, position, fromPosition, pos, target, toPosition)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	local player = creature:getPlayer()
	local tilepos1 = {x=32973, y=32226, z=7}
	local tilepos2 = {x=32974, y=32226, z=7}
	local tilepos3 = {x=32973, y=32225, z=7}
	local tilepos4 = {x=32974, y=32225, z=7}
	if not player then
		return
	end
	if player:getItemCount(2149) >= 1 and pos.x == tilepos1.x or pos.x == tilepos2.x and pos.y == tilepos1.y or pos.y == tilepos3.y and pos.z == tilepos1.z   then
	    player:removeItem(2149, 1)
		player:teleportTo(Position(33539,32209, 7))
		player:getPosition():sendMagicEffect(CONST_ME_SMALLPLANTS)
		player:setStorageValue(Storage.Exaust.tempo, os.time())
		return true	
	end
	return true
end
