-- Only works with 11.10 Tibia Version
-- Incomplete System.
-- Image: http://prntscr.com/fbpayn

InspectionSystem = {
	Developer = "Charles (Cjaker)",
	Version = "1.0",
	LastUpdate = "24/05/2017 - 05:37 (AM)"
}

local ClientPackets = {
	InspectItem = 0xCD,
	InspectPlayer = 0xCE
}

local ServerPackets = {
	InspectList = 0x76,
	InspectState = 0x77
}

function onRecvbyte(player, msg, byte)
	if (byte == ClientPackets.InspectItem) then
		parseInspectItem(player, msg)
	elseif (byte == ClientPackets.InspectPlayer) then
		parseInspectPlayer(player, msg)
	end
end

function parseInspectItem(player, msg)
	local unknownByte = msg:getByte()
	local posX = msg:getU16()
	if (posX == 0xFFFF) then
		-- Container
		local contId = msg:getU16()
		local index = msg:getByte()
		local myItem = player:getSlotItem(contId)
		if (myItem) then
			player:say("Item: " ..myItem:getName(), TALKTYPE_SAY)
		end
	else
		local posY = msg:getU16()
		local posZ = msg:getByte()

	end
end

function parseInspectPlayer(player, msg)
	-- Inspection States
	-- 1 = Grant player permission to inspect you.
	-- 2 = Ask to inspect player.
	-- 3 = Allow player to inspect you.
	-- 4 = Inspect player.
	-- 5 = Revoke player's permission to inspect you.
	-- 6 = "Allow All to Inspect Me" setting is enabled.
	-- 7 = "Allow All to Inspect Me" setting is disabled.
	local inspectionState = msg:getByte()
	if (inspectionState == 4) then
		local uid = msg:getU32()
		sendInspectionList(uid)
	end
end

local function getTotalItems(creature)
	local retItems = {}
	for i = 1, 10 do
		local itemSlot = creature:getSlotItem(i)
		if (itemSlot) then
			retItems[#retItems+1] = {Item = itemSlot, Slot = i}
		end
	end

	return retItems
end

function getItemDescription(itemType)
	local itemInfo = {
  		{Title = "Armor", Value = itemType:getArmor()},
  		{Title = "Attack", Value = itemType:getAttack()},
  		{Title = "Defense", Value = itemType:getDefense()},
  		{Title = "Weight", Value = itemType:getWeight()}
  	}
  	local retTable, count = {}, 0
  	for i, v in pairs(itemInfo) do
  		if (v.Value > 0) then
  			if (v.Title == "Weight") then
  				v.Value = string.format("%.2f", v.Value/100)
  			end
  			retTable[#retTable+1] = {Title = v.Title, Description = v.Value}
  			count = count + 1
  		end
  	end

  	return retTable, count
end

function sendInspectionList(uid)
	local msg = NetworkMessage()
	local object = nil
	msg:addByte(ServerPackets.InspectList)
	if (Player(uid)) then
		msg:addByte(0x01)
		object = Player(uid)
	else
		msg:addByte(0x00)
		object = Item(uid)
	end

 	local totalItems = getTotalItems(object)
	msg:addByte(#totalItems)
	for i,v in pairs(totalItems) do
	    msg:addString(v.Item:getName())

	    if (Player(uid)) then
	    	msg:addByte(v.Slot)
	    end

	    msg:addItemId(v.Item:getId())
	    msg:addByte(0xFF)
	    if (v.Item:getType():isStackable()) then
	    	msg:addByte(v.Item:getCount())
	    end

		msg:addByte(v.Item:getType():getImbuingSlots() or 0x00)
		for j = 1, v.Item:getType():getImbuingSlots() do
		    msg:addU16(0)
		end

	  	local itemType = v.Item:getType()
	  	local detailsInfo, detailsCount = getItemDescription(itemType)
		msg:addByte(detailsCount)
		for i, v in pairs(detailsInfo) do
			msg:addString(v.Title)
			msg:addString(v.Description)
		end
	end

	if (object:isPlayer()) then
	    msg:addString(object:getName())

	 	local outfit = object:getOutfit()
	    msg:addU16(outfit.lookType or 21)
		msg:addByte(outfit.lookHead or 0x00) -- outfit
		msg:addByte(outfit.lookBody or 0x00) -- outfit
		msg:addByte(outfit.lookLegs or 0x00) -- outfit
		msg:addByte(outfit.lookFeet or 0x00) -- outfit
		msg:addByte(outfit.lookAddons or 0x00) -- outfit

	 	local playerInfo = {
	 		{Title = "Level", Value = object:getLevel()},
	 		{Title = "Vocation", Value = object:getVocation():getName()},
	 		{Title = "Loyalty Rank", Value = "Sentinel of Tibia"},
	 		{Title = "Outfit", Value = object:getOutfit().lookType}
	 	}

	    msg:addByte(#playerInfo)
	    for z, p in pairs(playerInfo) do
	    	msg:addString(p.Title)
	    	msg:addString(p.Value)
	    end
	end

	msg:sendToPlayer(object)
end
