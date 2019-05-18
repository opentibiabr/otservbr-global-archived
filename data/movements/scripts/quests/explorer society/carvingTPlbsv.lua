local destination = {
	[14173] = {position = Position(32320, 31137, 6)},
	[14174] = {position = Position(32359, 32807, 6)}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local carvingTP = destination[item.actionid]
	if not carvingTP then
		return
	end

	if player:getStorageValue(Storage.ExplorerSociety.TheIceMusic) >= 62 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) >= 62 and player:removeItem(5022, 1) then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(carvingTP.position)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:teleportTo(fromPosition)
	end
	return true
end
