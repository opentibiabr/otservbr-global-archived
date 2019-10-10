function onDeath(player, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	if getPlayerFlagValue(player, PlayerFlag_NotGenerateLoot) then --or player:getVocation():getId() == VOCATION_NONE then
		return true
	end

	local amulet = player:getSlotItem(CONST_SLOT_NECKLACE)
	if amulet and amulet.itemid == ITEM_AMULETOFLOSS and not isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) then
		local isPlayer = false
		if killer then
			if killer:isPlayer() then
				isPlayer = true
			else
				local master = killer:getMaster()
				if master and master:isPlayer() then
					isPlayer = true
				end
			end
		end

		if not isPlayer or not player:hasBlessing(6) then
			player:removeItem(ITEM_AMULETOFLOSS, 1, -1, false)
		end
	else
		for i = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
			local item = player:getSlotItem(i)
			if item then
				if isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) or math.random(item:isContainer() and 100 or 1000) <= player:getLossPercent() then
					item:moveTo(corpse)
				end
			end
		end
	end

	if not player:getSlotItem(CONST_SLOT_BACKPACK) then
		local bag = player:addItem(ITEM_BAG, 1, false, CONST_SLOT_BACKPACK)
	end
	return true
end
