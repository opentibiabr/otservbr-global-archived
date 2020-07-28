local dawnportVocationTrial = MoveEvent()
function dawnportVocationTrial.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local vocation = DawnportTable[item.actionid]
	if vocation then
		-- Center room position
		local centerPosition = Position(32065, 31891, 5)
		if centerPosition:getDistance(fromPosition) < centerPosition:getDistance(position) then
			-- Blocks the vocation trial after level 20
			local getVocation = player:getVocation()
			if getVocation and getVocation:getId() == vocation.first.id
			or getVocation:getId() == vocation.second.id and player:getLevel() < 20 then
				return true
			end
			-- On step in the tile
			dawnportTileStep(player, vocation)
			-- Set the correct vocation
			dawnportSetVocation(player, vocation)
			-- Remove player items (weapon and shield) on step in
			dawnportRemoveItems(player)
			-- Add player item
			dawnportAddItems(player, vocation)
			-- Change outfit
			dawnportSetOutfit(player, vocation)
			player:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
			return true
		end
	end
	return true
end

for index, value in pairs(DawnportTable) do
	dawnportVocationTrial:aid(index)
end

dawnportVocationTrial:register()