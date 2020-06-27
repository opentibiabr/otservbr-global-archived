local function loadLuaCustomNpcs()
	for index, value in pairs(CustomNpcTable) do
		if value.name and value.position then
			local spawn = Game.createNpc(value.name, value.position)
			if spawn then
				spawn:setMasterPos(value.position)
				Game.setStorageValue(Storage.NpcSpawn, -1)
			end
		end
	end
end

local spawnNpcs = MoveEvent()
function spawnNpcs.onStepIn(creature, item, position, fromPosition)
	if not creature:getPlayer() then
		return true
	end

	if Game.getStorageValue(Storage.NpcSpawn) == 1 then
		creature:teleportTo({x = 1054, y = 1040, z = 7})
		loadLuaCustomNpcs()
	end
	return true
end

spawnNpcs:position({x = 32373, y = 32236, z = 7})
spawnNpcs:register()
