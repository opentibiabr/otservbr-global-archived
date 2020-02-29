local zorvoraxSecrets = MoveEvent()

function zorvoraxSecrets.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end

	if player:getStorageValue(setting.storage) < 1 then
		player:setStorageValue(setting.storage, 1)
		player:setStorageValue(Storage.FirstDragon.SecretsCounter, player:getStorageValue(Storage.FirstDragon.SecretsCounter) + 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, setting.msg)
		return true
	end
	return true
end

for value = 24890, 24892 do
	zorvoraxSecrets:uid(value)
end
zorvoraxSecrets:register()
