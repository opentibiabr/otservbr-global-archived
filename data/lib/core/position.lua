-- Functions from The Forgotten Server
Position.directionOffset = {
	[DIRECTION_NORTH] = {x = 0, y = -1},
	[DIRECTION_EAST] = {x = 1, y = 0},
	[DIRECTION_SOUTH] = {x = 0, y = 1},
	[DIRECTION_WEST] = {x = -1, y = 0},
	[DIRECTION_SOUTHWEST] = {x = -1, y = 1},
	[DIRECTION_SOUTHEAST] = {x = 1, y = 1},
	[DIRECTION_NORTHWEST] = {x = -1, y = -1},
	[DIRECTION_NORTHEAST] = {x = 1, y = -1}
}

function Position:getNextPosition(direction, steps)
	local offset = Position.directionOffset[direction]
	if offset then
		steps = steps or 1
		self.x = self.x + offset.x * steps
		self.y = self.y + offset.y * steps
	end
end

function Position:moveUpstairs()
	local swap = function (lhs, rhs)
		lhs.x, rhs.x = rhs.x, lhs.x
		lhs.y, rhs.y = rhs.y, lhs.y
		lhs.z, rhs.z = rhs.z, lhs.z
	end

	self.z = self.z - 1

	local defaultPosition = self + Position.directionOffset[DIRECTION_SOUTH]
	local toTile = Tile(defaultPosition)
	if not toTile or not toTile:isWalkable(false, false, false, false, true) then
		for direction = DIRECTION_NORTH, DIRECTION_NORTHEAST do
			if direction == DIRECTION_SOUTH then
				direction = DIRECTION_WEST
			end

			local position = self + Position.directionOffset[direction]
			toTile = Tile(position)
			if toTile and toTile:isWalkable(false, false, false, false, true) then
				swap(self, position)
				return self
			end
		end
	end
	swap(self, defaultPosition)
	return self
end

-- Functions from OTServBR-Global
function Position:isInRange(from, to)
	-- No matter what corner from and to is, we want to make
	-- life easier by calculating north-west and south-east
	local zone = {
		nW = {
			x = (from.x < to.x and from.x or to.x),
			y = (from.y < to.y and from.y or to.y),
			z = (from.z < to.z and from.z or to.z)
		},
		sE = {
			x = (to.x > from.x and to.x or from.x),
			y = (to.y > from.y and to.y or from.y),
			z = (to.z > from.z and to.z or from.z)
		}
	}

	if  self.x >= zone.nW.x and self.x <= zone.sE.x
	and self.y >= zone.nW.y and self.y <= zone.sE.y
	and self.z >= zone.nW.z and self.z <= zone.sE.z then
		return true
	end
	return false
end

function Position:moveDownstairs()
	local swap = function (lhs, rhs)
		lhs.x, rhs.x = rhs.x, lhs.x
		lhs.y, rhs.y = rhs.y, lhs.y
		lhs.z, rhs.z = rhs.z, lhs.z
	end

	self.z = self.z + 1

	local defaultPosition = self + Position.directionOffset[DIRECTION_SOUTH]
	local tile = Tile(defaultPosition)
	if not tile then return false end

	if not tile:isWalkable(false, false, false, false, true) then
		for direction = DIRECTION_NORTH, DIRECTION_NORTHEAST do
			if direction == DIRECTION_SOUTH then
				direction = DIRECTION_WEST
			end

			local position = self + Position.directionOffset[direction]
			local newTile = Tile(position)
			if not newTile then return false end

			if newTile:isWalkable(false, false, false, false, true) then
				swap(self, position)
				return self
			end
		end
	end
	swap(self, defaultPosition)
	return self
end

function Position.getTile(self)
	return Tile(self)
end

function Position:getDistanceBetween(position)
	local xDif = math.abs(self.x - position.x)
	local yDif = math.abs(self.y - position.y)
	local posDif = math.max(xDif, yDif)
	if self.z ~= position.z then
		posDif = posDif + 15
	end
	return posDif
end

function Position:compare(position)
	return self.x == position.x and self.y == position.y and self.z == position.z
end

function Position.hasPlayer(centerPosition, rangeX, rangeY)
	local spectators = Game.getSpectators(centerPosition, false, true, rangeX, rangeX, rangeY, rangeY)
	if #spectators ~= 0 then
		return true
	end
	return false
