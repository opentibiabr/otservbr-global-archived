function onDeath(player, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	if player:hasFlag(PlayerFlag_NotGenerateLoot) then
		return true
	end

	local amulet = player:getSlotItem(CONST_SLOT_NECKLACE)
	if amulet and amulet.itemid == ITEM_AMULETOFLOSS and not table.contains({SKULL_RED, SKULL_BLACK}, player:getSkull()) then
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

		if not isPlayer or not player:hasBlessing(5) then
			player:removeItem(ITEM_AMULETOFLOSS, 1, -1, false)
		end
	else
		for i = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
			local item = player:getSlotItem(i)
			if item then
				if table.contains({SKULL_RED, SKULL_BLACK}, player:getSkull()) or math.random(item:isContainer() and 100 or 1000) <= player:getLossPercent() then
					if not item:moveTo(corpse) then
						item:remove()
					end
				end
			end
		end
	end

	if not player:getSlotItem(CONST_SLOT_BACKPACK) then
		player:addItem(ITEM_BAG, 1, false, CONST_SLOT_BACKPACK)
	end
	return true
end
