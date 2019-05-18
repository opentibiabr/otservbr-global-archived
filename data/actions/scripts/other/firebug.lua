local function revert(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end
-- eu editei, vc vai copiar essa parte da quest pro seu script
function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	-- ferumbras ascendant
	if target.actionid == 54387 and target.itemid == 25531 then
		if player:getStorageValue(Storage.FerumbrasAscension.BasinCounter) >= 8 or player:getStorageValue(Storage.FerumbrasAscension.BoneFlute) < 1 then
			return false
		end
		if player:getStorageValue(Storage.FerumbrasAscension.BasinCounter) < 0 then
			player:setStorageValue(Storage.FerumbrasAscension.BasinCounter, 0)
		end
		if player:getStorageValue(Storage.FerumbrasAscension.BasinCounter) == 7 then
			player:say('You ascended the last basin.', TALKTYPE_MONSTER_SAY)
			item:remove()
			player:setStorageValue(Storage.FerumbrasAscension.MonsterDoor, 1)
		end
		target:transform(25532)
		player:setStorageValue(Storage.FerumbrasAscension.BasinCounter, player:getStorageValue(Storage.FerumbrasAscension.BasinCounter) + 1)
		toPosition:sendMagicEffect(CONST_ME_FIREAREA)
		addEvent(revert, 2 * 60 * 1000, toPosition, 25532, 25531)
		player:setStorageValue(Storage.Exaust.tempo, os.time())
		return true
	end
	return true
end