function onUse(creature, item, position, fromPosition, pos, target, toPosition)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	local player = creature:getPlayer()
	local tilepos1 = {x=32194, y=31419, z=2}
	local tilepos2 = {x=32195, y=31419, z=2}
	local tilepos3 = {x=32194, y=31418, z=2}
	local tilepos4 = {x=32195, y=31418, z=2}
	if not player then
		return
	end
	if player:getItemCount(2150) >= 1 and pos.x == tilepos1.x or pos.x == tilepos2.x and pos.y == tilepos1.y or pos.y == tilepos3.y and pos.z == tilepos1.z   then
	    player:removeItem(2150, 1)
		player:teleportTo(Position(33430,32278, 7))
		player:getPosition():sendMagicEffect(CONST_ME_ICEATTACK)
		return true	
	end
	player:setStorageValue(Storage.Exaust.Time, os.time())
	return true
end