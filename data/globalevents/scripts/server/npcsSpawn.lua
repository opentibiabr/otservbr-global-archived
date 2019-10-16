local function _spawnNPCs()
  for i = 1,#mapNpcs do
    local npc = mapNpcs[i]

    if npc and npc.name and npc.pos then
		local spawn = Game.createNpc(npc.name, npc.pos)
		if spawn then
			spawn:setMasterPos(npc.pos)
		end
    end
  end
  return true
end

function onStartup()
    addEvent(_spawnNPCs, 1 * 1000)
    print('Advanced NPC spawn system | All NPCs will be loaded trough lib, instead of spawn.xml. Keep in mind, all your NPCs should be working, neighter the system will have a breakpoint.')
    return true
end
--https://github.com/opentibiabr/OTServBR-Global
