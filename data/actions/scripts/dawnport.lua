local config = {
	[1] = {
		--equipment spellbook, wand of vortex, magician's robe, mage hat, studded legs, leather boots, scarf
		items = {},
		--container platinum coin, rope, shovel, mana potion, adventurer stone
		container = {{2152, 20}, {7620, 5}, {18559, 1}, {2643, 1}, {2661, 1}, {2175, 1}, {2190, 1}, {8819, 1}, {8820, 1}, {2468, 1}}
	},
	[2] = {
		--equipment spellbook, snakebite rod, magician's robe, mage hat, studded legs, leather boots scarf
		items = {},
		--container platinum coin, rope, shovel, mana potion, adventurer's stone
		container = {{2152, 20}, {7620, 5}, {18559, 1}, {2643, 1}, {2661, 1}, {2175, 1}, {2182, 1}, {8819, 1}, {8820, 1}, {2468, 1}}
	},
	[3] = {
		--equipment dwarven shield, 5 spear, ranger's cloak, ranger legs scarf, legion helmet
		items = {},
		--container platinum coin, rope, shovel, health potion, mana potion, adventurer's stone
		container = {{2152, 20}, {7618, 5}, {7620, 5}, {18559, 1}, {2643, 1}, {2661, 1}, {2525, 1}, {2389, 5}, {2660, 1}, {8923, 1}, {2480, 1}}
	},
	[4] = {
		--equipment steel shield, steel axe, brass armor, brass helmet, brass legs scarf
		items = {},
		--container platinum coin, jagged sword, daramian mace, rope, shovel, health potion, mana potion, adventurer's stone
		container = {{2152, 20}, {8602, 1}, {2439, 1}, {7618, 5}, {7620, 5}, {18559, 1}, {2643, 1}, {2661, 1}, {2509, 1}, {8601, 1}, {2465, 1}, {2460, 1}, {2478, 1}}
	}
	
}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local voc = player:getVocation():getId()
	local targetVocation = config[voc]
	if (item:getId() == 5290 and voc == 1) or (item:getId() == 6898 and voc == 3) or (item:getId() == 9279 and voc == 4) or (item:getId() == 7040 and voc == 2) then
		if player:getStorageValue(Storage.Dawnport.Items) < 1 and player:getStorageValue(Storage.Dawnport.Oressa) > -1 then
			item:transform(item.itemid + 1)
			player:teleportTo(toPosition)
		end
	end
	if (item:getUniqueId() == 50463 and voc == 1) or (item:getUniqueId() == 50464 and voc == 3) or (item:getUniqueId() == 50465 and voc == 4) or (item:getUniqueId() == 50466 and voc == 2) then
		if player:getStorageValue(Storage.Dawnport.Items) < 1 then
		player:setStorageValue(Storage.Dawnport.Items, 1)
		for i = 1, #targetVocation.items do
			player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
		end
		local backpack = player:getVocation():getId() == 0 and player:addItem(1988)
		if not backpack then
			--return true
		end
		for i = 1, #targetVocation.container do
			player:addItem(targetVocation.container[i][1], targetVocation.container[i][2]) --backpack	
		end
		end
	end
end
