local converterIds = {
	[32109] = 33299,[33299] = 32109, -- transformar items magic gold converter ativo/inativo
}

local function start_converter(pid, itemid)
	local player = Player(pid)
	if player ~= nil then
	
	local item = player:getItemById(itemid,true)
		if player:getItemCount(itemid) >= 1 then
			if item:hasAttribute(ITEM_ATTRIBUTE_CHARGES) then
				local charges_n = item:getAttribute(ITEM_ATTRIBUTE_CHARGES)
				if charges_n >= 1 then
					local quickLootBackpacks = player:getQuickLootBackpacks()
					if player:getItemCount(ITEM_GOLD_COIN) >= 100 then
						player:removeItem(ITEM_GOLD_COIN, 100)
						local platitem = player:addItem(ITEM_PLATINUM_COIN, 1)
						item:setAttribute(ITEM_ATTRIBUTE_CHARGES,(charges_n-1))
						lootItem(player, quickLootBackpacks, platitem)
					elseif player:getItemCount(ITEM_PLATINUM_COIN) >= 100 then
						player:removeItem(ITEM_PLATINUM_COIN, 100)
						local ccitem = player:addItem(ITEM_CRYSTAL_COIN, 1)
						item:setAttribute(ITEM_ATTRIBUTE_CHARGES,(charges_n-1))
						lootItem(player, quickLootBackpacks, ccitem)
					end
					local converting = addEvent(start_converter, 200, pid, itemid)
				else
					item:remove(1)
					stopEvent(converting)
				end
			end
		else
			stopEvent(converting)
		end
	end
	return true
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
		item:transform(converterIds[item.itemid])
		item:decay() 
		start_converter(player:getId(), 33299)
	return true
end
