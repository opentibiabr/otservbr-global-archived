local dawnportVocationTrial = MoveEvent()
function dawnportVocationTrial.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local vocation = DawnportTable[item.actionid]
	if vocation then
		-- Blocks the vocation trial after level 20
		local getVocation = player:getVocation()
		if getVocation and getVocation:getId() == vocation.first.id
		or getVocation:getId() == vocation.second.id and player:getLevel() < 20 then
			return true
		end

		-- Center room position
		local centerPosition = Position(32065, 31891, 5)
		if centerPosition:getDistance(fromPosition) < centerPosition:getDistance(position) then
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
		end
		player:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
	end
	return true
end

for key = 40001, 40004 do
	dawnportVocationTrial:aid(key)
end

dawnportVocationTrial:register()