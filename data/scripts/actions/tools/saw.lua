local saw = Action()

function saw.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 5901 then
		return false
	end

	target:transform(9114)
	toPosition:sendMagicEffect(CONST_ME_POFF)
	return true
end

saw:id(3461)
saw:register()