QuickLootSystem = {
	Developer = "Ticardo (Rick), lBaah, dudantas, gpedro, DudZ",
	Version = "1.0",
	lastUpdate = "29/03/2020 - 12:00"
}

--[[
	missing features:
		- autowalk if corpse is far (+1sqm)
		- better loot messages
		- update container to refresh quickLootFlags after save quickloot backpacks
]]--

local ClientPackets = {
	ManageItemList = 0x91,
	SelectBackpack = 0x90,
	LootCorpse = 0x8F
}

local ServerPackets = {
	SendBackpack = 0xC0
}

 -- TODO: check a better storage no
local StorageQuickLoot = {
	ItemsToLoot = "831831",
	LootMode = 832832,
	MainContainerFallback = 833833,
}

local QUICKLOOT_CATEGORY_ATTRIBUTE = "quickLootCategory"

local QUICKLOOT_MODE_BLACKLIST = 0
local QUICKLOOT_MODE_WHITELIST = 1

local QuickLootCategory = {
	UnassignedLoot = 31,
	Gold =  30,
	Armors = 1,
	Amulets = 2,
	Boots = 3,
	Containers = 4,
	CreatureProducts = 24,
	Decoration = 5,
	Food = 6,
	Helmets = 7,
	Legs = 8,
	Others = 9,
	Potions = 10,
	Rings = 11,
	Runes = 12,
	Shields = 13,
	Tools = 14,
	Valuables = 15,
	WeaponsAmmo = 16,
	WeaponsAxe = 17,
	WeaponsClubs = 18,
	WeaponsDistance = 19 ,
	WeaponsSwords = 20,
	WeaponsWands = 21,
	StashRetrieve = 27,
}

local QuickLootReturn = {
	ITEM_LOOTED = { looted = true, id = 1, message = ""},
	ITEM_WITH_NO_CATEGORY = {looted = false, id = 2, message = "Couldn't find the category for this item."},
	PLAYER_HAS_NO_BP_AND_FALLBACK_DISABLED = {looted = false, id = 3, message = "Couldn't find any of the loot containers defined for this item."},
	COULD_NOT_FIND_ANY_BP = {looted = false, id = 4, message = "Couldn't find any of the loot containers defined for this item."},
	NO_FREE_SLOTS_LEFT = {looted = false, id = 5, message = "There is no empty slots left in the loot containers defined."},
	NO_CAPACITY ={looted = false, id = 6, message = "You don't have enough capacity."}
}


