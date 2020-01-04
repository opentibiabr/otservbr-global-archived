-- deeper banuta shortcut teleports
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, fromPosition, toPosition)
	local config ={"Teleport8", "Teleport9", "Teleport10"}
	
	local player = creature:getPlayer()
	if not player then
		return false
	end
	
	for k, key in pairs(config) do
		local setting = GlobalConfig[key] 
		if setting.uniqueId == item.uid then
			if player:getStorageValue(Storage.DeeperBanutaShortcut) < 100 then
				player:teleportTo(setting.destination)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			end
		end
	end
	return true
end


for uids = 5008,5010 do
moveevent:uid(uids)
end
moveevent:register()

-- porthope deathlings entrance/exit
local moveevent = MoveEvent()

function onStepIn(creature, item, fromPosition, toPosition)

	local config ={
		"Teleport11",
		"Teleport12"
	}
	
	local player = creature:getPlayer()
	if not player then
		return false
	end

	for k, key in pairs(config) do
		local setting = GlobalConfig[key] 
		if setting.uniqueId == item.uid then
			player:teleportTo(setting.destination)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
	return true
end

moveevent:uid(5011,5012)
moveevent:register()