function onUse(player, item, fromPosition, target, toPosition, isHotkey)

-- Minotaur Cult
local posBossMinotaurs = Position(31957, 32468, 9)
local posAcessoMinotaurs = Position(31950, 32501, 8)

-- MoTA
local posAcessoInvestigation = Position(33273, 32172, 8)
local posAcessoCimaDenomitator = Position(33220, 32147, 9)
local posAcessoBaixoDenominator = Position(33220, 32149, 9)

-- Barkless
local posAcessoTrial = Position(32688, 31543, 9)
local posAcessoBoss = Position(32672, 31543, 9)

-- Life (Sandking)
local posAcessoSand = Position(33295, 32271, 12)


	-- Feyrist
	if item:getPosition() == Position(33452, 32241, 7) then
		if player:getStorageValue(Storage.CultsOfTibia.finalBoss.Mission) > 0 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
			else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")	
		end
	end

	-- Minotaur entrance
	if item:getPosition() == posAcessoMinotaurs then
		if player:getStorageValue(Storage.CultsOfTibia.Minotaurs.Acesso) == 1 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
			else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")	
		end
	end
	
	
	
	-- Minotaur boss entrance
	if item:getPosition() == posBossMinotaurs then
		if player:getStorageValue(Storage.CultsOfTibia.Minotaurs.Mission) >= 3 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
			else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")	
		end	
	end
	
	-- Under investigation area MotA
	if item:getPosition() == posAcessoInvestigation then
		if player:getStorageValue(Storage.CultsOfTibia.MotA.Mission) > 2 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
			else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")	
		end	
	end
	
	-- Porta de cima para o Denominator
	if item:getPosition() == posAcessoCimaDenomitator then
		if player:getStorageValue(Storage.CultsOfTibia.MotA.Mission) == 12 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
			else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")	
		end	
	end
	
	-- Porta de baixo para o Denominator
	if item:getPosition() == posAcessoBaixoDenominator then
		if player:getStorageValue(Storage.CultsOfTibia.MotA.Mission) == 14 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
			else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")	
		end	
	end
	
	-- Entrada para o Trial da Barkless
	if item:getPosition() == posAcessoTrial then
		if player:getStorageValue(Storage.CultsOfTibia.Barkless.Mission) > 0 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
			else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")	
		end	
	end
	
	-- Entrada para o Barkless Boss
	if item:getPosition() == posAcessoBoss then
		if player:getStorageValue(Storage.CultsOfTibia.Barkless.Mission) >= 5 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
			else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")	
		end	
	end
	
	-- Entrada para a caverna de areia
	if item:getPosition() == posAcessoSand then
		if player:getStorageValue(Storage.CultsOfTibia.Life.Mission) > 2 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
			else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")	
		end	
	end
	
	
	
	return true
end



