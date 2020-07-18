function onStepIn(creature, item, position, fromPosition)
	if item.itemid == 25550 then
		if creature:isMonster() then
			if creature:getName():lower() == "charged anomaly" then
				creature:addHealth(-6000, true, COMBAT_DROWNDAMAGE)
			end
		elseif isPlayer(creature) then
			creature:addHealth(-100, true, COMBAT_ENERGYDAMAGE)
		end
	end
	return true
end
