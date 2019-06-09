function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local issue = {}
	local bodycontainer, slot, msg = {}, 0, ''
	local monster = Tile(toPosition):getTopVisibleThing()
	local corpse = getTileItemById(toPosition, monster:getId()).uid
	local slots = getContainerSize(corpse)

	if not corpse or not slots then
		return false
	end

	local logic, contlogic, bplogica = 1, {}, {}
	if getContainerSize(getPlayerSlotItem(player, CONST_SLOT_BACKPACK).uid) then
	for i = 0, getContainerSize(getPlayerSlotItem(player, CONST_SLOT_BACKPACK).uid) do
		contlogic[logic] = getContainerItem(getPlayerSlotItem(player, CONST_SLOT_BACKPACK).uid, i)

		if isContainer(contlogic[logic].uid) then
		bplogica[logic] = contlogic[logic]
		logic = logic + 1
		end

	end
	end

	for times = 1, slots do
		bodycontainer[times] = getContainerItem(corpse, slot)
		if player:getAutoLootItem(bodycontainer[times].itemid) then

		local slotcorpse = bodycontainer[times].uid
		local itemcorpse = Item(slotcorpse)
		local slotgg
		local localizou
		local resultId = db.storeQuery('SELECT `cont_id` FROM `player_autoloot_persist` WHERE `player_guid` = ' .. getPlayerGUID(player) .. ' AND `item_id` = ' .. itemcorpse:getId() .. '')
			if resultId then
			local bp_id = result.getNumber(resultId, 'cont_id')
			end
		for i = 1, #bplogica do
		local tempitem = Item(bplogica[i].uid)
			if tempitem:getId() == result.getNumber(resultId, 'cont_id') and localizou ~= 1 then
				local bp = bplogica[i].uid
				local freeSlotsInBp = math.max(0, getContainerCap(bp) - getContainerSize(bp))
				if freeSlotsInBp and freeSlotsInBp > 0 then
				slotgg = bplogica[i].uid
				localizou = 1
				end
			end
		end

		local destination = Item(slotgg)

			if destination and destination:getTopParent() == player then
				itemcorpse:moveTo(destination)
					if bodycontainer[times].type > 1 then
					msg = ''..msg.. ', '..bodycontainer[times].type..' '..tostring(ItemType(bodycontainer[times].itemid):getPluralName())..''
					else
					msg = ''..msg.. ', '..tostring(ItemType(bodycontainer[times].itemid):getName())..''
					end
			else
				if not table.contains(issue, bodycontainer[times].itemid) then
				table.insert(issue, bodycontainer[times].itemid)
				end
				itemcorpse:moveToSlot(player, 0)
			end

		else
			slot = slot + 1
		end
	end

	if msg ~= '' then
	player:sendTextMessage(MESSAGE_INFO_DESCR,'Looted:'.. string.gsub(" "..msg, "%W%l", string.lower):sub(3) ..' opening corpse')
	end

	if issue then
	if #issue >= 1 then
	for i = 1, #issue do
	player:sendTextMessage(MESSAGE_INFO_DESCR,'All main '..string.gsub(" "..string.lower(ItemType(issue[i]):getName()), "%W%l", string.upper):sub(2)..' full, buy a new or move itens to sub backpacks.')
	end
	end
	end

end
