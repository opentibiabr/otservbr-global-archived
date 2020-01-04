-- shrines entrance
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
	local config = {"Teleport27", "Teleport28", "Teleport29", "Teleport30", "Teleport31", "Teleport32", "Teleport33", "Teleport34", "Teleport35", "Teleport36", "Teleport37", "Teleport38", "Teleport39", "Teleport40", "Teleport41", "Teleport42", "Teleport43", "Teleport44", "Teleport45", "Teleport46", "Teleport47", "Teleport48", "Teleport49", "Teleport50", "Teleport51", "Teleport52", "Teleport53", "Teleport54", "Teleport55", "Teleport56", "Teleport57", "Teleport58", "Teleport59", "Teleport60", "Teleport61", "Teleport62", "Teleport63", "Teleport64", "Teleport65", "Teleport66", "Teleport67", "Teleport68", "Teleport69", "Teleport70", "Teleport71", "Teleport72", "Teleport73", "Teleport74", "Teleport75", "Teleport76", "Teleport77", "Teleport78"}
	
	local player = creature:getPlayer()
	if not player then
		return false
	end
	
	for k, key in pairs(config) do
		local setting = GlobalConfig[key] 
		if setting.uniqueId == item.uid then
			player:teleportTo(setting.destination)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:setStorageValue(setting.storage, 1)
		end
	end
	if player:getLevel() < 30 then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('Only players of level 30 or higher may enter this portal.', TALKTYPE_MONSTER_SAY)
	end
return true
end

for uids = 5027,5078 do
moveevent:uid(uids)
end
moveevent:register()

-- shrines exit
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)

local config = {"ExitCarlin","ExitThais","ExitVenore","ExitAbDendriel","ExitKazordoon","ExitDarashia","ExitAndrahmun","ExitEdron","ExitLibertyBay","ExitPortHope","ExitSvarground","ExitYalahar","ExitOramond"}

	local player = creature:getPlayer()
	if not player then
		return
	end

	for k, key in pairs(config) do
		local setting = GlobalConfig[key]
		if (setting.actionId == item.actionid) then
			if player:getStorageValue(setting.storageKey) >= 1 then
				player:teleportTo(setting.destination)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:setStorageValue(setting.storageKey, 0)
				return true
			end
		end
	end

	player:teleportTo(player:getTown():getTemplePosition())
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

moveevent:aid(30000)
moveevent:register()