function onRecvbyte(player, msg, byte)
	setupDatabase()
	if byte == ClientPackets.ManageItemList then
		local lootMode = msg:getByte()
		local itemCount = msg:getU16()
		local itemList = {}

		if itemCount >= 1 then
			local item = nil
			for i = 1, itemCount do
				item = Game.getItemIdByClientId(msg:getU16())
				if item then
					table.insert(itemList, item:getId())
				end
			end
		end

		player:setQuickLootMode(lootMode)
		player:setQuickLootItems(itemList)
		player:sendLootBackpacks()
	elseif byte == ClientPackets.LootCorpse then
		-- TODO add spam protection
		local position = msg:getPosition()
		local itemId = msg:getU16()
		local stackPos = msg:getByte()

		local lootMode = player:getQuickLootMode()
		local lootList = player:getQuickLootItems()
		local quickLootBackpacks = player:getQuickLootBackpacks()
		if position.x == CONTAINER_POSITION then
			local container = player:getContainerById(position.y - 64)
			if container then
				local item = container:getItem(position.z)
				if item then
					local itemLooted = lootItem(player, quickLootBackpacks, item)
					if not itemLooted.looted then
						player:sendCancelMessage(itemLooted.message)
					else
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You looted " .. item:getCount().. "x "..item:getName() .. ".")
					end
					return
				end
			end
		end

		local itemTile = Tile(position)
		if not itemTile then
			return
		end

		if player:getPosition():getDistance(position) > 1 then
			return
		end

		local thing = itemTile:getThing(stackPos)
		if thing then
			local corpseOwner = thing:getCorpseOwner()
			if corpseOwner ~= 0 and not player:canOpenCorpse(corpseOwner) then
				player:sendCancelMessage("You are not the owner.")
				return
			end

			if thing:isContainer() then
				local itemsBefore = getContainerItems(thing)
				if #itemsBefore == 0 then
					player:sendTextMessage(MESSAGE_LOOT, "No loot.")
					return
				end

				lootContainer(player, quickLootBackpacks, thing, lootMode, lootList)

				local itemsAfter = getContainerItems(thing)
				local lootedItems = {}
				local notLootedItemsFromList = {}
				local notLootedItemsAtAll = {}
				for i, k in pairs(itemsBefore) do
					local itemStr = k:getCount().. "x "..k:getName()
					if not table.contains(itemsAfter, k) then
						table.insert(lootedItems, itemStr)
						player:updateLootTracker(k)
					elseif canLootItem(k.itemid, lootMode, lootList) then
						table.insert(notLootedItemsFromList, itemStr)
					else
						table.insert(notLootedItemsAtAll, itemStr)
					end
				end

				if #lootedItems > 0 then
					player:sendTextMessage(MESSAGE_LOOT, "You looted " .. table.concat(lootedItems, ", ") .. ".")
				else
					player:sendTextMessage(MESSAGE_LOOT, "You looted none of the dropped items.")
				end

				if #notLootedItemsFromList > 0 then
					player:sendCancelMessage("Could not loot " .. table.concat(notLootedItemsFromList, ", ") .. ".")
				end
			elseif thing:isItem() and canLootItem(thing.itemid, lootMode, lootList) then
				local itemType = thing:getType()
				if itemType:isCorpse() then
					return
				end

				local itemLooted = lootItem(player, quickLootBackpacks, thing)
				if not itemLooted.looted then
					player:sendCancelMessage(itemLooted.message)
				else
					player:sendTextMessage(MESSAGE_LOOT, "You looted " .. item:getCount().. "x "..item:getName() .. ".")
				end
			end
		end
	elseif byte == ClientPackets.SelectBackpack then
		local action = msg:getByte()
		if action == 0 then
			local category = msg:getByte()
			local containerType = msg:getU16()
			local containerSlot = msg:getU16()
			local containerPosition = msg:getByte()
			local containerId = msg:getU16()

			player:setQuickLootBackpack(category, containerSlot, containerPosition, containerId)
			player:sendLootBackpacks()
			player:updateQuickLootContainers()
		elseif action == 1 then
			local category = msg:getByte()
			player:setQuickLootBackpack(category, nil)
			player:sendLootBackpacks()
			player:updateQuickLootContainers()
		elseif action == 2 then
			local categoryId = msg:getByte()
			local quickLootBackpacks = player:getQuickLootBackpacks()

			if quickLootBackpacks[categoryId] then
				local category = quickLootBackpacks[categoryId]
				local container = getContainerByQuickLootCategory(player, categoryId, category.sid)
				if container then
					player:sendContainer(container)
				end
			end
		elseif action == 3 then
			local bpFallback = player:getQuickLootMainContainerFallback()
			if  bpFallback ~= nil then
			 	player:setQuickLootMainContainerFallback((bpFallback == 1) and 0 or 1)
			else
			 	player:setQuickLootMainContainerFallback(1)
			end
			player:sendLootBackpacks()
		end

	end
end

-- Helpers Methods
function getContainerItems(container)
	local rtn = {}
	for i = 0, container:getSize() do
		local item = container:getItem(i)
		if item then
			table.insert(rtn, item)
			if item:isContainer() then
				thisItems = getContainerItems(item)
				for i,k in pairs(thisItems) do
					table.insert(rtn, k)
				end
			end
		end
	end
	return rtn
end

