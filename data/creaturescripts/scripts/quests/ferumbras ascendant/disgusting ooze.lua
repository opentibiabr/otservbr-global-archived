function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local targetMonster = creature:getMonster()
	local position = targetMonster:getPosition()
	if not targetMonster or targetMonster:getName():lower() ~= 'disgusting ooze' then
		return true
	end
	local master = targetMonster:getMaster()
	local chance = math.random(20)
	if chance < 3 then
		for i = 1, 2 do
			local m = Game.createMonster('Disgusting Ooze', position, false, true)
			if not m then
				return true
			end
			m:setMaster(master)
		end
		targetMonster:say('The ooze splits and regenerates.', TALKTYPE_MONSTER_SAY)
	end
	return true
end
