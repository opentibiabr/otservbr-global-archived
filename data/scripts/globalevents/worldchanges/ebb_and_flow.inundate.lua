local config = {
    -- Posição inicial para onde os players serão teleportados quando o mapa for inundado e não estejam no raft
    waitPosition = Position(33892, 31020, 8),

    -- Tempo para ocorrer a alteração, tempo padrão é 2 minutos (120 * 1000)
    interval = (30 * 1000),

    -- Posição central da cave no primeiro andar para ser usada como referencia do getSpectators
	positionFirstFloor = {fromPosition = Position(33880, 31003, 8), toPosition = Position(33965, 31140, 8),center = Position(33920, 31073, 8)},
    -- Posições da cave no segundo andar para ser usada como referencia do getSpectators
	positionSecondFloor = {fromPosition = Position(33880, 31003, 9), toPosition = Position(33965, 31140, 9), center = Position(33920, 31073, 9)},
	boatPositionEmptyRoom = {
		{center = Position(33941, 31114, 9),
         rangeMinX = 2, rangeMaxX = 3, rangeMinY = 2, rangeMaxY = 2
        },
		{center = Position(33927, 31021, 9),
        rangeMinX = 2, rangeMaxX = 2, rangeMinY = 1, rangeMaxY = 2
        }
	},
	boatPositionFloodedRoom = {
		{center = Position(33941, 31114, 8),
		 rangeMinX = 2, rangeMaxX = 3, rangeMinY = 2, rangeMaxY = 2
		},
		{center = Position(33927, 31021, 8),
		 rangeMinX = 2, rangeMaxX = 2, rangeMinY = 1, rangeMaxY = 2
		}
	},
	safeSpots = {
		{center = Position(33941, 31020, 9), rangeMinX = 11, rangeMaxX = 11, rangeMinY = 8, rangeMaxY = 9},
		{center = Position(33939, 31047, 9), rangeMinX = 8, rangeMaxX = 9, rangeMinY = 8, rangeMaxY = 8},
		{center = Position(33893, 31046, 9), rangeMinX = 5, rangeMaxX = 5, rangeMinY = 10, rangeMaxY = 10},
		{center = Position(33904, 31050, 9), rangeMinX = 6, rangeMaxX = 7, rangeMinY = 10, rangeMaxY = 10},
		{center = Position(33915, 31046, 9), rangeMinX = 5, rangeMaxX = 6, rangeMinY = 10, rangeMaxY = 10},
		{center = Position(33900, 31069, 9), rangeMinX = 6, rangeMaxX = 6, rangeMinY = 6, rangeMaxY = 7},
		{center = Position(33906, 31086, 9), rangeMinX = 12, rangeMaxX = 12, rangeMinY = 11, rangeMaxY = 10},
		{center = Position(33900, 31098, 9), rangeMinX = 8, rangeMaxX = 8, rangeMinY = 6, rangeMaxY = 6},
		{center = Position(33940, 31072, 9), rangeMinX = 10, rangeMaxX = 10, rangeMinY = 8, rangeMaxY = 8},
		{center = Position(33928, 31075, 9), rangeMinX = 4, rangeMaxX = 3, rangeMinY = 5, rangeMaxY = 5},
		{center = Position(33941, 31084, 9), rangeMinX = 9, rangeMaxX = 9, rangeMinY = 5, rangeMaxY = 4},
		{center = Position(33904, 31122, 9), rangeMinX = 9, rangeMaxX = 10, rangeMinY = 11, rangeMaxY = 10},
		{center = Position(33931, 31105, 9), rangeMinX = 11, rangeMaxX = 11, rangeMinY = 5, rangeMaxY = 5},
		{center = Position(33929, 31114, 9), rangeMinX = 9, rangeMaxX = 8, rangeMinY = 5, rangeMaxY = 5},
		{center = Position(33931, 31122, 9), rangeMinX = 11, rangeMaxX = 11, rangeMinY = 4, rangeMaxY = 5},
	},
	teleportsRaft = {
		{teleportFrom = Position(33939, 31112, 8), teleportTo = Position(33935, 31112, 8)},
		{teleportFrom = Position(33939, 31113, 8), teleportTo = Position(33935, 31113, 8)},
		{teleportFrom = Position(33939, 31114, 8), teleportTo = Position(33935, 31114, 8)},
		{teleportFrom = Position(33939, 31115, 8), teleportTo = Position(33935, 31115, 8)},
		{teleportFrom = Position(33939, 31116, 8), teleportTo = Position(33935, 31116, 8)},
		{teleportFrom = Position(33944, 31112, 8), teleportTo = Position(33948, 31112, 8)},
		{teleportFrom = Position(33944, 31113, 8), teleportTo = Position(33948, 31113, 8)},
		{teleportFrom = Position(33944, 31114, 8), teleportTo = Position(33948, 31114, 8)},
		{teleportFrom = Position(33944, 31115, 8), teleportTo = Position(33948, 31115, 8)},
		{teleportFrom = Position(33944, 31116, 8), teleportTo = Position(33948, 31116, 8)},
		{teleportFrom = Position(33936, 31112, 8), teleportTo = Position(33940, 31112, 8)},
		{teleportFrom = Position(33936, 31113, 8), teleportTo = Position(33940, 31113, 8)},
		{teleportFrom = Position(33936, 31114, 8), teleportTo = Position(33940, 31114, 8)},
		{teleportFrom = Position(33936, 31115, 8), teleportTo = Position(33940, 31115, 8)},
		{teleportFrom = Position(33936, 31116, 8), teleportTo = Position(33940, 31116, 8)},
		{teleportFrom = Position(33947, 31112, 8), teleportTo = Position(33943, 31112, 8)},
		{teleportFrom = Position(33947, 31113, 8), teleportTo = Position(33943, 31113, 8)},
		{teleportFrom = Position(33947, 31114, 8), teleportTo = Position(33943, 31114, 8)},
		{teleportFrom = Position(33947, 31115, 8), teleportTo = Position(33943, 31115, 8)},
		{teleportFrom = Position(33947, 31116, 8), teleportTo = Position(33943, 31116, 8)},
	 }
}

