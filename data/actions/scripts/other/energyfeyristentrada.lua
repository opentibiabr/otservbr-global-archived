function onUse(creature, item, position, fromPosition, pos, target, toPosition)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	local player = creature:getPlayer()
	local tilepos1 = {x=33060, y=32714, z=5}
	local tilepos2 = {x=33061, y=32714, z=5}
	local tilepos3 = {x=33060, y=32713, z=5}
	local tilepos4 = {x=33061, y=32713, z=5}
	if not player then
		return
	end
	if player:getItemCount(2146) >= 1 and pos.x == tilepos1.x or pos.x == tilepos2.x and pos.y == tilepos1.y or pos.y == tilepos3.y and pos.z == tilepos1.z   then
	    player:removeItem(2146, 1)
		player:teleportTo(Position(33527,32301, 4))
		player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
		return true	
	end
	player:setStorageValue(Storage.Exaust.tempo, os.time())
	return true
end