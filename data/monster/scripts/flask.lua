function onThink(monster, creature, type, message)
	if getGlobalStorageValue(GlobalStorage.CobraBastionFlask) < os.time() then
		return
	end
	if monster:getStorageValue(GlobalStorage.CobraBastionFlask) < 0 then -- Reutilizing storage value
		local percentageHealth = monster:getHealth() * (7/10)
		monster:setHealth(percentageHealth)
		doSendMagicEffect(monster:getPosition(), CONST_ME_GREENSMOKE)
		monster:setStorageValue(GlobalStorage.CobraBastionFlask, 0) -- Reutilizing storage value
	end
end