--[[ Esse LoadMap vai carregar o mapa vázio somente com os detalhes e setar que ele está vázio. --]]

local EbbAndFlow = GlobalEvent("EbbAndFlow")
function EbbAndFlow.onStartup(interval)
	Game.loadMap('data/world/ebbandflow/eebandflowempty.otbm')
	Game.setStorageValue(GlobalStorage.SoulWarQuest.EddAndFlow.Empty, 1)
	Game.setStorageValue(GlobalStorage.SoulWarQuest.EddAndFlow.Active, 0)
	return true
end
EbbAndFlow:register()

--[[ 
    Funções para carregar os mapas da wolrd change,
    nesses mapas contém somente os detalhes que serão alterados. 
--]]
local function loadMapEmpty()
	Game.loadMap('data/world/ebbandflow/eebandflowempty.otbm')
end
local function loadMapInundate()
	Game.loadMap('data/world/ebbandflow/eebandflowinundate.otbm')
end

local function playerInSafeSpot()
	for i = 1, #config.safeSpots do
		local safeSpot = config.safeSpots[i]
		local specs, spec = Game.getSpectators(safeSpot.center, false, true, safeSpot.rangeMinX, safeSpot.rangeMaxX, safeSpot.rangeMinX, safeSpot.rangeMaxY)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
                print('playerInSafeSpot', spec:getName())
				return true
			end
		end
	end
end

local function playerInBoatEmptyRoom()
	for i = 1, #config.boatPositionEmptyRoom do
		local boat = config.boatPositionEmptyRoom[i]
		local specs, spec = Game.getSpectators(boat.center, false, true, boat.rangeMinX, boat.rangeMaxX, boat.rangeMinX, boat.rangeMaxY)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				local specPos = spec:getPosition()
				specPos = {x = specPos.x, y = specPos.y, z = specPos.z - 1}
				spec:teleportTo(specPos)
				return true
			else
				spec:remove()
				return true
			end
		end
	end
end

