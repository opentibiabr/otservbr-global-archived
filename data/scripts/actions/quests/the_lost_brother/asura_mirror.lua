local asura = Action()
function asura.onUse(player, item, fromPosition, itemEx, toPosition)
	player:teleportTo({x = 32966, y = 31460, z = 1}) -- Where to tp to 33672, 31884, 5
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

asura:aid(12441)
asura:register()