function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)

	local healthGain = math.random(5000,10000)
	if attacker and attacker:isPlayer() and resonanceActive == true then
		creature:addHealth(healthGain)
		creature:getPosition():sendMagicEffect(15)
	end

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end
