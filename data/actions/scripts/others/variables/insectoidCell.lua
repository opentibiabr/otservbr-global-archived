local insectoidcell = {
			[61611] = {storage = 40758, reward = 15572, count = 1},
			[61612] = {storage = 40806, reward = 15572, count = 1},
			[61613] = {storage = 40807, reward = 15572, count = 1},
			[61614] = {storage = 40808, reward = 15572, count = 1},
			[61615] = {storage = 40809, reward = 15572, count = 1},
			[61616] = {storage = 40810, reward = 15572, count = 1},
			[61617] = {storage = 40811, reward = 15572, count = 1},
			[61618] = {storage = 40812, reward = 15572, count = 1},
			[61619] = {storage = 40813, reward = 15572, count = 1},
			[61620] = {storage = 40814, reward = 15572, count = 1},
			[61621] = {storage = 40815, reward = 15572, count = 1},
			[61622] = {storage = 40816, reward = 15572, count = 1},
			[61623] = {storage = 40817, reward = 15572, count = 1},
			[61624] = {storage = 40818, reward = 15572, count = 1},
			[61625] = {storage = 40819, reward = 15572, count = 1},
			[61626] = {storage = 40820, reward = 15572, count = 1},
			[61627] = {storage = 40821, reward = 15572, count = 1}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
     local config = insectoidcell[item.actionid]
     if player:getStorageValue(config.storage) > os.time() then
         return player:sendCancelMessage("The insectoid cell is empty.")
     end
    local info, count = ItemType(config.reward), config.count
     if count > 1 then
         text = count .. " " .. info:getPluralName()
     else
         text = info:getArticle() .. " " .. info:getName()
     end
		local weight = ItemType(config.reward):getWeight()
     if player:getFreeCapacity() < weight then
         player:getPosition():sendMagicEffect(CONST_ME_POFF)
		 player:sendCancelMessage(string.format('You have found %s weighing %.2f oz. You have no capacity.', text, (weight / 100)))
     else
        text = "You have received " .. text .. "."
		player:addItem(config.reward)
		player:sendTextMessage(MESSAGE_INFO_DESCR, text)

         player:setStorageValue(config.storage, os.time() + 7*24*60*60)
     end
     return true
end
