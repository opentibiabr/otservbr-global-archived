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
	math.randomseed(os.time())
	if not player then
		return true
	end

	if item:getActionId() == 57356 and player:getStorageValue(Storage.DangerousDepths.Crystals.WarzoneV.bigCrystal1) < os.time() then
		if item:getId() == 30738 then
			largeCrystal(player)
		elseif item:getId() == 30740 then
			mediumCrystal(player)
		elseif item:getId() == 32405 then
			smallCrystal(player)
		end
		player:setStorageValue(Storage.DangerousDepths.Crystals.WarzoneV.bigCrystal1, os.time() + 5*60)
	elseif item:getActionId() == 57357 and player:getStorageValue(Storage.DangerousDepths.Crystals.WarzoneV.mediumCrystal1) < os.time() then
	if item:getId() == 30738 then
		largeCrystal(player)
	elseif item:getId() == 30740 then
		mediumCrystal(player)
	elseif item:getId() == 32405 then
		smallCrystal(player)
	end
	player:setStorageValue(Storage.DangerousDepths.Crystals.WarzoneV.mediumCrystal1, os.time() + 5*60)
	elseif item:getActionId() == 57358 and player:getStorageValue(Storage.DangerousDepths.Crystals.WarzoneV.bigCrystal2) < os.time() then
		if item:getId() == 30738 then
			largeCrystal(player)
		elseif item:getId() == 30740 then
			mediumCrystal(player)
		elseif item:getId() == 32405 then
			smallCrystal(player)
		end
		player:setStorageValue(Storage.DangerousDepths.Crystals.WarzoneV.bigCrystal2, os.time() + 5*60)
	elseif item:getActionId() == 57359 and player:getStorageValue(Storage.DangerousDepths.Crystals.WarzoneV.mediumCrystal2) < os.time() then
	if item:getId() == 30738 then
		largeCrystal(player)
	elseif item:getId() == 30740 then
		mediumCrystal(player)
	elseif item:getId() == 32405 then
		smallCrystal(player)
	end
	player:setStorageValue(Storage.DangerousDepths.Crystals.WarzoneV.mediumCrystal2, os.time() + 5*60)
	elseif item:getActionId() == 57360 and player:getStorageValue(Storage.DangerousDepths.Crystals.WarzoneV.smallCrystal1) < os.time() then
		if item:getId() == 30738 then
			largeCrystal(player)
		elseif item:getId() == 30740 then
			mediumCrystal(player)
		elseif item:getId() == 32405 then
			smallCrystal(player)
		end
	player:setStorageValue(Storage.DangerousDepths.Crystals.WarzoneV.smallCrystal1, os.time() + 5*60)
	elseif item:getActionId() == 57361 and player:getStorageValue(Storage.DangerousDepths.Crystals.WarzoneV.smallCrystal2) < os.time() then
		if item:getId() == 30738 then
			largeCrystal(player)
		elseif item:getId() == 30740 then
			mediumCrystal(player)
		elseif item:getId() == 32405 then
			smallCrystal(player)
		end
		player:setStorageValue(Storage.DangerousDepths.Crystals.WarzoneV.smallCrystal2, os.time() + 5*60)
	end

	return true
end
