-- Common chest reward
-- You just need to add a new table in the data/startup/tables/chest.lua file
-- This script will pull everything from there

local AttributeTable = {
	[6013] = {
		text = [[
Hardek *
Bozo *
Sam ****
Oswald
Partos ***
Quentin *
Tark ***
Harsky ***
Stutch *
Ferumbras *
Frodo **
Noodles ****]]
	}
}

local commonReward = Action()
local function playerAddItem(params, item)
	local player = params.player
	if not checkWeightAndBackpackRoom(player, params.weight, params.message) then
		return false
	end

	addItem = player:addItem(params.itemid, params.count)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, params.message .. ".")
	player:setStorageValue(params.storage, 1)
	-- If the item is writeable, just put its unique and the text in the "AttributeTable"
	local attribute = AttributeTable[item.uid]
	if attribute then
		addItem:setAttribute(ITEM_ATTRIBUTE_TEXT, attribute.text)
	end
	return true
end

function commonReward.onUse(player, item, fromPosition, itemEx, toPosition)
	local setting = ChestUnique[item.uid]
	if not setting then
		return true
	end
	if player:getStorageValue(setting.storage) >= 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The ".. getItemName(setting.itemId) .. " is empty.")
		return true
	end

	for i = 1, #setting.itemReward do
		local itemid = setting.itemReward[i][1]
		local count = setting.itemReward[i][2]
		local itemDescriptions = getItemDescriptions(itemid)
		local itemArticle = itemDescriptions.article
		local itemName = itemDescriptions.name
		local addItemParams = {
			player = player,
			itemid = itemid,
			count = count,
			weight = getItemWeight(itemid) * count,
			storage = setting.storage
		}

		if count > 1 and ItemType(itemid):isStackable() then
			if (itemDescriptions.plural) then
				itemName = itemDescriptions.plural
			end
			addItemParams.message = "You have found " .. count .. " " .. itemName
		elseif ItemType(itemid):getCharges() > 0 then
			addItemParams.message = "You have found " .. itemArticle .. " " .. itemName
		else
			addItemParams.message = "You have found " .. itemArticle .. " " .. itemName
		end

		if not playerAddItem(addItemParams, item) then
			return true
		end
	end
	return true
end

for uniqueRange = 6001, 8000 do
	commonReward:uid(uniqueRange)
end

commonReward:register()
