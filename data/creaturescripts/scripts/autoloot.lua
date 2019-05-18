function onModalWindow(player, modalWindowId, buttonId, choiceId)
	player:unregisterEvent('autoloot')	
	local limiteAutoloot = 100
	local autolootlist, sum = {}, 1
	if buttonId == 102 and modalWindowId == 1000 then
		local playerlist = player:getAutoLootList()
		if playerlist then
			table.sort(playerlist, function(a, b) return ItemType(a):getName() < ItemType(b):getName() end)
			for _, item in ipairs(playerlist) do
				table.insert(autolootlist, "".. item .."")
			end
			local itemType = ItemType(tonumber(autolootlist[choiceId]))
			player:sendTextMessage(MESSAGE_INFO_DESCR,'Removed '.. string.gsub(" "..ItemType(tonumber(autolootlist[choiceId])):getName(), "%W%l", string.upper):sub(2, 21)..' from autoloot list!')
			db.query('DELETE FROM `player_autoloot_persist` WHERE `player_guid` = ' .. getPlayerGUID(player) .. ' AND `item_id` = ' .. itemType:getId() .. '')
			player:removeAutoLootItem(itemType:getId())
			call(player, 'remove')
		end
		elseif buttonId == 102 and modalWindowId == 1001 or buttonId == 103 then
		local lootBlockList = lootBlockListm[getPlayerGUID(player)]
		if lootBlockList == nil or lootBlockList == -1 then
			return false
		end
		for _, loot in pairs(lootBlockList) do
			table.insert(autolootlist, lootBlockList[sum].itemId) 
			sum = sum + 1
		end
		local itemType = ItemType(tonumber(autolootlist[choiceId]))
		if buttonId == 102 then	
			player:sendTextMessage(MESSAGE_INFO_DESCR,'Removed '.. string.gsub(" "..ItemType(itemType:getId()):getName(), "%W%l", string.upper):sub(2, 21)..' from autoloot list!')
			db.query('DELETE FROM `player_autoloot_persist` WHERE `player_guid` = ' .. getPlayerGUID(player) .. ' AND `item_id` = ' .. itemType:getId() .. '')
			player:removeAutoLootItem(itemType:getId())
			elseif buttonId == 103 then	
			if player:getAutoLootList() then
			local playerlist = player:getAutoLootList()
			end
			if playerlist then
				for _, item in ipairs(playerlist) do
					table.insert(autolootlist, "".. item .."")
				end
			end
			if playerlist and #playerlist >= limiteAutoloot then
				player:sendCancelMessage("Reached the limit <"..#playerlist..">for itens, first remove using !autoloot or !add <monster>, selecting option remove.")
				return false
				else
				player:sendTextMessage(MESSAGE_INFO_DESCR,'Add '.. string.gsub(" "..ItemType(lootBlockList[choiceId].itemId):getName(), "%W%l", string.upper):sub(2, 21) ..' to autoloot list!')
				player:addAutoLootItem(itemType:getId())
			end
		end
		call(player, 'add')
		elseif buttonId == 105 then
		local lootBlockList = lootBlockListm[getPlayerGUID(player)]
		if lootBlockList == nil or lootBlockList == -1 then
			return false
		end
		for _, loot in pairs(lootBlockList) do
			table.insert(autolootlist, lootBlockList[sum].itemId)
			sum = sum + 1
		end
		local itemType = ItemType(tonumber(autolootlist[choiceId]))
		lastitem[getPlayerGUID(player)] = lootBlockList[choiceId].itemId
		call(player, 'backpack', modalWindowId, lastitem[getPlayerGUID(player)])
		elseif buttonId == 106 then
		local lootBlockList = player:getAutoLootList()
		table.sort(lootBlockList, function(a, b) return ItemType(a):getName() < ItemType(b):getName() end)
		if lootBlockList == nil or lootBlockList == -1 then
			return false
		end
		for _, loot in pairs(lootBlockList) do
			table.insert(autolootlist, lootBlockList[sum])
			sum = sum + 1
		end
		local itemType = ItemType(tonumber(autolootlist[choiceId]))
		lastitem[getPlayerGUID(player)] = lootBlockList[choiceId]
		call(player, 'backpack', modalWindowId, lastitem[getPlayerGUID(player)])
		elseif buttonId == 100 then
		if modalWindowId == 1005 then
			local container, bp, sequencer = {}, {}, 1
			local bp2 = {}
			for i = 0, getContainerSize(getPlayerSlotItem(player, CONST_SLOT_BACKPACK).uid) do
				local thing = getContainerItem(getPlayerSlotItem(player, CONST_SLOT_BACKPACK).uid, i)
				container[i] = getContainerItem(getPlayerSlotItem(player, CONST_SLOT_BACKPACK).uid, i)				
				if isContainer(container[i].uid) then
					itemtester = Item(container[i].uid)
					bp[sequencer] = itemtester
					bp2[sequencer] = itemtester:getId()
					sequencer = sequencer + 1
				end
			end
			if sequencer > 1 then
				if player:getAutoLootItem(lastitem[getPlayerGUID(player)]) then
					local resultId = db.storeQuery('SELECT `cont_id` FROM `player_autoloot_persist` WHERE `player_guid` = ' .. getPlayerGUID(player) .. ' AND `item_id` = ' .. lastitem[getPlayerGUID(player)] .. '')
					if resultId then
						local bp_id = result.getNumber(resultId, 'cont_id')
						else
						db.query("INSERT INTO `player_autoloot_persist` (`player_guid`, `cont_id`, `item_id`) VALUES (".. getPlayerGUID(player) ..", ".. bp2[choiceId] ..", ".. lastitem[getPlayerGUID(player)] ..") ON DUPLICATE KEY UPDATE `cont_id` = ".. bp2[choiceId])
					end
					if result.getNumber(resultId, 'cont_id') and result.getNumber(resultId, 'cont_id') ~= bp2[choiceId] then
						db.query('UPDATE `player_autoloot_persist` SET `cont_id` = '..bp2[choiceId]..' WHERE `player_guid` = ' .. getPlayerGUID(player) .. ' AND `item_id` = ' .. lastitem[getPlayerGUID(player)] .. '')
					end
				end
			end
			call(player, 'add')	
		end
		if modalWindowId == 1006 then
			local container, bp, sequencer = {}, {}, 1
			local bp2 = {}
			for i = 0, getContainerSize(getPlayerSlotItem(player, CONST_SLOT_BACKPACK).uid) do
				local thing = getContainerItem(getPlayerSlotItem(player, CONST_SLOT_BACKPACK).uid, i)
				container[i] = getContainerItem(getPlayerSlotItem(player, CONST_SLOT_BACKPACK).uid, i)				
				if isContainer(container[i].uid) then
					itemtester = Item(container[i].uid)
					bp[sequencer] = itemtester
					bp2[sequencer] = itemtester:getId()
					sequencer = sequencer + 1
				end
			end
			if sequencer > 1 then
				local resultId = db.storeQuery('SELECT `cont_id` FROM `player_autoloot_persist` WHERE `player_guid` = ' .. getPlayerGUID(player) .. ' AND `item_id` = ' .. lastitem[getPlayerGUID(player)] .. '')
				if resultId then
					local bp_id = result.getNumber(resultId, 'cont_id')
					else
					db.query("INSERT INTO `player_autoloot_persist` (`player_guid`, `cont_id`, `item_id`) VALUES (".. getPlayerGUID(player) ..", ".. bp2[choiceId] ..", ".. lastitem[getPlayerGUID(player)] ..") ON DUPLICATE KEY UPDATE `cont_id` = ".. bp2[choiceId])
				end
				if result.getNumber(resultId, 'cont_id') and result.getNumber(resultId, 'cont_id') ~= bp2[choiceId] then
					db.query('UPDATE `player_autoloot_persist` SET `cont_id` = '..bp2[choiceId]..' WHERE `player_guid` = ' .. getPlayerGUID(player) .. ' AND `item_id` = ' .. lastitem[getPlayerGUID(player)] .. '')
				end
			end
			call(player, 'remove')
			
		end
	end
end

function call(player, param, param2, tobpid)
	player:registerEvent('autoloot')	
	local title = "Autoloot Helper!"
	if param == 'add' then
		local lootBlockList = lootBlockListm[getPlayerGUID(player)]
		local message = "Loots of "..string.gsub(" "..string.lower(lootBlockListn[getPlayerGUID(player)]), "%W%l", string.upper):sub(2)..":"
		local window = ModalWindow(1001, title, message)
		local check, sum = {}, 1
		for _, loot in pairs(lootBlockList) do
			local status = ''
			if player:getAutoLootItem(lootBlockList[sum].itemId) then
				status = '*'
			end
			if not table.contains(check, ItemType(lootBlockList[sum].itemId):getName()) then
				table.insert(check, ItemType(lootBlockList[sum].itemId):getName())
				local resultId = db.storeQuery('SELECT `cont_id` FROM `player_autoloot_persist` WHERE `player_guid` = ' .. getPlayerGUID(player) .. ' AND `item_id` = ' .. lootBlockList[sum].itemId .. '')
				if resultId then
					local bp_id = result.getNumber(resultId, 'cont_id')
				end
				local backvinculo
				if result.getNumber(resultId, 'cont_id') and result.getNumber(resultId, 'cont_id') > 0 then
					backvinculo = '| '..ItemType(result.getNumber(resultId, 'cont_id')):getName()..''
					else
					backvinculo = ''
				end
				window:addChoice(sum, "".. string.gsub(" "..status..""..ItemType(lootBlockList[sum].itemId):getName(), "%W%l", string.upper):sub(2, 21) .." | "..lootBlockList[sum].maxCount.." | "..(lootBlockList[sum].chance/1000).."% "..string.gsub(" "..string.lower(backvinculo), "%W%l", string.upper):sub(2).."")
			end
			sum = sum + 1
		end
		if autolootBP == 1 then
			window:addButton(105, "Backpack")
		end
		callwindow(window, player, 1)
		elseif param == 'remove' then
		local message = "You are currently looting the following items:"
		local window = ModalWindow(1000, title, message)
		local check, sum = player:getAutoLootList(), 1
		if check then
			table.sort(check, function(a, b) return ItemType(a):getName() < ItemType(b):getName() end)
			for _, item in ipairs(check) do
				local resultId = db.storeQuery('SELECT `cont_id` FROM `player_autoloot_persist` WHERE `player_guid` = ' .. getPlayerGUID(player) .. ' AND `item_id` = ' .. ItemType(check[sum]):getId() .. '')
				if resultId then
					local bp_id = result.getNumber(resultId, 'cont_id')
				end
				local backvinculo
				if result.getNumber(resultId, 'cont_id') and result.getNumber(resultId, 'cont_id') > 0 then
					backvinculo = '| '..ItemType(result.getNumber(resultId, 'cont_id')):getName()..''
					else
					backvinculo = ''
				end
				window:addChoice(sum, "".. string.gsub(" "..(ItemType(item)):getName(), "%W%l", string.upper):sub(2, 21) .." "..string.gsub(" "..string.lower(backvinculo), "%W%l", string.upper):sub(2).."")
				sum = sum + 1
			end
			else
			player:sendCancelMessage("The list is empty.")
			return false
		end
		if autolootBP == 1 then
			window:addButton(106, "Backpack")
		end
		callwindow(window, player, 2)
		elseif param == 'backpack' then
		local lootBlockList = lootBlockListm[getPlayerGUID(player)]
		
		local modalcode
		if param2 and param2 == 1001 then
			modalcode = 1005
			else
			modalcode = 1006
		end
		local message = "Choose a Backpack:"
		local window = ModalWindow(modalcode, title, message)
		local sum = 1
		local container, names = {}, {}
		if getContainerSize(getPlayerSlotItem(player, CONST_SLOT_BACKPACK).uid) then
			for i = 0, getContainerSize(getPlayerSlotItem(player, CONST_SLOT_BACKPACK).uid) do
				local thing = getContainerItem(getPlayerSlotItem(player, CONST_SLOT_BACKPACK).uid, i)
				container[i] = getContainerItem(getPlayerSlotItem(player, CONST_SLOT_BACKPACK).uid, i)
				if isContainer(container[i].uid) then
					if not table.contains(names, container[i].itemId) then
						table.insert(names, container[i].itemId)
						window:addChoice(sum, ""..string.gsub(" "..string.lower(ItemType(container[i].itemid):getName()), "%W%l", string.upper):sub(2).."")
					end
					sum = sum + 1
				end
			end
			else
			player:sendCancelMessage("Not find main backpack.")
			return false
		end
		if sum == 1 then
			player:sendCancelMessage("Not find sub-backpacks.")
			return false
		end
		callwindow(window, player, 3)
	end
end

function callwindow(window, player, param)
	if param == 3 then
		window:setDefaultEnterButton(100, "Confirm")
		window:addButton(100, "Confirm")		
		else
		window:addButton(100, "Confirm")
		window:addButton(102, "Remove")
		window:setDefaultEnterButton(106, "Backpack")
		if param == 1 then
			window:addButton(103, "Add")
			window:setDefaultEnterButton(103, "Add")
			window:addButton(105, "Backpack")
		end
	end
	window:sendToPlayer(player)		
end