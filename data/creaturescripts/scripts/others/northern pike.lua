function onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
local chance = math.random(1, 100)
	if chance < 50 then
		Game.createMonster("Slippery Northern Pike", creature:getPosition())
	else
	end
end
