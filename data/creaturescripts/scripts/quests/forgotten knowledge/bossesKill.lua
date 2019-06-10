local bosses = {
	-- bosses
	['lady tenebris'] = {killed = Storage.ForgottenKnowledge.LadyTenebrisKilled},
	['the enraged thorn knight'] = {killed = Storage.ForgottenKnowledge.ThornKnightKilled},
	['lloyd'] = {killed = Storage.ForgottenKnowledge.LloydKilled},
	['soul of dragonking zyrtarch'] = {killed = Storage.ForgottenKnowledge.DragonkingKilled},
	['melting frozen horror'] = {killed = Storage.ForgottenKnowledge.HorrorKilled},
	['the time guardian'] = {killed = Storage.ForgottenKnowledge.TimeGuardianKilled},
	['the blazing time guardian'] = {killed = Storage.ForgottenKnowledge.TimeGuardianKilled},
	['the freezing time guardian'] = {killed = Storage.ForgottenKnowledge.TimeGuardianKilled},
	['the last lore keeper'] = {killed = Storage.ForgottenKnowledge.LastLoreKilled},
	-- IA interactions
	['an astral glyph'] = {}
}

function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster or targetMonster:getMaster() then
		return true
	end
	local bossConfig = bosses[targetMonster:getName():lower()]
	if not bossConfig then
		return true
	end
	for pid, _ in pairs(targetMonster:getDamageMap()) do
		local attackerPlayer = Player(pid)
		if attackerPlayer then
			if bossConfig.killed then
				attackerPlayer:setExhaustion(bossConfig.killed, 30 * 60 * 1000)
			elseif targetMonster:getName():lower() == 'the enraged thorn knight' then
				attackerPlayer:setStorageValue(Storage.ForgottenKnowledge.PlantCounter, 0)
				attackerPlayer:setStorageValue(Storage.ForgottenKnowledge.BirdCounter, 0)
			elseif targetMonster:getName():lower() == 'melting frozen horror' then
			local egg, horror = Tile(Position(32269, 31084, 14)):getTopCreature(), Tile(Position(32267, 31071, 14)):getTopCreature()
				if egg then
					local pos = egg:getPosition()
					egg:remove()
					Game.createMonster('baby dragon', pos, true, true)
				end
				if horror then
					horror:remove()
				end
			end
		end
	end
	return true
end
