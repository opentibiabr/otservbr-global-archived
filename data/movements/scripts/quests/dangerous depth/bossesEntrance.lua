function onStepIn(creature, item, position, fromPosition, toPosition)
	if not creature or not creature:isPlayer() then
		return true
	end

	local WarzoneIV = Position(33460, 32267, 15)
	local WarzoneIV_b = Position(33650, 32310, 15)

	local WarzoneV = Position(33324, 32109, 15)
	local WarzoneV_b = Position(33681, 32338, 15)

	local WarzoneVI = Position(33275, 32316, 15)
	local WarzoneVI_b = Position(33717, 32302, 15)

	if item:getPosition() == WarzoneIV then -- Warzone IV
		if creature:getStorageValue(Storage.DangerousDepths.Bosses.theBaronFromBelow) > os.time() then
			creature:teleportTo(fromPosition)
			creature:say('You have to wait to challenge this enemy again!', TALKTYPE_MONSTER_SAY)
		else
			creature:teleportTo(WarzoneIV_b)
		end
	end

	if item:getPosition() == WarzoneV then -- Warzone V
		if creature:getStorageValue(Storage.DangerousDepths.Bosses.theCountOfTheCore) > os.time() then
			creature:teleportTo(fromPosition)
			creature:say('You have to wait to challenge this enemy again!', TALKTYPE_MONSTER_SAY)
		else
			creature:teleportTo(WarzoneV_b)
		end
	end

	if item:getPosition() == WarzoneVI then -- Warzone VI
		if creature:getStorageValue(Storage.DangerousDepths.Bosses.theDukeOfTheDepths) > os.time() then
			creature:teleportTo(fromPosition)
			creature:say('You have to wait to challenge this enemy again!', TALKTYPE_MONSTER_SAY)
		else
			creature:teleportTo(WarzoneVI_b)
		end
	end

	creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
