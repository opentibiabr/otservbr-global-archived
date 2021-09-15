local config = {
	[231] = TOWNS_LIST.AB_DENDRIEL,
	[4528] = TOWNS_LIST.CARLIN,
	[248] = TOWNS_LIST.KAZORDOON,
	[4529] = TOWNS_LIST.THAIS,
	[4530] = TOWNS_LIST.VENORE,
	[1283] = TOWNS_LIST.DARASHIA,
	[6841] = TOWNS_LIST.ANKRAHMUN,
	[6841] = TOWNS_LIST.EDRON,
	[7062] = TOWNS_LIST.FARMINE,
	[6841] = TOWNS_LIST.LIBERTY_BAY,
	[6841] = TOWNS_LIST.PORT_HOPE,
	[6841] = TOWNS_LIST.SVARGROND,
	[408] = TOWNS_LIST.YALAHAR,
	[8324] = TOWNS_LIST.GRAY_BEACH,
	[8594] = TOWNS_LIST.RATHLETON,
	[8584] = TOWNS_LIST.ROSHAMUUL,
	[8599] = TOWNS_LIST.ISSAVI,
}

local citizen = MoveEvent()

function citizen.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local townId = config[item.uid]
	if not townId then
		return true
	end

	local town = Town(townId)
	if not town then
		return true
	end

	if town:getId() == TOWNS_LIST.SVARGROND and player:getStorageValue(Storage.BarbarianTest.Questline) < 8 then
		player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, 'You first need to absolve the Barbarian Test Quest to become citizen!')
		player:teleportTo(town:getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	player:setTown(town)
	player:teleportTo(town:getTemplePosition())
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You are now a citizen of ' .. town:getName() .. '.')
	return true
end

citizen:type("stepin")

for index, value in pairs(config) do
	citizen:uid(index)
end

citizen:register()
