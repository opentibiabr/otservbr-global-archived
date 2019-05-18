local config = {
	firePositions = {
		Position(32100, 32084, 7),
		Position(32101, 32084, 7),
		Position(32102, 32084, 7),
		Position(32100, 32085, 7),
		Position(32100, 32086, 7),
		Position(32101, 32086, 7),
		Position(32102, 32086, 7),
		Position(32102, 32085, 7)
	},
	swordPosition = Position(32101, 32085, 7),

	-- [actionid] = value which the storage must have to proceed
	[5635] = -1,
	[5636] = 0
}

-- If players step on the 2 tiles in correct order Sword of Fury will disappear
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local setting = config[item.actionid]
	if not setting then
		return true
	end

	local storage = Game.getStorageValue(GlobalStorage.SwordOfFury)
	if storage ~= setting then
		return true
	end

	Game.setStorageValue(GlobalStorage.SwordOfFury, storage + 1)
	if storage == 0 then
		local tmpItem
		for i = 1, #config.firePositions do
			tmpItem = Tile(config.firePositions[i]):getItemById(1492)
			if tmpItem then
				tmpItem:transform(1494)
			end
		end

		tmpItem = Tile(config.swordPosition):getItemById(2383)
		if tmpItem then
			tmpItem:remove()
			config.swordPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		end
	end
	return true
end