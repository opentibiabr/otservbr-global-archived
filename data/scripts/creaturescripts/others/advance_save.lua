local config = {
	heal = true,
	save = true,
	effect = false
}

local advanceSave = CreatureEvent("AdvanceSave")
function advanceSave.onAdvance(player, skill, oldLevel, newLevel)
	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end
	
	-- Handle stats gain for vocations level <= 8
	if player:getVocation():getId() ~= VOCATION.ID.NONE and newLevel <= 8 then
		local stats = {health = 150, mana = 55, capacity = 40000}
		local level = newLevel - 1
		local baseVocation = Vocation(VOCATION.ID.NONE)

		stats.health = stats.health + (level * baseVocation:getHealthGain())
		stats.mana = stats.mana + (level * baseVocation:getManaGain())
		stats.capacity = stats.capacity + (level * baseVocation:getCapacityGain())
		
		-- Stats override
		player:setMaxHealth(stats.health)
		player:addHealth(stats.health)
		player:setMaxMana(stats.mana)
		player:addMana(stats.mana)
		player:setCapacity(stats.capacity)
		
		print("[onAdvance -> " .. player:getVocation():getName() .. " Level:" .. player:getLevel() .. "]" .. " health:" .. stats.health .. " mana:" .. stats.mana .. " capacity:" .. stats.capacity)
	end

	if config.effect then
		player:getPosition():sendMagicEffect(math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
		player:say('LEVEL UP!', TALKTYPE_MONSTER_SAY)
	end

	if config.heal then
		player:addHealth(player:getMaxHealth())
	end

	if config.save then
		player:save()
	end
	return true
end
advanceSave:register()
