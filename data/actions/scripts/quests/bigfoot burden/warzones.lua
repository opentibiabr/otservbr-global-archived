local creatureNames, crystalPosition = { 'humongous fungus', 'hideous fungus' }, Position(33104, 31908, 10)

local function summonMonster(name, position)
	Game.createMonster(name, position)
	position:sendMagicEffect(CONST_ME_TELEPORT)
end

local function chargingText(cid, text, position)
	local player = Player(cid)
	player:say(text, TALKTYPE_MONSTER_SAY, false, player, position)
end

local function revertTeleport(position)
	local teleportItem = Tile(position):getItemById(1387)
	if teleportItem then
		teleportItem:transform(17999)
	end
end

local function clearArea(fromPosition, toPosition, bossName, exitPosition)
	for x = fromPosition.x, toPosition.x do
		for y = fromPosition.y, toPosition.y do
			for z = fromPosition.z, toPosition.z do
				local creature = Tile(Position(x, y, z)):getTopCreature()
				if creature then
					if creature:isPlayer() then
						creature:teleportTo(exitPosition)
						exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
						creature:say('You were teleported out by the gnomish emergency device.', TALKTYPE_MONSTER_SAY)
					end

					if creature:isMonster() and creature:getName():lower() == bossName:lower() then
						creature:remove()
					end
				end
			end
		end
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if Game.getStorageValue(GlobalStorage.Warzones) == 1 then
		return false
	end

	Game.setStorageValue(GlobalStorage.Warzones, 1)
	addEvent(Game.setStorageValue, 32 * 60 * 1000, GlobalStorage.Warzones, 0)
	local pos
	for i = 1, 6 do
		for k = 1, 10 do
			pos = Position(math.random(33091, 33101), math.random(31899, 31916), 10)
			addEvent(summonMonster, (i - 1) * 20000, creatureNames[math.random(#creatureNames)], pos)
		end
		addEvent(chargingText, (i - 1) * 20000, player.uid, 'The crystals are charging.', toPosition)
	end

	local crystalItem = Tile(crystalPosition):getItemById(17999)
	if crystalItem then
		crystalItem:transform(1387)
		addEvent(revertTeleport, 6 * 20 * 1000, crystalPosition)
	end

	addEvent(summonMonster, 6 * 20 * 1000, 'deathstrike', Position(33100, 31955, 10))
	addEvent(clearArea, 32 * 60 * 1000, Position(33089, 31946, 10), Position(33124, 31983, 10), 'deathstrike', Position(33002, 31918, 10))
	return true
end