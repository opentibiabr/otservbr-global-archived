local config = {
	[12382] = {storageKey = Storage.WrathoftheEmperor.Questline, toPosition = {Position(33078, 31219, 8), Position(33216, 31069, 9)}},
	[12383] = {storageKey = Storage.WrathoftheEmperor.Questline, toPosition = {Position(33216, 31069, 9), Position(33078, 31219, 8)}}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetTile = config[item.actionid]
	if not targetTile then
		return true
	end

	--local hasStorageValue = player:getStorageValue(targetTile.storageKey) >= 23
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	--player:teleportTo(targetTile.toPosition[hasStorageValue and 1 or 2])
	player:teleportTo(targetTile.toPosition[1])
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	--if not hasStorageValue then
	--	player:say('This portal is not activated', TALKTYPE_MONSTER_SAY)
	--end
	return true
end
