local noxious_claw = Action()

function noxious_claw.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local player, useItem, depleteChance = player, item, 5
	if player:getCondition(CONDITION_POISON) then
		player:removeCondition(CONDITION_POISON)
	end
	useItem:transform(9394)
	useItem:decay()
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	return true
end

noxious_claw:id(9392)
noxious_claw:register()
