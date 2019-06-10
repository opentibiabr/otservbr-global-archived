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
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Done, 0)
end
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player or Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Active) >= 1 then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
	if item.itemid == 9562 then
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First, 1) -- é vermelho
		local leverFirst = Tile(Position(33651, 32661, 13)):getItemById(10029) or Tile(Position(33651, 32661, 13)):getItemById(10030) -- lever red
	if math.random(1,2) == 1 then
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second, 2) -- é verde
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You hear a whisper: 'You will not be guided but your path shines in the colours red, green and blue. Heed this hierarchy.")
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third, 3) -- é azul
		local leverSecond = Tile(Position(33613, 32691, 13)):getItemById(10029) or Tile(Position(33613, 32691, 13)):getItemById(10030) -- lever green
		local leverThird = Tile(Position(33671, 32638, 13)):getItemById(10029) or Tile(Position(33671, 32638, 13)):getItemById(10030) -- lever blue
		leverFirst:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First))
		leverSecond:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second))
		leverThird:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third))
		else
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second, 3) -- é azul
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third, 2) -- é verde
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You hear a whisper: 'You will not be guided but your path shines in the colours red, blue and green. Heed this hierarchy.")
		local leverSecond = Tile(Position(33671, 32638, 13)):getItemById(10029) or Tile(Position(33671, 32638, 13)):getItemById(10030) -- lever blue
		local leverThird = Tile(Position(33613, 32691, 13)):getItemById(10029) or Tile(Position(33613, 32691, 13)):getItemById(10030) -- lever green
		leverFirst:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First))
		leverSecond:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second))
		leverThird:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third))
			return true
		end
	elseif item.itemid == 9563 then
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First, 3) -- é azul
		local leverFirst = Tile(Position(33671, 32638, 13)):getItemById(10029) or Tile(Position(33671, 32638, 13)):getItemById(10030) -- lever blue
	if math.random(1,2) == 1 then
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second, 2) -- é verde
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You hear a whisper: 'You will not be guided but your path shines in the colours blue, green and red. Heed this hierarchy.")
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third, 1) -- é vermelho
		local leverSecond = Tile(Position(33613, 32691, 13)):getItemById(10029) or Tile(Position(33613, 32691, 13)):getItemById(10030) -- lever green
		local leverThird = Tile(Position(33651, 32661, 13)):getItemById(10029) or Tile(Position(33651, 32661, 13)):getItemById(10030) -- lever red
		leverFirst:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First))
		leverSecond:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second))
		leverThird:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third))
		else
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second, 1) -- é vermelho
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You hear a whisper: 'You will not be guided but your path shines in the colours blue, red and green. Heed this hierarchy.")
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third, 2) -- é verde
		local leverSecond = Tile(Position(33651, 32661, 13)):getItemById(10029) or Tile(Position(33651, 32661, 13)):getItemById(10030) -- lever red
		local leverThird = Tile(Position(33613, 32691, 13)):getItemById(10029) or Tile(Position(33613, 32691, 13)):getItemById(10030) -- lever green
		leverFirst:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First))
		leverSecond:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second))
		leverThird:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third))
			return true
		end
	elseif item.itemid == 9565 then
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First, 2) -- é verde
		local leverFirst = Tile(Position(33613, 32691, 13)):getItemById(10029) or Tile(Position(33613, 32691, 13)):getItemById(10030) -- lever green
		if math.random(1,2) == 1 then
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second, 3) -- é azul
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You hear a whisper: 'You will not be guided but your path shines in the colours green, blue and red. Heed this hierarchy.")
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third, 1) -- é vermelho
		local leverSecond = Tile(Position(33671, 32638, 13)):getItemById(10029) or Tile(Position(33671, 32638, 13)):getItemById(10030) -- lever blue
		local leverThird = Tile(Position(33651, 32661, 13)):getItemById(10029) or Tile(Position(33651, 32661, 13)):getItemById(10030) -- lever red
		leverFirst:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First))
		leverSecond:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second))
		leverThird:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third))
		else
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second, 1) -- é vermelho
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You hear a whisper: 'You will not be guided but your path shines in the colours green, red and blue. Heed this hierarchy.")
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third, 3) -- é azul
		local leverSecond = Tile(Position(33651, 32661, 13)):getItemById(10029) or Tile(Position(33651, 32661, 13)):getItemById(10030) -- lever red
		local leverThird = Tile(Position(33671, 32638, 13)):getItemById(10029) or Tile(Position(33671, 32638, 13)):getItemById(10030) -- lever blue
		leverFirst:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First))
		leverSecond:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second))
		leverThird:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third))
			return true
		end
	end
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Active, 1)
	item:transform(9564)
	addEvent(activeBasin, 1 * 1000, position)
	addEvent(revertBasin, 60 * 60 * 1000, position)
	addEvent(revertStorages, 60 * 60 * 1000)
	addEvent(revertItem, 60 * 60 * 1000,  position, 9564, item.itemid)
	return true
end
