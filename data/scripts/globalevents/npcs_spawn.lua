-- This script load the file in libs/tables/npcs_spawn_list.lua)
local npcSpawn = GlobalEvent("NPCSpawnLoad")

function npcSpawn.onStartup()
	for i = 1,#NpcTable do
		local npc = NpcTable[i]
		if npc and npc.name and npc.position then
			local spawn = Game.createNpc(npc.name, npc.position)
			if spawn then
				spawn:setMasterPos(npc.position)
			end
		end
	end
	return true
end

npcSpawn:register()
