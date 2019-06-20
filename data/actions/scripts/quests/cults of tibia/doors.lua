function onUse(player, item, fromPosition, target, toPosition, isHotkey)

-- Minotaur Cult
local posBossMinotaurs = Position(31957, 32468, 9)
local posAcessMinotaurs = Position(31950, 32501, 8)

-- MoTA
local posAcessInvestigation = Position(33273, 32172, 8)
local posAcessUpDenomitator = Position(33220, 32147, 9)
local posAcessDownDenominator = Position(33220, 32149, 9)

-- Barkless
local posAcessTrial = Position(32688, 31543, 9)
local posAcessBoss = Position(32672, 31543, 9)

-- Life (Sandking)
local posAcessSand = Position(33295, 32271, 12)

-- Midguided (The Souldespoiler)
local posAcessSoul = Position(32508, 32370, 9)

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
	if item:getPosition() == posAcessMinotaurs then
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
	if item:getPosition() == posAcessInvestigation then
		if player:getStorageValue(Storage.CultsOfTibia.MotA.Mission) > 2 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
		end
	end

	-- Up door for the Denominator
	if item:getPosition() == posAcessUpDenomitator then
		if player:getStorageValue(Storage.CultsOfTibia.MotA.Mission) == 12 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
		end
	end

	-- Down door for the Denominator
	if item:getPosition() == posAcessDownDenominator then
		if player:getStorageValue(Storage.CultsOfTibia.MotA.Mission) == 14 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
		end
	end

	-- Entrance for the Trial of Barkless
	if item:getPosition() == posAcessTrial then
		if player:getStorageValue(Storage.CultsOfTibia.Barkless.Mission) > 0 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
		end
	end

	-- Entrance for the Barkless Boss
	if item:getPosition() == posAcessBoss then
		if player:getStorageValue(Storage.CultsOfTibia.Barkless.Mission) >= 5 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
		end
	end

	-- Entrance for the cave of sand
	if item:getPosition() == posAcessSand then
		if player:getStorageValue(Storage.CultsOfTibia.Life.Mission) >= 2 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
		end
	end
	
	-- The Souldespoiler entrance door
	if item:getPosition() == posAcessSoul then
		if player:getStorageValue(Storage.CultsOfTibia.Misguided.Mission) >= 2 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
		end
	end

	return true
end
