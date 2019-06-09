function onThink(creature)

	if not creature:isCreature() then return false end

	local hp = (creature:getHealth() / creature:getMaxHealth()) * 100

	if hp <= 80 and ruptureResonanceStage == 0 and resonanceActive == false then
		Game.createMonster("Spark of Destruction", {x = 32331, y = 31254, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32338, y = 31254, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32330, y = 31250, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32338, y = 31250, z = 14}, false, true)
		Game.createMonster("Damage Resonance", {x = 32332, y = 31250, z = 14}, false, true)
		ruptureResonanceStage = 1
		resonanceActive = true
	elseif hp <= 60 and ruptureResonanceStage == 1 and resonanceActive == false then
		Game.createMonster("Spark of Destruction", {x = 32331, y = 31254, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32338, y = 31254, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32330, y = 31250, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32338, y = 31250, z = 14}, false, true)
		Game.createMonster("Damage Resonance", {x = 32332, y = 31250, z = 14}, false, true)
		ruptureResonanceStage = 2
		resonanceActive = true
	elseif hp <= 40 and ruptureResonanceStage == 2 and resonanceActive == false then
		Game.createMonster("Spark of Destruction", {x = 32331, y = 31254, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32338, y = 31254, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32330, y = 31250, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32338, y = 31250, z = 14}, false, true)
		Game.createMonster("Damage Resonance", {x = 32332, y = 31250, z = 14}, false, true)
		ruptureResonanceStage = 3
		resonanceActive = true
	elseif hp <= 25 and ruptureResonanceStage == 3 and resonanceActive == false then
		Game.createMonster("Spark of Destruction", {x = 32331, y = 31254, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32338, y = 31254, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32330, y = 31250, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32338, y = 31250, z = 14}, false, true)
		Game.createMonster("Damage Resonance", {x = 32332, y = 31250, z = 14}, false, true)
		ruptureResonanceStage = 4
		resonanceActive = true
	elseif hp <= 10 and ruptureResonanceStage == 4 and resonanceActive == false then
		Game.createMonster("Spark of Destruction", {x = 32331, y = 31254, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32338, y = 31254, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32330, y = 31250, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32338, y = 31250, z = 14}, false, true)
		Game.createMonster("Damage Resonance", {x = 32332, y = 31250, z = 14}, false, true)
		ruptureResonanceStage = -1
		resonanceActive = true
	end

    return true
end
