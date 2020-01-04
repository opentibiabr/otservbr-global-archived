-- vengoth teleports
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, fromPosition, toPosition)
	local config ={"Teleport17", "Teleport18", "Teleport19", "Teleport20", "Teleport21", "Teleport22", "Teleport23", "Teleport24", "Teleport25", "Teleport26"}
	
	local player = creature:getPlayer()
	if not player then
		return false
	end
	
	for k, key in pairs(config) do
	local setting = GlobalConfig[key] 
		if setting.uniqueId == item.uid then
			player:teleportTo(setting.destination)
			player:getPosition():sendMagicEffect(CONST_ME_PURPLEENERGY)
		end
	end
return true
end

for uids = 5017,5026 do
moveevent:uid(uids)
end
moveevent:register()