function Tile.isCreature(self)
	return false
end

function Tile.isHouse(self)
	local house = self:getHouse()
	return not not house
end

function Tile.isItem(self)
	return false
end

function Tile.isPz(self)
	return self:hasFlag(TILESTATE_PROTECTIONZONE)
end

function Tile.isTile(self)
	return true
end

function Tile.relocateTo(self, toPosition, pushMove, monsterPosition)
	if self:getPosition() == toPosition then
		return false
	end

	if not Tile(toPosition) then
		return false
	end

	for i = self:getThingCount() - 1, 0, -1 do
		local thing = self:getThing(i)
		if thing then
			if thing:isItem() then
				if ItemType(thing.itemid):isMovable() then
					thing:moveTo(toPosition)
				end
			elseif thing:isCreature() then
				if monsterPosition and thing:isMonster() then
					thing:teleportTo(monsterPosition, pushMove)
				else
					thing:teleportTo(toPosition, pushMove)
				end
			end
		end
	end
	return true
end
