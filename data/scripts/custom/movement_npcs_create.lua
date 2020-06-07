local function loadCustomNpcs()
	for index, value in pairs(CustomNpcTable) do
		if value.name and value.position then
			local spawn = Game.createNpc(value.name, value.position)
			if spawn then
				spawn:setMasterPos(value.position)
				Game.setStorageValue(Storage.NpcSpawn, 1)
			end
		end
	end
end

local spawnNpcs = MoveEvent()
function spawnNpcs.onStepIn(creature, item, position, fromPosition)
	if Game.getStorageValue(Storage.NpcSpawn) == -1 then
		return loadCustomNpcs()
	end
	return true
end

spawnNpcs:uid(25032)
spawnNpcs:register()
