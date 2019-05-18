function onCastSpell(creature, variant)
	local itemabolt = creature:addItem(29053, 100)
	itemabolt:decay()
end

