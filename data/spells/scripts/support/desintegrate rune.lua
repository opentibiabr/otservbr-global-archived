local dead_human = {
	3058, 3059, 3060, 3061, 3064, 3065, 3066
}

function onCastSpell(creature, variant, isHotkey)
	local position = Variant.getPosition(variant)
	local tile = Tile(position)
	local targetItem = tile and tile:getItems()

	if targetItem then
		local desintegrate = false
		for i, v in pairs(targetItem) do
			if (v:isItem() and
				isMoveable(v:getUniqueId())) then
				v:remove()
				desintegrate = true
			end
		end

		if desintegrate then
			position:sendMagicEffect(CONST_ME_POFF)
			return true
		end
	end

	creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
	creature:getPosition():sendMagicEffect(CONST_ME_POFF)
	return false
end
