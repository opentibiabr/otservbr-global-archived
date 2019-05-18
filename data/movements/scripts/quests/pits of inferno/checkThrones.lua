local cStorages = {
	[2090] = Storage.PitsOfInferno.ThroneInfernatil,
	[2091] = Storage.PitsOfInferno.ThroneTafariel,
	[2092] = Storage.PitsOfInferno.ThroneVerminor,
	[2093] = Storage.PitsOfInferno.ThroneApocalypse,
	[2094] = Storage.PitsOfInferno.ThroneBazir,
	[2095] = Storage.PitsOfInferno.ThroneAshfalor,
	[2096] = Storage.PitsOfInferno.ThronePumin
}

local cValues = {
	[2090] = 1,
	[2091] = 1,
	[2092] = 1,
	[2093] = 1,
	[2094] = 1,
	[2095] = 1,
	[2096] = 1
}

function onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return true
	end

	if creature:getStorageValue(cStorages[item.uid]) ~= cValues[item.uid] then
		creature:teleportTo(fromPosition)
		creature:say('You\'ve not absorbed energy from this throne.', TALKTYPE_MONSTER_SAY)
	end
	return true
end
