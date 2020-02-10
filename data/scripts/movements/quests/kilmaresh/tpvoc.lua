local config = {
	[57531] = {vocationId = 1, positionto = {x = 33829, y = 31635, z = 9}},
	[57532] = {vocationId = 2, positionto = {x = 33831, y = 31635, z = 9}},
	[57533] = {vocationId = 3, positionto = {x = 33833, y = 31635, z = 9}},
	[57534] = {vocationId = 4, positionto = {x = 33835, y = 31635, z = 9}}
}

-- falta adicionar as vocacoes e verificar a pos final de cada vocacao

local errotp = {x = 33822, y = 31645, z = 9}


local tpvoc = MoveEvent()

function tpvoc.onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()
	if not player then
		return true
	end

	local vocacoes = config[item.actionid]
	if not vocacoes then
		return true
	end

	if player:getVocation():getBase():getId() == vocacoes.vocationId then
		player:teleportTo(vocacoes.positionto)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(errotp)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end

	return true
end

tpvoc:aid(57531, 57532, 57533, 57534)
tpvoc:register()