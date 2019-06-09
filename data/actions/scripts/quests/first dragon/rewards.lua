local config = {
	[10220] = {name = 'Porcelain Masks', count = 1},
	[10221] = {name = 'Backpack', count = 1},
	[10222] = {name = 'Colourful Feathers', count = 3}
}

local bpItems = {
	{name = 'Ancient Coin', count = 1},
	{name = 'Draken Sulphur', count = 1},
	{name = 'Seacrest Hair', count = 2},
	{name = 'Mystical Hourglass', count = 2},
	{name = 'Gold Token', count = 3},
	{name = 'Blue Gem', count = 1},
	{name = 'Yellow Gem', count = 1},
	{name = 'Red Gem', count = 1},
	{name = 'Demon Horn', count = 2},
	{name = 'Slime Heart', count = 2},
	{name = 'Energy Vein', count = 2},
	{name = 'Petrified Scream', count = 2},
	{name = 'Brimstone Shell', count = 2},
	{name = 'Deepling Wart', count = 2},
	{name = 'Wyrm Scale', count = 2},
	{name = 'Hellspawn Tail', count = 2}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local chest = config[item.uid]
	if not chest then
		return true
	end
	if player:getStorageValue(Storage.FirstDragon.Feathers) < 1 or player:getExhaustion(Storage.FirstDragon.MaskTimer) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The chest is empty.')
		return true
	end
	player:setStorageValue(Storage.FirstDragon.Feathers, 0)
	if item.uid == 10220 then
		player:setExhaustion(Storage.FirstDragon.MaskTimer, 432000) -- é pra ser 5 dias, se não der esse valor tente 432000000, mas é quase certo que é o valor que deixei
	end
	if item.uid ~= 10221 then
		player:addItem(chest.name, chest.count, true)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You found ' ..chest.count.. ' ' ..chest.name..'.')
		return true
	end
	if item.uid == 10221 then
		local bp = Game.createItem('Backpack', 1)
		if bp then
			for i = 1, #bpItems do
				bp:addItem(bpItems[i].name, count)
			end
			bp:moveTo(player)
		end
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You found a backpack.')
		return true
	end
end
