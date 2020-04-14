function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playerPos = player:getPosition()
	if player:getStorageValue(Storage.ShadownofYalahar.Questline) == 6 then
		local pos = Position(playerPos.x, playerPos.y - 5, 11)
		local tile = Tile(pos)
		if tile:getItemById(10059) then
			player:setStorageValue(Storage.BigfootBurden.Shooting, player:getStorageValue(Storage.BigfootBurden.Shooting) + 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Hit!")
			pos:sendMagicEffect(CONST_ME_FIREATTACK)
			player:setStorageValue(Storage.ShadownofYalahar.Questline, 7)
			for i = 2, 4 do
				Position(playerPos.x, playerPos.y - i, 11):sendMagicEffect(CONST_ME_TELEPORT)
			end
			
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have hit enough target.")
	end
	return true
end