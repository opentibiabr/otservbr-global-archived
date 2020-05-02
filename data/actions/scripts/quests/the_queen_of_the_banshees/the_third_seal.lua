local function doTransformCoalBasins(cbPos)
	local tile = Position(cbPos):getTile()
	if tile then
		local thing = tile:getItemById(1485)
		if thing then
			thing:transform(1484)
		end
	end
end

local config = {
	[0] = 50015,
	[1] = 50016,
	[2] = 50017,
	[3] = 50018,
	[4] = 50019,
	coalBasins = {
		{x = 32214, y = 31850, z = 15},
		{x = 32215, y = 31850, z = 15},
		{x = 32216, y = 31850, z = 15}
	},
	effects = {
		[0] = {
			{x= 32217, y= 31845, z= 14},
			{x= 32218, y= 31845, z= 14},
			{x= 32219, y= 31845, z= 14},
			{x= 32220, y= 31845, z= 14},
			{x= 32217, y= 31843, z= 14},
			{x= 32218, y= 31842, z= 14},
			{x= 32219, y= 31841, z= 14}
		},
		[1] = {
			{x= 32217, y= 31844, z= 14},
			{x= 32218, y= 31844, z= 14},
			{x= 32219, y= 31843, z= 14},
			{x= 32220, y= 31845, z= 14},
			{x= 32219, y= 31845, z= 14}
		},
		[2] = {
			{x= 32217, y= 31842, z= 14},
			{x= 32219, y= 31843, z= 14},
			{x= 32219, y= 31845, z= 14},
			{x= 32218, y= 31844, z= 14},
			{x= 32217, y= 31844, z= 14},
			{x= 32217, y= 31845, z= 14}
		},
		[3] = {
			{x= 32217, y= 31845, z= 14},
			{x= 32218, y= 31846, z= 14},
			{x= 32218, y= 31844, z= 14},
			{x= 32219, y= 31845, z= 14},
			{x= 32220, y= 31846, z= 14}
		},
		[4] = {
			{x= 32219, y= 31841, z= 14},
			{x= 32219, y= 31842, z= 14},
			{x= 32219, y= 31846, z= 14},
			{x= 32217, y= 31843, z= 14},
			{x= 32217, y= 31844, z= 14},
			{x= 32217, y= 31845, z= 14},
			{x= 32218, y= 31843, z= 14},
			{x= 32218, y= 31845, z= 14}
		},
	},
}


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local switchNum = Game.getStorageValue("switchNum")
	if switchNum == -1 then
		Game.setStorageValue("switchNum", 0)
	end

	local table = config[switchNum]
	if not table then
		return true
	end

	if player:getStorageValue(Storage.QueenOfBansheesQuest.ThirdSeal) < 1 then
		if item.uid == table then
			item:transform(1945)
			Game.setStorageValue("switchNum", math.max(1, Game.getStorageValue("switchNum") + 1))
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			for i = 1, #config.effects[switchNum] do
				Position(config.effects[switchNum][i]):sendMagicEffect(CONST_ME_ENERGYHIT)
			end
			if Game.getStorageValue("switchNum") == 5 then
				for i = 1, #config.coalBasins do
					doTransformCoalBasins(config.coalBasins[i])
				end
			end
		else
			toPosition:sendMagicEffect(CONST_ME_ENERGYHIT)
		end
	else
		return false
	end
	return true
end
