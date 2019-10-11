local function _spawnNPCs()
  for i = 1,#mapNpcs do
    local npc = mapNpcs[i]

    if npc and npc.name and npc.pos then
      local customNpc = Game.createNpc(npc.name, npc.pos)

    end
  end
  return true
end

function onStartup()
    addEvent(_spawnNPCs, 1 * 1000)
    print('Advanced NPC spawn system.')
    return true
end