local function playerInBoatInundateRoom()
	for i = 1, #config.boatPositionFloodedRoom do
		local boat = config.boatPositionFloodedRoom[i]
		local specs, spec = Game.getSpectators(boat.center, false, true, boat.rangeMinX, boat.rangeMaxX, boat.rangeMinX, boat.rangeMaxY)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				local specPos = spec:getPosition()
				specPos = {x = specPos.x, y = specPos.y, z = specPos.z + 1}
				spec:teleportTo(specPos)
				return true
			end
		end
	end
end

local function sendPlayerToStart()
	local specs, spec = Game.getSpectators(config.positionSecondFloor.center, false, false, 44, 44, 74, 74)
	for i = 1, #specs do
		spec = specs[i]
		if spec:isPlayer() then
			if playerInBoatEmptyRoom() or playerInBoatInundateRoom() or playerInSafeSpot() then
			else
				spec:teleportTo(config.waitPosition)
			end
		else
			spec:remove()
		end
	end
end

local function ChecksPlayersOnSecondFloor()
	local specs, spec = Game.getSpectators(config.positionSecondFloor.center, false, true, 44, 44, 74, 74)
	for i = 1, #specs do
		spec = specs[i]
		if spec:isPlayer() then
			return true
		end
	end
end

local function ChecksPlayersOnFirstFloor()
	local specs, spec = Game.getSpectators(config.positionFirstFloor.center, false, true, 44, 44, 74, 74)
	for i = 1, #specs do
		spec = specs[i]
		if spec:isPlayer() then
			return true
		end
	end
end

local function isWater(itemId)
	local water = {
		4608,4609,4610,4611,4612,4613,4614,4615,4616,4617,
		4618,4619,4620,4621,4622,4623,4624,4625,4664,4665,
		4666,4820,4821,4823,4824,4825
		}

		for i = 1, #water do
			if itemId == water[i] then
				return true
			end
		end
	end

	local function isFloatRaft(itemId)
		local raft = {7187,7191,7193,7188,33575,7194,7190,7192,7195}
			for i = 1, #raft do
				if itemId == raft[i] then
					return true
				end
			end
		end

	local function isNormalRaft(itemId)
		local raft = {7201,7204,7206,7202,33575,7207,7203,7205,7208}
			for i = 1, #raft do
				if itemId == raft[i] then
					return true
				end
			end
		end

	local function floatingBorder(itemId)
		local floatingBorder = {36010,36006,36014,36009,36011,36007,36015,36013,36008,36017,36012,36016}
		for i = 1, #floatingBorder do
			if itemId == floatingBorder[i] then
				return true
			end
		end
	end

	local function stoneBorder(itemId)
		local stoneBorder = {22280,22284,19757,19758,22285,22283,19759,22286,22281,22291,22287,22282}
		for i = 1, #stoneBorder do
			if itemId == stoneBorder[i] then
				return true
			end
		end
	end

-- Vai percorrer a area do mapa e remover os sqms do primeiro andar para que os novos entrem
local function reloadFirstFloor()
	for x = config.positionFirstFloor.fromPosition.x, config.positionFirstFloor.toPosition.x do
		for y = config.positionFirstFloor.fromPosition.y, config.positionFirstFloor.toPosition.y do
			for z = config.positionFirstFloor.fromPosition.z, config.positionFirstFloor.toPosition.z do
				local tile = Tile(Position(x, y, z))
				if not tile then
					break
				end
				local items = tile:getItems()
				if items then
					for i = 1, #items do
					local itemid = items[i]:getId()
						if floatingBorder(itemid) or stoneBorder(itemid) then
						items[i]:remove()
						end
					end
				end
				local ground = tile:getGround()
				if ground then
					if isWater(ground.itemid) or isFloatRaft(ground.itemid) then
						ground:remove()
					end
				end

			end
		end
	end
end
-- Vai percorrer a area do mapa e remover os sqms do segundo andar para que os novos entrem
local function reloadSecondFloor()
		for x = config.positionSecondFloor.fromPosition.x, config.positionSecondFloor.toPosition.x do
			for y = config.positionSecondFloor.fromPosition.y, config.positionSecondFloor.toPosition.y do
				for z = config.positionSecondFloor.fromPosition.z, config.positionSecondFloor.toPosition.z do
					local tile = Tile(Position(x, y, z))
					if not tile then
						break
					end
					local items = tile:getItems()
					if items then
						for i = 1, #items do
						local itemid = items[i]:getId()
                        local openDoor = 6254
                        local closedDoor = 6253
                        if itemid == openDoor then
                            items[i]:transform(closedDoor)
                        end
							if isNormalRaft(itemid) then
							items[i]:remove()
							end
						end
					end
				end
			end
		end
