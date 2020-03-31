BlessingsDialog = {
	Developer = "Charles (Cjaker)",
	Version = "1.1",
	LastUpdate = "24/03/2020",
	Missing = {
		"Insert & Select query in blessings_history",
		"Gamestore buy blessing",
	},
}


--[=====[
--
-- Table structure `blessings_history`
--

CREATE TABLE IF NOT EXISTS `blessings_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `blessing` tinyint(4) NOT NULL,
  `loss` tinyint(1) NOT NULL,
  `timestamp` int(11) NOT NULL,
  CONSTRAINT `blessings_history_pk` PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--]=====]

local Client = {
	OpenWindow = 0xCF
}

local Server = {
	BlessingsInfo = 0x9B
}

function onRecvbyte(player, msg, byte)
	if (byte == Client.OpenWindow) then
		if (player:getClient().os ~= CLIENTOS_NEW_WINDOWS and player:getClient().os ~= CLIENTOS_FLASH) then
			player:sendCancelMessage("Only work with Flash Client & 11.0")
			return false
		end

		sendBlessingsDialog(player)
	end
end

function sendBlessingsDialog(player)
	local msg = NetworkMessage()
	msg:addByte(Server.BlessingsInfo)
	msg:addByte(8) -- total blessings
	local c, bless, totalBless = 1, 2, 1
	while (c < 9) do
		msg:addU16(bless) -- bless type
		--msg:addByte(0)
		if (player:hasBlessing(c)) then
			msg:addByte(player:getBlessingCount(c)) -- amount of unique bless
			if c > 1 then
				totalBless = totalBless + 1
			end
		else
			msg:addByte(0)
		end
		c = c + 1
		bless = bless * 2
	end
	local backpackLossChance = {100, 70, 45, 25, 10, 0, 0, 0}
	local skillLoss = {0, 8, 16, 24, 32, 40, 48, 56}

	
	local playerAmulet = player:getSlotItem(CONST_SLOT_NECKLACE)
	local haveSkull = player:getSkull() >= 4
	hasAol = (playerAmulet and playerAmulet:getId() == ITEM_AMULETOFLOSS)
	
	equipLoss = backpackLossChance[totalBless]
	if haveSkull then
		equipLoss = 100
	elseif hasAol then
		equipLoss = 0
	end

	msg:addByte(2) -- BYTE PREMIUM (only work with premium days)
	msg:addByte(player:isPremium() and 30 or 0) -- XP Loss Lower POR SER PREMIUM
	msg:addByte(skillLoss[totalBless]) -- XP/Skill loss min pvp death
	msg:addByte(skillLoss[totalBless]) -- XP/Skill loss max pvp death
	msg:addByte(skillLoss[totalBless]) -- XP/Skill pve death
	msg:addByte(equipLoss) -- Equip container lose pvp death
	msg:addByte(equipLoss) -- Equip container pve death

	msg:addByte(haveSkull and 1 or 0) -- is red/black skull
	msg:addByte(hasAol and 1 or 0)


	-- History
	local historyAmount = 1
	msg:addByte(historyAmount) -- History log count
	for i = 1, historyAmount do
		msg:addU32(os.time()) -- timestamp
		msg:addByte(0) -- Color message (1 - Red | 0 = White loss)
		msg:addString("Blessing Purchased") -- History message
	end

	msg:sendToPlayer(player)
end
