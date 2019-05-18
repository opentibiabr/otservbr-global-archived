local config = {
	['Monday'] = Position(32209, 31158, 7),
	['Tuesday'] = Position(32290, 32831, 7),
	['Wednesday'] = Position(32579, 32754, 7),
	['Thursday'] = Position(33066, 32880, 6),
	['Friday'] = Position(33239, 32483, 7),
	['Saturday'] = Position(33171, 31810, 6),
	['Sunday'] = Position(32326, 31783, 6)
}

-- Should Rashid spawn as in real tibia?
local spawnByDay = true

function onStartup()

	if spawnByDay then
		local npc = Game.createNpc('Rashid', config[os.date('%A')], false, true)
		if npc then
			npc:setMasterPos(config[os.date('%A')])
		end
	else
		local npc
		for k, position in pairs(config) do
			npc = Game.createNpc('Rashid', position, false, true)
			if npc then
				npc:setMasterPos(position)
			end
		end
	end

	return true
end
