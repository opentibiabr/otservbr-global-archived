local function largeCrystal(player)
	local r = math.random(1, 10)
	if r == 1 then
		player:addItem(18554, 1) -- Crystal Rubbish
	else
		player:addItem(31993, 1) -- Heavy Crystal Fragment
	end
end

local function mediumCrystal(player)
	local r = math.random(1, 10)
	if r <= 5 then
		player:addItem(18554, 1) -- Crystal Rubbish
	else
		player:addItem(31993, 1) -- Heavy Crystal Fragment
	end
end

local function smallCrystal(player)
	local r = math.random(1, 10)
	if r <= 7 then
		player:addItem(18554, 1) -- Crystal Rubbish
	else
		player:addItem(31993, 1) -- Heavy Crystal Fragment
	end
end


function onUse(player, item)
	if not player then
		return true
	end

	if item:getActionId() == 57350 and player:getStorageValue(Storage.DangerousDepths.Crystals.WarzoneVI.mediumCrystal1) < os.time() then
		if item:getId() == 30738 then
			largeCrystal(player)
		elseif item:getId() == 30740 then
			mediumCrystal(player)
		elseif item:getId() == 32405 then
			smallCrystal(player)
		end
		player:setStorageValue(Storage.DangerousDepths.Crystals.WarzoneVI.mediumCrystal1, os.time() + 5*60)
	elseif item:getActionId() == 57351 and player:getStorageValue(Storage.DangerousDepths.Crystals.WarzoneVI.bigCrystal1) < os.time() then
		if item:getId() == 30738 then
			largeCrystal(player)
		elseif item:getId() == 30740 then
			mediumCrystal(player)
		elseif item:getId() == 32405 then
			smallCrystal(player)
		end
		player:setStorageValue(Storage.DangerousDepths.Crystals.WarzoneVI.bigCrystal1, os.time() + 5*60)
	elseif item:getActionId() == 57352 and player:getStorageValue(Storage.DangerousDepths.Crystals.WarzoneVI.bigCrystal2) < os.time() then
		if item:getId() == 30738 then
			largeCrystal(player)
		elseif item:getId() == 30740 then
			mediumCrystal(player)
		elseif item:getId() == 32405 then
			smallCrystal(player)
		end
		player:setStorageValue(Storage.DangerousDepths.Crystals.WarzoneVI.bigCrystal2, os.time() + 5*60)
	elseif item:getActionId() == 57353 and player:getStorageValue(Storage.DangerousDepths.Crystals.WarzoneVI.mediumCrystal2) < os.time() then
		if item:getId() == 30738 then
			largeCrystal(player)
		elseif item:getId() == 30740 then
			mediumCrystal(player)
		elseif item:getId() == 32405 then
			smallCrystal(player)
		end
		player:setStorageValue(Storage.DangerousDepths.Crystals.WarzoneVI.mediumCrystal2, os.time() + 5*60)
	elseif item:getActionId() == 57354 and player:getStorageValue(Storage.DangerousDepths.Crystals.WarzoneVI.smallCrystal1) < os.time() then
		if item:getId() == 30738 then
			largeCrystal(player)
		elseif item:getId() == 30740 then
			mediumCrystal(player)
		elseif item:getId() == 32405 then
			smallCrystal(player)
		end
		player:setStorageValue(Storage.DangerousDepths.Crystals.WarzoneVI.smallCrystal1, os.time() + 5*60)
	elseif item:getActionId() == 57355 and player:getStorageValue(Storage.DangerousDepths.Crystals.WarzoneVI.smallCrystal2) < os.time() then
		if item:getId() == 30738 then
			largeCrystal(player)
		elseif item:getId() == 30740 or item:getId() == 17017 then
			mediumCrystal(player)
		elseif item:getId() == 32405 then
			smallCrystal(player)
		end
		player:setStorageValue(Storage.DangerousDepths.Crystals.WarzoneVI.smallCrystal2, os.time() + 5*60)
	end

	return true
end
