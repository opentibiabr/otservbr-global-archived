local function checkTentacle()
	local spectators = Game.getSpectators(Position(33740, 31953, 14), false, false, 13, 13, 13, 13)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isMonster() and spectator:getName():lower() == 'tentacle of the deep terror' and spectator:getHealth() >= 1 then
			Game.createMonster('tentacle of the deep terror', Position(math.random(33736, 33746), math.random(31948, 31957), 14), true, true)
			return true
		elseif spectator:isMonster() then
			if Game.getStorageValue(GlobalStorage.HeroRathleton.DeepRunning) == 2 then
				return true
			end
			Game.createMonster('Deep Terror', Position(33741, 31953, 14), true, true)
			Game.setStorageValue(GlobalStorage.HeroRathleton.DeepRunning, 2)
			return true
		end
	end
end
function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end
	addEvent(checkTentacle, 5 * 1000)
	return true
end
