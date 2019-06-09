local function revertItem(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end
local function activeBasin(position)
	local um = Tile(Position(position.x - 1, position.y - 2, position.z)):getItemById(12450)
	local dois = Tile(Position(position.x, position.y - 2, position.z)):getItemById(12451)
	local tres = Tile(Position(position.x - 1, position.y - 1, position.z)):getItemById(12452)
	local quatro = Tile(Position(position.x, position.y - 1, position.z)):getItemById(12453)
	um:transform(12458)
	dois:transform(12459)
	tres:transform(12460)
	quatro:transform(12461)
end

local function revertBasin(position)
	local um = Tile(Position(position.x - 1, position.y - 2, position.z)):getItemById(12458)
	local dois = Tile(Position(position.x, position.y - 2, position.z)):getItemById(12459)
	local tres = Tile(Position(position.x - 1, position.y - 1, position.z)):getItemById(12460)
	local quatro = Tile(Position(position.x, position.y - 1, position.z)):getItemById(12461)
	um:transform(12450)
	dois:transform(12451)
	tres:transform(12452)
	quatro:transform(12453)
end

function revertStorages()
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Active, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Four, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Done, 0)
end

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player or Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Active) >= 1 then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
	if item.itemid == 9565 then
		local leverFirst = Tile(Position(33613, 32691, 13)):getItemById(10029) or Tile(Position(33613, 32691, 13)):getItemById(10030) -- lever green
		local leverSecond = Tile(Position(33671, 32638, 13)):getItemById(10029) or Tile(Position(33671, 32638, 13)):getItemById(10030) -- lever blue
		local leverThird = Tile(Position(33651, 32661, 13)):getItemById(10029) or Tile(Position(33651, 32661, 13)):getItemById(10030) -- lever red
		local leverFour = Tile(Position(33673, 32688, 13)):getItemById(10029) or Tile(Position(33673, 32688, 13)):getItemById(10030) -- lever green
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First, 2) -- é verde
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second, 3) -- é azul
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third, 1) -- é vermelho
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Four, 6) -- é ice
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You hear a whisper: 'You will not be guided but your path shines in the colours green, blue and red. Heed this hierarchy.")
		leverFirst:setActionId(53821)
		leverSecond:setActionId(53822)
		leverThird:setActionId(53823)
		leverFour:setActionId(53824)
	end
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Active, 1)
	item:transform(9564)
	addEvent(activeBasin, 1 * 1000, position)
	addEvent(revertBasin, 60 * 60 * 1000, position)
	addEvent(revertStorages, 60 * 60 * 1000)
	addEvent(revertItem, 60 * 60 * 1000,  position, 9564, item.itemid)
	return true
end
