local exitPosition = Position(32605, 31902, 4)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end


	local ground = Tile(exitPosition):getGround()
	if ground and isInArray({369, 413}, ground.itemid) then
		ground:transform(ground.itemid == 369 and 413 or 369)

		if ground.itemid == 369 then
			local items = ground:getTile():getItems()
			if items then
				exitPosition.z = exitPosition.z + 1
				for i = 1, #items do
					items[i]:moveTo(exitPosition)
				end
			end
		end
	end

	item:transform(item.itemid == 1945 and 1946 or 1945)
	player:setStorageValue(Storage.Exaust.tempo, os.time())
	return true
end