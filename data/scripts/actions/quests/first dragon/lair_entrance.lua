local lairEntrance = Action()

function lairEntrance.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end
	
	if item.actionid == 24886 then
		if player:getStorageValue(Storage.FirstDragon.AccessCave) <= 3 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not worthy to enter in The First Dragon's Lair yet.")
			return true
		end
	end
	player:teleportTo(setting.destination)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

for value = 24894,24896 do
	lairEntrance:uid(value)
end

lairEntrance:register()