end

local function reloadMap()
	-- local roomstate = Game.getStorageValue(GlobalStorage.SoulWarQuest.EddAndFlow.Empty)
		reloadFirstFloor()
		reloadSecondFloor()

end
-- Evento que vai disparar a cada 2 minutos uma série de eventos para atualizar o mapa.
local eddAndFlowInundate = GlobalEvent("eddAndFlowInundate")
function eddAndFlowInundate.onThink(interval, lastExecution)
	 if ChecksPlayersOnSecondFloor() or ChecksPlayersOnFirstFloor() then
		Game.setStorageValue(GlobalStorage.SoulWarQuest.EddAndFlow.Active, 1)
		print('Ebb And Flow - Ativado')
	 else
		Game.setStorageValue(GlobalStorage.SoulWarQuest.EddAndFlow.Active, 0)
		print('Ebb And Flow - Desativado')
	 end
		 
	if Game.getStorageValue(GlobalStorage.SoulWarQuest.EddAndFlow.Active) == 0 then
		return true
	end
		if Game.getStorageValue(GlobalStorage.SoulWarQuest.EddAndFlow.Empty) <= 1 then
			-- Game.broadcastMessage('Map flooded in 2 minutes.', MESSAGE_EVENT_ADVANCE)
			addEvent(reloadMap, config.interval)--Correto 120 * 1000
			addEvent(loadMapInundate, config.interval)--Correto 120 * 1000
			addEvent(sendPlayerToStart, config.interval)--Correto 120 * 1000
			Game.setStorageValue(GlobalStorage.SoulWarQuest.EddAndFlow.Empty, 2)
			Game.setStorageValue(GlobalStorage.SoulWarQuest.EddAndFlow.doors, -1)
			return true
		else
			-- Game.broadcastMessage('Map empty in 2 minutes.', MESSAGE_EVENT_ADVANCE)
			addEvent(reloadMap, config.interval)--Correto 120 * 1000
			addEvent(loadMapEmpty, config.interval) --Correto 120 * 1000
			addEvent(playerInBoatInundateRoom, config.interval) --Correto 120 * 1000
			Game.setStorageValue(GlobalStorage.SoulWarQuest.EddAndFlow.Empty, 0)
			Game.setStorageValue(GlobalStorage.SoulWarQuest.EddAndFlow.doors, 1)
			return true
		end

	return true
end
eddAndFlowInundate:interval(config.interval)
eddAndFlowInundate:register()


local lockDoorInundate = Action()
function lockDoorInundate.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local inundateRoom = Game.getStorageValue(GlobalStorage.SoulWarQuest.EddAndFlow.doors)
	if inundateRoom ~= 1 then
		local door = item:getId()
		local openDoor = 6254
		local closedDoor = 6253
		if door == closedDoor then
			item:transform(openDoor)
			return true
		else
			item:transform(closedDoor)
			return true
		end
	else
		player:say("The door can't be opened. The other side is flooded.", TALKTYPE_MONSTER_SAY, false, player)
		return true
	end
	return true
end
lockDoorInundate:aid(26001)
lockDoorInundate:register()

local teleportRaft = MoveEvent()
function teleportRaft.onStepIn(creature, item, pos, fromPosition)
	if Game.getStorageValue(GlobalStorage.SoulWarQuest.EddAndFlow.Empty) <= 1 then
		if not creature:isPlayer() then
			creature:teleportTo(fromPosition)
			return false
		end
		local posTp = item:getPosition()
		print(posTp.x,posTp.y,posTp.z)
		for i = 1, #config.teleportsRaft do
			if config.teleportsRaft[i].teleportFrom == posTp then
				creature:teleportTo(config.teleportsRaft[i].teleportTo)
			end
		end
	end
end

teleportRaft:type("stepin")
teleportRaft:aid(26002)
teleportRaft:register()