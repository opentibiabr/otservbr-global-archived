local feyristStart = { x = 32910, y = 32338, z = 15} -- top left corner
local paymentItem = 2147 -- small ruby
local positionAfterEnchantment = Position(33586,32263, 7)

function onUse(creature, item, position, fromPosition, pos, target, toPosition)

	local player = creature:getPlayer()

	if not player then
		return
	end

	if player:getItemCount(paymentItem) >= 1 and pos.x == feyristStart.x or pos.x == (feyristStart.x + 1) and pos.y == feyristStart.y or pos.y == (feyristStart.y + 1) and pos.z == feyristStart.z then
	    player:removeItem(paymentItem, 1)
		player:teleportTo(positionAfterEnchantment)
		player:getPosition():sendMagicEffect(CONST_ME_SMALLPLANTS)
		return true
	end

end
