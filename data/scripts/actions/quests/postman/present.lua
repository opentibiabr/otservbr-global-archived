local present = Action()
function present.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:remove(1)
	toPosition:sendMagicEffect(CONST_ME_POFF)
	player:say("You open the present.", TALKTYPE_MONSTER_SAY)
	return true
end

present:id(2331)
present:register()