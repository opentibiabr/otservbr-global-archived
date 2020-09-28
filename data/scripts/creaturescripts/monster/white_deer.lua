local config = {
	-- ordered by chance, the last chance being 100
	{chance = 30, monster = 'Enraged White Deer', message = 'The white deer summons all his strength and turns to fight!'},
	{chance = 100, monster = 'Desperate White Deer', message = 'The white deer desperately tries to escape!'}
}

local whiteDeerDeath = CreatureEvent("WhiteDeerDeath")
function whiteDeerDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster or targetMonster:getMaster() then
		return true
	end

	local chance = math.random(100)
	for i = 1, #config do
		if chance <= config[i].chance then
			local spawnMonster = Game.createMonster(config[i].monster, targetMonster:getPosition(), true, true)
			if spawnMonster then
				spawnMonster:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				targetMonster:say(config[i].message, TALKTYPE_MONSTER_SAY)
			end
			break
		end
	end
	return true
end
whiteDeerDeath:register()
