-- this is the script to become a resident of a certain city, it is necessary to configure the variables and storages, however the script is functional

local citizen = MoveEvent()

function citizen.onStepIn(creature, item, position, fromPosition)
	
	local config ={
		"Teleport105", "Teleport106", "Teleport107", "Teleport108", "Teleport109", "Teleport110", "Teleport111", "Teleport112", "Teleport113", "Teleport114", "Teleport115", "Teleport116", "Teleport117", "Teleport118", "Teleport119", "Teleport120"}
		
	local player = creature:getPlayer()
	if not player then
		return true
	end

	for k, key in pairs(config) do
		local setting = GlobalConfig[key]
		if (setting.uniqueId == item.uid) then
			player:setTown(Town(setting.townId))
			player:teleportTo(setting.townId:getTemplePosition())
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You are now a citizen of ' .. setting.townId:getName() .. '.')
		end
		if Town(svarground):getId() == 12 and player:getStorageValue(Storage.BarbarianTest.Questline) < 8 then
		player:sendTextMessage(MESSAGE_STATUS_WARNING, 'You first need to absolve the Barbarian Test Quest to become citizen!')
		player:teleportTo(setting.townId:getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
return true
end

citizen:id(1949)
citizen:register()
