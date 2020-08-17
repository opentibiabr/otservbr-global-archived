local dyardPos = {
    [33331] = { -- uniqueId entrance
        destination = Position(33202 , 32012, 11)
    },
    [33332] = { -- uniqueId exit
		destination = Position(33264 , 32012, 7)
    }
}

local dyardAction = Action()

function dyardAction.onUse(player, item, target, position, fromPosition)
	local config = dyardPos[item.uid]
		player:teleportTo(config.destination)
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	return true
end
for i, x in pairs(dyardPos) do
	dyardAction:uid(i)
end
 dyardAction:register()