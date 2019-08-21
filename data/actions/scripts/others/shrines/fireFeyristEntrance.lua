local paymentItem = 2147 -- small ruby
local positionAfterEnchantment = Position(33586,32263, 7)


function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if player:getItemCount(paymentItem) >= 1 and isInArray({32910, 32911}, toPosition.x) and isInArray({32338, 32339}, toPosition.y) and toPosition.z == 15 then
	    player:removeItem(paymentItem, 1)
		player:teleportTo(positionAfterEnchantment)
		player:getPosition():sendMagicEffect(CONST_ME_SMALLPLANTS)
			return true
	end

	if player:getItemCount(paymentItem) >= 1 and target.itemid == 2342 then
		target:transform(2343)
		target:decay()
		item:remove(1)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	end
	return false --
end