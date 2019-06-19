function onKill(player, creature)
	if not player:isPlayer() then
		return true
	end
	if not creature:isMonster() or creature:getMaster() then
		return true
	end
	local bosses = {
		["ravennous hunger"] = {stg = Storage.CultsOfTibia.Barkless.Mission, value = 6},
		["the souldespoiler"] = {stg = Storage.CultsOfTibia.Misguided.Mission, value = 4},
		["essence of malice"] = {stg = Storage.CultsOfTibia.Humans.Mission, value = 2},
		["the unarmored voidborn"] = {stg = Storage.CultsOfTibia.Orcs.Mission, value = 2},
		["the false god"] = {stg = Storage.CultsOfTibia.Minotaurs.Mission, value = 4},
		["the sandking"] = {stg = Storage.CultsOfTibia.Life.Mission, value = 8, global = "sandking", g_value = 5},
		["the corruptor of souls"] = {createNew = 'The Source Of Corruption', pos = Position(33039, 31922, 15), removeMonster = 'zarcorix of yalahar', area1 = Position(33073, 31885, 15), area2 = Position(33075, 31887, 15)},
		["the source of corruption"] = {stg = Storage.CultsOfTibia.finalBoss.Mission, value = 2},
	}
	local monsterName = creature:getName():lower()
	local boss = bosses[monsterName]
	if boss then
		if boss.global and Game.getStorageValue(boss.global) < boss.g_value then
			return true
		end
		if boss.createNew then
			Game.setStorageValue('checkPiso', -1)
			Game.createMonster(boss.createNew, boss.pos)
			if removeMonster then
				for _x = boss.area1.x, boss.area2.x, 1 do
					for _y = boss.area1.y, boss.area2.y, 1 do
						for _z = boss.area1.z, boss.area2.z, 1 do
							if Tile(Position(_x, _y, _z)) then
							local monster = Tile(Position(_x, _y, _z)):getTopCreature()
								if monster and monster:isMonster() and monster:getName():lower() == string.lower(boss.removeMonster) then
									monster:remove()
								end
							end
						end
					end
				end
			end
			return true
		end
		for playerid, damage in pairs(creature:getDamageMap()) do
			-- broadcastMessage(playerid.." damage:"..damage.total)
			local p = Player(playerid)
			if p then
				-- broadcastMessage(p:getName())
				if p:getStorageValue(boss.stg) < boss.value then
					p:setStorageValue(boss.stg, boss.value)
				end
			end
		end
	end
	return true
end