function canLootItem(itemId, lootMode, lootList)
	if lootMode == QUICKLOOT_MODE_BLACKLIST then
		return not table.contains(lootList, itemId)
	end

	if lootMode == QUICKLOOT_MODE_WHITELIST then
		return table.contains(lootList, itemId)
	end

	return false
end

function lootContainer(player, backpacks, containerItem, lootMode, lootList)
	local container = Container(containerItem.uid)
	for i = 0, container:getSize() do
		local item = container:getItem(i)
		if item then
			if item:isContainer() then
				lootContainer(player, backpacks, item, lootMode, lootList)
			elseif item:isItem() then
				if canLootItem(item.itemid, lootMode, lootList) then
					if lootItem(player, backpacks, item).looted then
						lootContainer(player, backpacks, container, lootMode, lootList)
						break
					end
				end
			end
		end
	end
end

function lootItem(player, backpacks, item)
	if item:getWeight() > player:getFreeCapacity() then
		return QuickLootReturn.NO_CAPACITY
	end
	local itemType = ItemType(item.itemid)
	if not itemType or not itemType:getLootCategory() then
		return QuickLootReturn.ITEM_WITH_NO_CATEGORY
	end
	local category = itemType:getLootCategory()
	local definedBackpack = backpacks[category]

	-- If there is no bp defined for this category, set UnassignedLoot backpack as the target
	if not definedBackpack then
		category = QuickLootCategory.UnassignedLoot
		definedBackpack = backpacks[category]
	end

	local destination = false


	-- If there is no UnassignedLoot backpack defined or the player don't have the backpack in their inventory, set destination as the mainBp if fallback is enabled
	if not definedBackpack or not player:getItemCount(definedBackpack.sid) then
		if player:getQuickLootMainContainerFallback() == 1 then
			destination = player:getSlotItem(CONST_SLOT_BACKPACK)
		else
			return QuickLootReturn.PLAYER_HAS_NO_BP_AND_FALLBACK_DISABLED
		end
	end

	if not destination then
		destination = getContainerByQuickLootCategory(player, category, definedBackpack.sid)
	end
	if not destination then
		return QuickLootReturn.COULD_NOT_FIND_ANY_BP
	end

	-- check freeSlot (if you dont check, it will add items even being beyond backpack capacity)
	if destination:getEmptySlots() == 0 then
	-- search for another BP form MainBP like this with FreeSlots
	-- if cannot have slot to move, find next container inside selected backpack (or another container == this one in other backpack (recursive performance loss?))
	-- else if it's fully full
		-- move to UnassignedLoot (avoid redundancy checks by checking category again here, if it's already UnassignedLoot you can just go to main container)
		-- if cannot have slot to move, find next container inside UnassignedLoot backpack
		-- else if it's fully full
			-- if main container fallback is enabled, move to main cotainer
			-- else ignore (and send message to user)
		destination = getFirstFreeBPOfType(player:getSlotItem(CONST_SLOT_BACKPACK), destination.itemid)
		if not destination and not category == QuickLootCategory.UnassignedLoot then
			destination = getFirstFreeBPOfType(player:getSlotItem(CONST_SLOT_BACKPACK),  backpacks[QuickLootCategory.UnassignedLoot].sid)
		end
		if not destination and player:getQuickLootMainContainerFallback() == 1 then
			destination = getFirstFreeBPOfType(player:getSlotItem(CONST_SLOT_BACKPACK),  player:getSlotItem(CONST_SLOT_BACKPACK).itemid)
		end
		if not destination then
			return QuickLootReturn.NO_FREE_SLOTS_LEFT
		end
	end

	item:moveTo(destination)
	return QuickLootReturn.ITEM_LOOTED
end

function getFirstFreeBPOfType(rootContainer, bpSID)
	if rootContainer.itemid == bpSID and rootContainer:getEmptySlots() > 0 then
		return rootContainer
	end

	for i = 0, rootContainer:getSize() - 1 do
		local item = rootContainer:getItem(i)
		if item:isContainer() then
			local foundOurBP = getFirstFreeBPOfType(item, bpSID)
			if foundOurBP then
				return foundOurBP
			end
		end
	end

	return nil
end

function getContainerBySlot(player, containerSlot, containerIndex)
	local item

	local container = player:getContainerById(containerSlot - 64)
	if container then
		item = container:getItem(containerIndex)
	else
		item = player:getSlotItem(containerSlot)
	end

	return item
end

function getContainerByQuickLootCategory(player, categoryId, serverId)
	local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
	if inbox then
		local itemsCount = inbox:getItemCountById(serverId)
		if itemsCount then
			local insideInbox = checkContainerCategory(inbox, categoryId)
			if insideInbox then
				return insideInbox
			end
		end
	end

	local mainBp = player:getSlotItem(CONST_SLOT_BACKPACK)
	if mainBp and mainBp:hasQuickLootCategory(categoryId) then
		return mainBp
	end

	local itemsCount = player:getItemCount(serverId)
	if not itemsCount then -- If this player doesn't have any BP like its the set one in the inventory, use mainBP as fallback
		return nil
	end

	local insideBp = checkContainerCategory(mainBp, categoryId)
	if insideBp then
		return insideBp
	end

	return nil
end

function checkContainerCategory(containerItem, categoryId)
	if not containerItem then
		return nil
	end

	local container = Container(containerItem.uid)
	if container then
		if container:hasQuickLootCategory(categoryId) then
			return container
		end

		for i = 0, container:getSize() - 1 do
			local item = container:getItem(i)

			if item:isContainer() then
				local nestedContainer = checkContainerCategory(item, categoryId)
				if nestedContainer then
					return nestedContainer
				end
			end
		end
	end

	return nil
end

-- Container Methods
function Container.hasQuickLootCategory(self, categoryId)
	return self:getCustomAttribute(string.format("%s%d", QUICKLOOT_CATEGORY_ATTRIBUTE, categoryId)) == 1
end

function Container.addQuickLootCategory(self, categoryId)
	self:setCustomAttribute(string.format("%s%d", QUICKLOOT_CATEGORY_ATTRIBUTE, categoryId), 1)
end

function Container.removeQuickLootCategory(self, categoryId)
	self:removeCustomAttribute(string.format("%s%d", QUICKLOOT_CATEGORY_ATTRIBUTE, categoryId))
end

-- Player Methods
function Player.sendLootBackpacks(self)

	local playerId = self:getGuid()
	local containers = {}
	local count = 0
	local rows = db.storeQuery("SELECT `category_id`, `cid`, `sid` FROM `quickloot_containers` WHERE player_id = " .. playerId)

	if rows then
		repeat
			local categoryId = result.getNumber(rows, "category_id")
			local clientId = result.getNumber(rows, "cid")
			local serverId = result.getNumber(rows, "sid")

			if getContainerByQuickLootCategory(self, categoryId, serverId) then
				count = count + 1
				containers[categoryId] = clientId
			end
		until not result.next(rows)

		result.free(rows)
	end

	local msg = NetworkMessage()

	msg:addByte(ServerPackets.SendBackpack)
	msg:addByte(self:getQuickLootMainContainerFallback() or 1)
	msg:addByte(count)

	for categoryId, clientId in pairs(containers) do
		msg:addByte(categoryId)
		-- if categoryId == QuickLootCategory.UnassignedLoot and not clientId then
			--clientId =
		-- end
		msg:addU16(clientId)
	end

	msg:sendToPlayer(self)
end

function Player.setQuickLootBackpack(self, categoryId, containerSlot, containerPosition, containerId)
	local playerId = self:getGuid()

	-- if is just remove instead replace
	if not containerSlot then
		local oldContainerQuery = db.storeQuery("SELECT `sid` FROM `quickloot_containers` WHERE player_id = " .. playerId .. " and category_id = " .. categoryId)
		if oldContainerQuery then
			local serverId = result.getNumber(oldContainerQuery, "sid")
			local oldContainer = getContainerByQuickLootCategory(self, categoryId, serverId)
			if oldContainer then
				oldContainer:removeQuickLootCategory(categoryId)
			end
		end

		result.free(oldContainerQuery)
		db.query("DELETE FROM `quickloot_containers` WHERE `player_id` = " .. playerId .. " AND `category_id` = " .. categoryId)
		return
	end

	-- check if already exists
	local query = db.storeQuery("SELECT COUNT(category_id) as c FROM `quickloot_containers` WHERE player_id = " .. playerId .. " AND `category_id` = " .. categoryId)
	local count = result.getNumber(query, "c")
	result.free(query)

	local container = getContainerBySlot(self, containerSlot, containerPosition)
	if not container then
		return
	end

	if container.itemid == ITEM_GOLD_POUCH and categoryId ~= QuickLootCategory.Gold then
		self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return
	end

	-- if exists another value, remove custom attribute
	local oldServerId = container.itemid
	local oldContainer = getContainerByQuickLootCategory(self, categoryId, oldServerId)
	if oldContainer then
		oldContainer:removeQuickLootCategory(categoryId)
	end

	-- and add custom attribute to new container
	local serverId = container.itemid

	if not container:hasQuickLootCategory(categoryId) then
		container:addQuickLootCategory(categoryId)
	end

	if count == 0 then
		db.query("INSERT INTO `quickloot_containers` (`player_id`, `category_id`, `cid`, `sid`) VALUES (" .. playerId .. ", " .. categoryId .. ", " .. containerId .. ", " .. serverId .. ");")
		return
	end

	db.query('UPDATE `quickloot_containers` SET `cid` = ' .. containerId .. ', `sid` = ' .. serverId.. ' WHERE `player_id` = ' .. playerId .. ' AND `category_id` = ' .. categoryId .. '')
end

function Player.getQuickLootBackpacks(self)
	local playerId = self:getGuid()
	local query = db.storeQuery("SELECT `category_id`, `cid`, `sid` FROM `quickloot_containers` WHERE player_id = " .. playerId)
	local containers = {}

	if query then
		repeat
			local categoryId = result.getNumber(query, "category_id")
			local clientId = result.getNumber(query, "cid")
			local serverId = result.getNumber(query, "sid")

			containers[categoryId] = {
				cid = clientId,
				sid = serverId,
			}
		until not result.next(query)

		result.free(query)
	end

	return containers
end

function Player.resetQuickLootItems(self)
	self:setQuickLootItems({})
end

function Player.getQuickLootMode(self)
	return self:getStorageValue(StorageQuickLoot.LootMode)
end

function Player.getQuickLootMainContainerFallback(self)
	return self:getStorageValue(StorageQuickLoot.MainContainerFallback)
end

function Player.setQuickLootMode(self, check)
	self:setStorageValue(StorageQuickLoot.LootMode, check or 0)
end

function Player.setQuickLootMainContainerFallback(self, check)
	self:setStorageValue(StorageQuickLoot.MainContainerFallback, check or 0)
end

function Player.setQuickLootItems(self, items)
	if type(items) ~= "table" then
		items = {}
	end

	self:setSpecialStorage(StorageQuickLoot.ItemsToLoot, items)
end

function Player.getQuickLootItems(self)
	local value = self:getSpecialStorage(StorageQuickLoot.ItemsToLoot)
	if not value then
		return {}
	end

	return value
end

function Player.updateQuickLootContainers(self)
	-- local quickLootCategories = self:getQuickLootBackpacks()
	-- for i = QuickLootCategory.Armors, QuickLootCategory.StashRetrieve do
	-- 	getContainerByQuickLootCategory(self, i, )
	-- end
end

function setupDatabase()
	db.query([[CREATE TABLE IF NOT EXISTS `quickloot_containers` (
		`player_id` INT NOT NULL,
		`category_id` INT UNSIGNED NOT NULL,
		`cid` INT UNSIGNED NOT NULL,
		`sid` INT UNSIGNED NOT NULL,

		CONSTRAINT `fk_quickloot_containers_player_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
	)]])
end
