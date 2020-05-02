local MusicEffect = {
	[3957] = CONST_ME_SOUND_YELLOW, --Cornucopia
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:getPosition():sendMagicEffect(MusicEffect[item.itemid])
	return true
end
