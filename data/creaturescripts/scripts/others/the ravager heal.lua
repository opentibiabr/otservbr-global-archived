function onThink(creature)
local health, hp, cpos = math.random(7500, 9000), (creature:getHealth()/creature:getMaxHealth())*100, creature:getPosition()

    if creature:getName() == "The Ravager" and (hp < 99.99) then
		local t = Tile(cpos):getItemById(3172)
		if not t then
			return
		end
		creature:addHealth(health)
		creature:say("The Ravager is healed by the strange floor rune!", TALKTYPE_ORANGE_1)
	end
	return true
end
