local backPositions = {
	{ actionId = 22343, toPos = Position(32972, 32227, 7), effect = CONST_ME_SMALLPLANTS },
	{ actionId = 22344, toPos = Position(32192, 31419, 2), effect = CONST_ME_ICEATTACK },
	{ actionId = 22345, toPos = Position(33059, 32716, 5), effect = CONST_ME_ENERGYHIT },
	{ actionId = 22346, toPos = Position(32911, 32336, 15), effect = CONST_ME_MAGIC_RED }
}

local feyristExit = Action()

function feyristExit.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	for _, feyrist in pairs(backPositions) do
		if item.actionid == feyrist.actionId then
			player:teleportTo(feyrist.toPos)
			player:getPosition():sendMagicEffect(feyrist.effect)
			return true
		end
	end
end

feyristExit:aid(24999, 22344, 22345, 22346)
feyristExit:register()
