local dawnportVocationTrial = MoveEvent()

function dawnportVocationTrial.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local trial = Dawnport.trial[item.actionid]
	if trial then
		-- Center room position
		local centerPosition = Position(32065, 31891, 5)
		if centerPosition:getDistance(fromPosition) < centerPosition:getDistance(position) then
			-- Blocks the vocation trial if same vocation or after level 20
			if player:getVocation():getId() == trial.vocation.id or player:getLevel() >= Dawnport.limit.level then
				return true
			end
			-- On step in the tile
			dawnportTileStep(player, trial)
			-- Set the correct vocation
			dawnportSetVocation(player, trial.vocation.id)
			-- Remove player items (weapon and shield) on step in
			dawnportRemoveItems(player)
			-- Add player item
			dawnportAddItems(player, trial)
			-- Change outfit
			dawnportSetOutfit(player, trial.vocation.outfit)
			player:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
			return true
		end
	end
	return true
end

for index, value in pairs(Dawnport.trial) do
	dawnportVocationTrial:aid(index)
end

dawnportVocationTrial:register()