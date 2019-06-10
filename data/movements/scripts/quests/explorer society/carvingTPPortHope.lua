local destination = {
	[14171] = {position = Position(32498, 31622, 6)},
	[14172] = {position = Position(32665, 32735, 6)}
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

	if player:getStorageValue(Storage.ExplorerSociety.TheAstralPortals) >= 56 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) >= 56 and player:removeItem(5022, 1) then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(carvingTP.position)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:teleportTo(fromPosition)
	end
	return true
end
