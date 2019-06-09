function onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	if not creature:isMonster() or creature:getMaster() then
		return false
	end
	local antesBoss = {"eshtaba the conjurer", "mezlon the defiler", "eliz the unyielding", "malkhar deathbringer", "dorokoll the mystic"}
	local fromPos = Position(33087, 31909, 15)
	local toPos = Position(33112, 31932, 15)
	local nascerBoss = 0
	for _x = fromPos.x, toPos.x, 1 do
		for _y = fromPos.y, toPos.y, 1 do
			for _z = fromPos.z, toPos.z, 1 do
				local tile = Tile(Position(_x, _y, _z))
				if tile then
					local monster = Monster(tile:getTopCreature())
					if monster then
						if isInArray(antesBoss, monster:getName():lower()) then
							nascerBoss = nascerBoss + 1
						end
					end
				end
			end
		end
	end
	if nascerBoss == 1 then
		Game.createMonster("Essence Of Malice", Position(33098, 31920, 15))
	end
    return true
end
