local config = {
	[32014] = { -- surprise jar
		2158, 25377, 25172, 2153, 30888
	}
}

function onUse(player, item, isHotkey)

	local jar = config[item.itemid]
	if not jar then
		return false
	end

	local gift = jar[math.random(1, #jar)]
	item:transform(gift)
	item:getPosition():sendMagicEffect(CONST_ME_ENERGYAREA)
	return true
end
