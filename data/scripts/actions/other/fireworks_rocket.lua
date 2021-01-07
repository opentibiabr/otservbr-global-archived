local fireworksRocket = Action()

function fireworksRocket.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if fromPosition.x ~= CONTAINER_POSITION then
		fromPosition:sendMagicEffect(math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
	else
		local position = player:getPosition()
		position:sendMagicEffect(CONST_ME_HITBYFIRE)
		position:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
		player:say("Ouch! Rather place it on the ground next time.", TALKTYPE_MONSTER_SAY)
		player:addHealth(-10, COMBAT_PHYSICALDAMAGE)
	end
	player:addAchievementProgress('Fireworks in the Sky', 250)
	item:remove()
	return true
end

fireworksRocket:id(6576)
fireworksRocket:register()
