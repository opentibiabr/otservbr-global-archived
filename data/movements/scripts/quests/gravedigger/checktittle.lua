local cStorages = {
	[4680] = Storage.GravediggerOfDrefia.Mission67,
	[4681] = Storage.GravediggerOfDrefia.Mission67
}

local cValues = {
	[4680] = 1,
	[4681] = 1
}

function onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return true
	end

	if creature:getStorageValue(cStorages[item.uid]) ~= cValues[item.uid] then
		creature:teleportTo(fromPosition)
		creature:say('You are not allowed to pass.', TALKTYPE_MONSTER_SAY)
	end
	return true
end
