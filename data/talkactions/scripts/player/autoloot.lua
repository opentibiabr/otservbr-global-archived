function onSay(player, words, param)
	local lootlist, sum = player:getAutoLootList(), 1
	if lootlist then
		player:registerEvent('autoloot')
		local title = "Autoloot Helper!"
		local message = "You are currently looting the following items:"
		local window = ModalWindow(1000, title, message)
		table.sort(lootlist, function(a, b) return ItemType(a):getName() < ItemType(b):getName() end)
        for _, item in ipairs(lootlist) do
		local resultId = db.storeQuery('SELECT `cont_id` FROM `player_autoloot_persist` WHERE `player_guid` = ' .. getPlayerGUID(player) .. ' AND `item_id` = ' .. ItemType(item):getId() .. '')
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
		window:addButton(106, "Backpack")
		window:addButton(100, "Confirm")
		window:addButton(102, "Remove")
		if autolootBP == 1 then
		window:setDefaultEnterButton(106, "Backpack")
		end
		window:sendToPlayer(player)
		return true
    else
        player:sendCancelMessage("The list is empty.")
        return false
    end
end
