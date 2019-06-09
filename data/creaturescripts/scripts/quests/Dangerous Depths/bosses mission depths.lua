local function revert(position, toPosition)
	local teleport = Tile(position):getItemById(25417)
	if teleport then
		teleport:transform(1387)
		teleport:setDestination(toPosition)
	end
end

function onKill(player, creature)
	if not player:isPlayer() then
		return true
	end
	if not creature:isMonster() or creature:getMaster() then
		return true
	end
	local bosses = {
		["the count of the core"] = {stg = Storage.DangerousDepths.Bosses.theCountOfTheCore, value = os.time() + 20*60*60, teleportPosition = Position(33681, 32340, 15),
		toPosition = Position(33682, 32315, 15), toPositionBack = Position(33324, 32111, 15)},
		["the duke of the depths"] = {stg = Storage.DangerousDepths.Bosses.theDukeOfTheDepths, value = os.time() + 20*60*60, teleportPosition = Position(33719, 32302, 15),
		toPosition = Position(33691, 32301, 15), toPositionBack = Position(33275, 32318, 15)},
		["the baron from below"] = {stg = Storage.DangerousDepths.Bosses.theBaronFromBelow, value = os.time() + 20*60*60, teleportPosition = Position(33650, 32312, 15),
		toPosition = Position(33668, 32301, 15), toPositionBack = Position(33462, 32267, 15)},
	}
	local monsterName = creature:getName():lower()
	local boss = bosses[monsterName]
	if boss then
		for playerid, damage in pairs(creature:getDamageMap()) do
			local p = Player(playerid)
			if p then
				if p:getStorageValue(boss.stg) < boss.value then
					p:setStorageValue(boss.stg, boss.value)
				end
			end
		end
		local teleport = Tile(boss.teleportPosition):getItemById(1387)
		if teleport then
			teleport:transform(25417)
			teleport:setDestination(boss.toPosition)
			addEvent(revert, 5*60*1000, boss.teleportPosition, boss.toPositionBack)
		end
	end
	return true
end
