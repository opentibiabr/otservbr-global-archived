function onThink(creature)
local hp = (creature:getHealth()/creature:getMaxHealth())*100

    if creature:getName() == "Canopic Jar" then
		if hp < 75 and hp > 50 then
			creature:say("The magic of the jar is weakened!", TALKTYPE_ORANGE_1)
			elseif hp < 50 and hp > 25 then
			creature:say("The magic of the jar is severely weakened!", TALKTYPE_ORANGE_1)
			elseif hp < 25 then
			creature:say("The magic of the jar is extremely weak now!", TALKTYPE_ORANGE_1)
		end
	end
	return true
end
