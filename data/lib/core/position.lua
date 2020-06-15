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

function Position:compare(position)
    return self.x == position.x and self.y == position.y and self.z == position.z
end

function Position:isInRange(fromPosition, toPosition)
    return (self.x >= fromPosition.x and self.y >= fromPosition.y and self.z >= fromPosition.z
        and self.x <= toPosition.x and self.y <= toPosition.y and self.z <= toPosition.z)
end

function getFreePosition(from, to)
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

function getFreeSand()
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

function getDirectionTo(pos1, pos2)
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