BlessingsDialog = {
	Developer = "Charles (Cjaker)",
	Revision = "Rick (FakeShinoda)",
	Version = "1.5",
	LastUpdate = "16/11/2019",
	Missing = {
		"Insert & Select query in blessings_history",
		"Gamestore buy blessing",
		"Correct percents for loot drop"
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
	local c, bless = 1, 2
	while (c < 9) do
		msg:addU16(bless) -- bless type
		if (player:hasBlessing(c)) then
			msg:addByte(player:getBlessingCount(c)) -- amount of unique bless
		else
			msg:addByte(0)
		end
		c = c + 1
		bless = bless * 2
	end
	
	-- Total protection count
	local count = 0
	local protection = 0
	for i = 2, 8 do
		if player:hasBlessing(i) then
			count = count + 1 * 8
			protection = count
			if player:getStorageValue(STORAGEVALUE_PROMOTION) == 1 then
				protection = count + 30	
			end
		end
	end

	-- PvP Death count
	local pvpcount = 0
	local pvpprotection = 80
	for i = 2, 6 do
		if player:hasBlessing(i) then
			pvpcount = pvpprotection + 2
			pvpprotection = pvpcount
		end
	end
	
	-- Check if player are promoted
	if player:getStorageValue(STORAGEVALUE_PROMOTION) == 1 then
		pvpprotection = pvpprotection + 6	
	end
	
	-- Account Status
	if player:getStorageValue(STORAGEVALUE_PROMOTION) == 1 then
		msg:addByte(1) -- Are promoted
	elseif not player:isPremium() then
		msg:addByte(3) -- Free Account
	else 
		msg:addByte(0) -- Promoted
	end	

	msg:addByte(30) -- XP Loss Lower
	msg:addByte(protection) -- XP/Skill loss min pvp death
	msg:addByte(pvpprotection) -- XP/Skill loss max pvp death
	msg:addByte(protection) -- XP/Skill pve death
	msg:addByte(100) -- Equip container lose pvp death
	msg:addByte(100) -- Equip container pve death

	local haveSkull = player:getSkull() >= 4
	if (haveSkull) then
		msg:addByte(1) -- is red/black skull
		local playerAmulet = player:getSlotItem(CONST_SLOT_AMULET)
		msg:addByte((playerAmulet and playerAmulet:getId() == 2173) and 1 or 0)
	else
		msg:addByte(0)
		msg:addByte(0)
	end

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
