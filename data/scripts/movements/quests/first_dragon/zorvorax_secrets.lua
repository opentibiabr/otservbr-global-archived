local zorvoraxSecrets = MoveEvent()

function zorvoraxSecrets.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	for key, value in pairs(ActionTable) do
		if item.actionid == value.actionId then
			if player:getStorageValue(value.storage) < 1 then
				player:setStorageValue(value.storage, 1)
				player:setStorageValue(Storage.FirstDragon.SecretsCounter, player:getStorageValue(Storage.FirstDragon.SecretsCounter) + 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, value.msg)
				return true
			end
		end
	end
	return true
end

for value = 24890, 24892 do
	zorvoraxSecrets:aid(value)
end
zorvoraxSecrets:register()
