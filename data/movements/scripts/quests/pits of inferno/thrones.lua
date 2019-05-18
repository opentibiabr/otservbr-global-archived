local config = {
	[2080] = {storage = Storage.PitsOfInferno.ThroneInfernatil, text = 'You have touched Infernatil\'s throne and absorbed some of his spirit.', effect = CONST_ME_FIREAREA, toPosition = Position(32909, 32211, 15)},
	[2081] = {storage = Storage.PitsOfInferno.ThroneTafariel, text = 'You have touched Tafariel\'s throne and absorbed some of his spirit.', effect = CONST_ME_MORTAREA, toPosition = Position(32761, 32243, 15)},
	[2082] = {storage = Storage.PitsOfInferno.ThroneVerminor, text = 'You have touched Verminor\'s throne and absorbed some of his spirit.', effect = CONST_ME_POISONAREA, toPosition = Position(32840, 32327, 15)},
	[2083] = {storage = Storage.PitsOfInferno.ThroneApocalypse, text = 'You have touched Apocalypse\'s throne and absorbed some of his spirit.', effect = CONST_ME_EXPLOSIONAREA, toPosition = Position(32875, 32267, 15)},
	[2084] = {storage = Storage.PitsOfInferno.ThroneBazir, text = 'You have touched Bazir\'s throne and absorbed some of his spirit.', effect = CONST_ME_MAGIC_GREEN, toPosition = Position(32745, 32385, 15)},
	[2085] = {storage = Storage.PitsOfInferno.ThroneAshfalor, text = 'You have touched Ashfalor\'s throne and absorbed some of his spirit.', effect = CONST_ME_FIREAREA, toPosition = Position(32839, 32310, 15)},
	[2086] = {storage = Storage.PitsOfInferno.ThronePumin, text = 'You have touched Pumin\'s throne and absorbed some of his spirit.', effect = CONST_ME_MORTAREA, toPosition = Position(32785, 32279, 15)}
}

function onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return true
	end

	local throne = config[item.uid]
	if not throne then
		return true
	end

	local cStorage = throne.storage
	if creature:getStorageValue(cStorage) ~= 1 then
		creature:setStorageValue(cStorage, 1)
		creature:getPosition():sendMagicEffect(throne.effect)
		creature:say(throne.text, TALKTYPE_MONSTER_SAY)
	else
		creature:teleportTo(throne.toPosition)
		creature:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
		creature:say('Begone!', TALKTYPE_MONSTER_SAY)
	end
	return true
end
