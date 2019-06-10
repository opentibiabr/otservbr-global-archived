local positions = {
	[1] = {pos = Position(31975, 32856, 15), nextPos = Position(31975, 32839, 15)},
	[2] = {pos = Position(31975, 32839, 15), nextPos = Position(31995, 32839, 15)},
	[3] = {pos = Position(31995, 32839, 15), nextPos = Position(31995, 32856, 15)},
	[4] = {pos = Position(31995, 32856, 15), nextPos = Position(31975, 32856, 15)}
}

function onKill(creature, target)
	local targetMonster = target:getMonster()
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if not targetMonster or targetMonster:getMaster() then
		return true
	end
	local bossConfig = targetMonster:getName():lower() == 'bound astral power'
	if not bossConfig then
		return true
	end
	Game.setStorageValue(GlobalStorage.ForgottenKnowledge.AstralPowerCounter, Game.getStorageValue(GlobalStorage.ForgottenKnowledge.AstralPowerCounter) + 1)
	if Game.getStorageValue(GlobalStorage.ForgottenKnowledge.AstralPowerCounter) >= 4 then
		Game.setStorageValue(GlobalStorage.ForgottenKnowledge.AstralPowerCounter, 1)
	end
	local pos
	for i = 1, #positions do
		if creature:getPosition():getDistance(positions[i].pos) < 7 then
			target:say('The destruction of the power source gained you more time until the glyph is powered up!', TALKTYPE_MONSTER_SAY, false, nil, positions[i].pos)
			Game.createMonster('bound astral power', positions[i].nextPos, true, true)
			Game.setStorageValue(GlobalStorage.ForgottenKnowledge.AstralGlyph, 1)
			addEvent(Game.setStorageValue, 1 * 60 * 1000, GlobalStorage.ForgottenKnowledge.AstralGlyph, 0)
		end
	end
	return true
end
