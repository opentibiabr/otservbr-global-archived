local function getDiagonalDistance(pos1, pos2)
	local dstX = math.abs(pos1.x - pos2.x)
	local dstY = math.abs(pos1.y - pos2.y)
	if dstX > dstY then
		return 14 * dstY + 10 * (dstX - dstY)
	else
		return 14 * dstX + 10 * (dstY - dstX)
	end
end
local function chain(player)
	local creatures = Game.getSpectators(player:getPosition(), false, false, 9, 9, 6, 6)
	local totalChain = 0
	local monsters = {}
	local meleeMonsters = {}
	for _, creature in pairs(creatures) do
		if creature:isMonster() then
			if creature:getType():isRewardBoss() then
				return -1
			elseif creature:getMaster() == nil and creature:getType():getTargetDistance() > 1 then
				table.insert(monsters, creature)
			elseif creature:getMaster() == nil then
				table.insert(meleeMonsters, creature)
			end
		end
	end
 
	local counter = 1
	local tempSize = #monsters
	if tempSize < 5 and #meleeMonsters > 0 then
		for i = tempSize, 5 do
			if meleeMonsters[counter] ~= nil then
				table.insert(monsters, meleeMonsters[counter])
				counter = counter + 1
			end
		end
	end
 
	local lastChain = player
	local lastChainPosition = player:getPosition()
	local closestMonster, closestMonsterIndex, closestMonsterPosition
	local path, tempPosition, updateLastChain
	while (totalChain < 5 and #monsters > 0) do
		closestMonster = nil
		for index, monster in pairs(monsters) do
			tempPosition = monster:getPosition()
			if not closestMonster or getDiagonalDistance(lastChain:getPosition(), tempPosition) < getDiagonalDistance(lastChain:getPosition(), closestMonsterPosition) then
				closestMonster = monster
				closestMonsterIndex = index
				closestMonsterPosition = tempPosition
			end
		end
		table.remove(monsters, closestMonsterIndex)
		updateLastChain = false
		if lastChainPosition:getDistance(closestMonsterPosition) == 1 then
			updateLastChain = true
		else
			path = lastChainPosition:getPathTo(closestMonsterPosition, 0, 1, true, true, 9)
			if path and #path > 0 then
				for i=1, #path do
					lastChainPosition:getNextPosition(path[i], 1)
					lastChainPosition:sendMagicEffect(CONST_ME_CHIVALRIOUS_CHALLENGE)
				end
				updateLastChain = true
			end
		end
		if updateLastChain then
			closestMonsterPosition:sendMagicEffect(CONST_ME_CHIVALRIOUS_CHALLENGE)
			closestMonster:changeTargetDistance(1)
			doChallengeCreature(player, closestMonster)
			lastChain = closestMonster
			lastChainPosition = closestMonsterPosition
			totalChain = totalChain + 1
		end
	end
	return totalChain
end
 
local spell = Spell("instant")
 
function spell.onCastSpell(creature, variant)
	local total = chain(creature)
	if total > 0 then
		return true
	elseif total == -1 then
		creature:sendCancelMessage("You can't use this spell if there's a boss.")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	else
		creature:sendCancelMessage("There are no monsters.")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
end
 
spell:group("support")
spell:id(237)
spell:name("Chivalrous Challenge")
spell:words("exeta amp res")
spell:level(150)
spell:mana(80)
spell:isAggressive(false)
spell:isPremium(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:vocation("knight;true", "elite knight;true")
spell:needLearn(false)
spell:register()