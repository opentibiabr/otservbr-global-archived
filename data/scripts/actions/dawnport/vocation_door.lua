local vocationDoor = Action()

function vocationDoor.onUse(player, item, target, position, fromPosition)
	local setting = UniqueTable[item.uid]
	if player:getStorageValue(setting.storage) == setting.vocation then --Check Oressa storage before choose vocation
		player:teleportTo(setting.destination)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(setting.storage, -1) --Delete storage
	elseif player:getStorageValue(setting.storage) ~= setting.vocation then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
	end
	return true
end

vocationDoor:uid(25017, 25018, 25019, 25020)
vocationDoor:register()