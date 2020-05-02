function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:getPosition():sendMagicEffect(CONST_ME_DRAWBLOOD)
	item:transform(math.random(7588, 7589))
	return true
end
