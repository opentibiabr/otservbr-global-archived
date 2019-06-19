local storage = 5845

local config = {
	first_room_pos = {x = 1018, y = 1112, z = 7}, -- posicao da primeira pos (linha 1 coluna 1)
	distX= 12, -- distancia em X entre cada sala (de uma mesma linha)
	distY= 12, -- distancia em Y entre cada sala (de uma mesma coluna)
	rX= 7, -- numero de colunas
	rY= 11 -- numero de linhas
}

local function isBusyable(position)
	local player = Tile(position):getTopCreature()
	if player then
		if player:isPlayer() then
			return false
		end
	end

	local tile = Tile(position)
	if not tile then
		return false
	end

	local ground = tile:getGround()
	if not ground or ground:hasProperty(CONST_PROP_BLOCKSOLID) then
		return false
	end

	local items = tile:getItems()
	for i = 1, tile:getItemCount() do
		local item = items[i]
		local itemType = item:getType()
		if itemType:getType() ~= ITEM_TYPE_MAGICFIELD and not itemType:isMovable() and item:hasProperty(CONST_PROP_BLOCKSOLID) then
			return false
		end
	end

	return true
end

local function calculatingRoom(uid, position, coluna, linha)
	local player = Player(uid)
	if coluna >= config.rX then
		coluna = 0
		linha = linha < (config.rY -1) and linha + 1 or false
	end

	if linha then
		local room_pos = {x = position.x + (coluna * config.distX), y = position.y + (linha * config.distY), z = position.z}
		if isBusyable(room_pos) then
			player:teleportTo(room_pos)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			calculatingRoom(uid, position, coluna + 1, linha)
		end
	else
		player:sendCancelMessage("Couldn't find any position for you right now.")
	end
end

function onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return false
	end

	if creature:getStorageValue(storage) - os.time() > 0 then
		creature:sendTextMessage(MESSAGE_INFO_DESCR, "You gotta wait a few seconds before you can enter trainning room again")
		creature:teleportTo(fromPosition, true)
		return true
	end

	calculatingRoom(creature.uid, config.first_room_pos, 0, 0)
	return true
end
