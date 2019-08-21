local days = {
	["Monday"] = Position(31254, 32604, 9), --Minos
	["Tuesday"] = Position(33459, 31715, 9), --  Catacombs
	["Wednesday"]  = Position(31061, 32605, 9), --  Golem
	["Thursday"] = Position(33459, 31715, 9), -- Catacombs
	["Friday"]  = Position(33459, 31715, 9), -- Catacombs
	["Saturday"] = Position(31254, 32604, 9), -- Minos
	["Sunday"] = Position(33459, 31715, 9), -- Catacombs
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local tmpTeleport = days[os.date("%A")]
	if tmpTeleport then
		player:teleportTo(tmpTeleport)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		player:say("Slrrp!", TALKTYPE_MONSTER_SAY)
	end

	return true
end