end

function Position.removeMonster(centerPosition, rangeX, rangeY)
	local spectators = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
	local spectators,
	spectator = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isMonster() then
			spectator:remove()
		end
	end
end

function Position.getFreePosition(from, to)
	local result, tries = Position(from.x, from.y, from.z), 0
	repeat
		local x, y, z = math.random(from.x, to.x), math.random(from.y, to.y), math.random(from.z, to.z)
		result = Position(x, y, z)
		tries = tries + 1
		if tries >= 20 then
			return result
		end

		local tile = Tile(result)

	until tile and tile:isWalkable(false, false, false, false, true)
	return result
end

function Position.getFreeSand()
	local from, to = ghost_detector_area.from, ghost_detector_area.to
	local result, tries = Position(from.x, from.y, from.z), 0
	repeat
		local x, y, z = math.random(from.x, to.x), math.random(from.y, to.y), math.random(from.z, to.z)
		result = Position(x, y, z)
		tries = tries + 1
		if tries >= 50 then
			return result
		end

		local tile = Tile(result)

	until tile and tile:isWalkable(false, false, false, false, true) and tile:getGround():getName() == "grey sand"
	return result
end

function Position.getDirectionTo(pos1, pos2)
	local dir = DIRECTION_NORTH
	if (pos1.x > pos2.x) then
		dir = DIRECTION_WEST
		if(pos1.y > pos2.y) then
			dir = DIRECTION_NORTHWEST
		elseif(pos1.y < pos2.y) then
			dir = DIRECTION_SOUTHWEST
		end
	elseif (pos1.x < pos2.x) then
		dir = DIRECTION_EAST
		if(pos1.y > pos2.y) then
			dir = DIRECTION_NORTHEAST
		elseif(pos1.y < pos2.y) then
			dir = DIRECTION_SOUTHEAST
		end
	else
		if (pos1.y > pos2.y) then
			dir = DIRECTION_NORTH
		elseif(pos1.y < pos2.y) then
			dir = DIRECTION_SOUTH
		end
	end
	return dir
end

-- Checks if there is a creature in a certain position (position)
-- If so, teleports to another position (teleportTo)
function Position:hasCreature(position, teleportTo)
	local creature = Tile(position):getTopCreature()
	if creature then
		creature:teleportTo(teleportTo, true)
	end
end

--[[
If the script have one lever and item to revert uses:
Position.revertItem(createItemPosition, createItemId, tilePosition, itemTransform, itemId, effect)

If not have lever, use only the first two variables
Revert item: Position.revertItem(createItemPosition, createItemId)
"effect" variable is optional
]]
function Position.revertItem(positionCreateItem, itemIdCreate, positionTransform, itemId, itemTransform, effect)
	local tile = Tile(positionTransform)
	if tile then
		local lever = tile:getItemById(itemId)
		if lever then
			lever:transform(itemTransform)
		end
	end

	local getItemTile = Tile(positionCreateItem)
	if getItemTile then
		local getItemId = getItemTile:getItemById(itemIdCreate)
		if not getItemId then
			Game.createItem(itemIdCreate, 1, positionCreateItem)
			Position(positionCreateItem):sendMagicEffect(effect)
		end
	end
end

-- Position.transformItem(itemPosition, itemId, itemTransform, effect)
-- Variable "effect" is optional
function Position.transformItem(itemPosition, itemId, itemTransform, effect)
	local thing = Tile(itemPosition):getItemById(itemId)
	if thing then
		thing:transform(itemTransform)
		Position(itemPosition):sendMagicEffect(effect)
	end
end

-- Position.createItem(tilePosition, itemId, effect)
-- Variable "effect" is optional
function Position.createItem(itemPosition, itemId, effect)
	local tile = Tile(itemPosition)
	if not tile then
		return true
	end

	local thing = tile:getItemById(itemId)
	if not thing then
		Game.createItem(itemId, 1, itemPosition)
		Position(itemPosition):sendMagicEffect(effect)
	end
end

-- Position.removeItem(position, itemId, effect)
-- Variable "effect" is optional
function Position.removeItem(tilePosition, itemId, effect)
	local tile = Tile(tilePosition)
	if not tile then
		return true
	end

	local thing = tile:getItemById(itemId)
	if thing then
		thing:remove()
		Position(tilePosition):sendMagicEffect(effect)
	end
end
