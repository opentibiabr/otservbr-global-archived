
function onStepIn(creature, item, position, fromPosition)


	local primeiraChecagem = Position(33135, 31859, 10)
	local segundaChecagem = Position(33128, 31885, 11)
	local terceiraChecagem = Position(33175, 31923, 12)


	local player = creature:getPlayer()

	if not player then
		return true
	end

if position == primeiraChecagem or position == Position(primeiraChecagem.x + 1, primeiraChecagem.y, primeiraChecagem.z) then
	if player:getStorageValue(Storage.CultsOfTibia.Orcs.lookType) < 1 then
		if creature:getOutfit().lookType == 5 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Due to the strength of an orc you are able to pass this rift.")
			player:setStorageValue(Storage.CultsOfTibia.Orcs.lookType, 1)
			else
			player:teleportTo(fromPosition)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need the strength of an orc to pass this rift.")
		end
	end
end

if position == segundaChecagem or position == Position(segundaChecagem.x + 1, segundaChecagem.y, segundaChecagem.z) then
		if player:getStorageValue(Storage.CultsOfTibia.Orcs.lookType) < 2 then
		if creature:getOutfit().lookType == 2 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "With the help off the might of an orc warlod you are able to pass this rift.")
			player:setStorageValue(Storage.CultsOfTibia.Orcs.lookType, 2)
			else
			player:teleportTo(fromPosition)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need the might of an orc warlod to pass this rift.")
		end
	end
end

if position == terceiraChecagem or position == Position(terceiraChecagem.x + 1, terceiraChecagem.y, terceiraChecagem.z) or position == Position(terceiraChecagem.x + 2, terceiraChecagem.y, terceiraChecagem.z) then
	if player:getStorageValue(Storage.CultsOfTibia.Orcs.lookType) < 3 then
		if creature:getOutfit().lookType == 6 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "With the help of the wisdom of an orc shaman you are able to pass this rift.")
			player:setStorageValue(Storage.CultsOfTibia.Orcs.lookType, 3)
			else
			player:teleportTo(fromPosition)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need the wisdom of an orc shaman to pass this rift.")
		end
	end
end

	return true
end
