registerNpcType = {}
setmetatable(registerNpcType,
{
	__call =
	function(self, npcType, mask)
		for _,parse in pairs(self) do
			parse(npcType, mask)
		end
	end
})

NpcType.register = function(self, mask)
	return registerNpcType(self, mask)
end

registerNpcType.name = function(npcType, mask)
	if mask.name then
		npcType:name(mask.name)
	end
end
registerNpcType.description = function(npcType, mask)
	if mask.description then
		npcType:nameDescription(mask.description)
	end
end
registerNpcType.experience = function(npcType, mask)
	if mask.experience then
		npcType:experience(mask.experience)
	end
end
registerNpcType.skull = function(npcType, mask)
	if mask.skull then
		npcType:skull(mask.skull)
	end
end
registerNpcType.outfit = function(npcType, mask)
	if mask.outfit then
		npcType:outfit(mask.outfit)
	end
end
registerNpcType.maxHealth = function(npcType, mask)
	if mask.maxHealth then
		npcType:maxHealth(mask.maxHealth)
	end
end
registerNpcType.health = function(npcType, mask)
	if mask.health then
		npcType:health(mask.health)
	end
end
registerNpcType.maxSummons = function(npcType, mask)
	if mask.maxSummons then
		npcType:maxSummons(mask.maxSummons)
	end
end
registerNpcType.race = function(npcType, mask)
	if mask.race then
		npcType:race(mask.race)
	end
end
registerNpcType.walkInterval = function(npcType, mask)
	if mask.walkInterval then
		npcType:walkInterval(mask.walkInterval)
	end
end
registerNpcType.walkRadius = function(npcType, mask)
	if mask.walkRadius then
		npcType:walkRadius(mask.walkRadius)
	end
end
registerNpcType.speed = function(npcType, mask)
	if mask.speed then
		npcType:baseSpeed(mask.speed)
	end
end
registerNpcType.corpse = function(npcType, mask)
	if mask.corpse then
		npcType:corpseId(mask.corpse)
	end
end
registerNpcType.flags = function(npcType, mask)
	if mask.flags then
		if mask.flags.attackable ~= nil then
			npcType:isAttackable(mask.flags.attackable)
		end
		if mask.flags.convinceable ~= nil then
			npcType:isConvinceable(mask.flags.convinceable)
		end
		if mask.flags.summonable ~= nil then
			npcType:isSummonable(mask.flags.summonable)
		end
		if mask.flags.illusionable ~= nil then
			npcType:isIllusionable(mask.flags.illusionable)
		end
		if mask.flags.hostile ~= nil then
			npcType:isHostile(mask.flags.hostile)
		end
		if mask.flags.healthHidden ~= nil then
			npcType:isHealthHidden(mask.flags.healthHidden)
		end
		if mask.flags.pushable ~= nil then
			npcType:isPushable(mask.flags.pushable)
		end
		if mask.flags.canPushItems ~= nil then
			npcType:canPushItems(mask.flags.canPushItems)
		end
		if mask.flags.canPushCreatures ~= nil then
			npcType:canPushCreatures(mask.flags.canPushCreatures)
		end
		if mask.flags.targetDistance then
			npcType:targetDistance(math.max(1, mask.flags.targetDistance))
		end
		if mask.flags.runHealth then
			npcType:runHealth(mask.flags.runHealth)
		end
		if mask.flags.staticAttackChance then
			npcType:staticAttackChance(mask.flags.staticAttackChance)
		end
		if mask.flags.canWalkOnEnergy ~= nil then
			npcType:canWalkOnEnergy(mask.flags.canWalkOnEnergy)
		end
		if mask.flags.canWalkOnFire ~= nil then
			npcType:canWalkOnFire(mask.flags.canWalkOnFire)
		end
		if mask.flags.canWalkOnPoison ~= nil then
			npcType:canWalkOnPoison(mask.flags.canWalkOnPoison)
		end
		if mask.flags.isBlockable ~= nil then
			npcType:isBlockable(mask.flags.isBlockable)
		end
	end
end
registerNpcType.light = function(npcType, mask)
	if mask.light then
		if mask.light.color then
			local color = mask.light.color
		end
		if mask.light.level then
			npcType:light(color, mask.light.level)
		end
	end
end
registerNpcType.changeTarget = function(npcType, mask)
	if mask.changeTarget then
		if mask.changeTarget.chance then
			npcType:changeTargetChance(mask.changeTarget.chance)
		end
		if mask.changeTarget.interval then
			npcType:changeTargetSpeed(mask.changeTarget.interval)
		end
	end
end
registerNpcType.strategiesTarget = function(npcType, mask)
	if mask.strategiesTarget then
		if mask.strategiesTarget.nearest then
			npcType:strategiesTargetNearest(mask.strategiesTarget.nearest)
		end
		if mask.strategiesTarget.health then
			npcType:strategiesTargetHealth(mask.strategiesTarget.health)
		end
		if mask.strategiesTarget.damage then
			npcType:strategiesTargetDamage(mask.strategiesTarget.damage)
		end
		if mask.strategiesTarget.random then
			npcType:strategiesTargetRandom(mask.strategiesTarget.random)
		end
	end
end
registerNpcType.respawnType = function(npcType, mask)
	if mask.respawnType then
		if mask.respawnType.period then
			npcType:respawnTypePeriod(mask.respawnType.period)
		end
		if mask.respawnType.underground then
			npcType:respawnTypeIsUnderground(mask.respawnType.underground)
		end
	end
end
registerNpcType.voices = function(npcType, mask)
	if type(mask.voices) == "table" then
		local interval, chance
		if mask.voices.interval then
			interval = mask.voices.interval
		end
		if mask.voices.chance then
			chance = mask.voices.chance
		end
		for k, v in pairs(mask.voices) do
			if type(v) == "table" then
				npcType:addVoice(v.text, interval, chance, v.yell)
			end
		end
	end
end
registerNpcType.summons = function(npcType, mask)
	if type(mask.summons) == "table" then
		for k, v in pairs(mask.summons) do
			npcType:addSummon(v.name, v.interval, v.chance)
		end
	end
end
registerNpcType.events = function(npcType, mask)
	if type(mask.events) == "table" then
		for k, v in pairs(mask.events) do
			npcType:registerEvent(v)
		end
	end
end
registerNpcType.loot = function(npcType, mask)
	if type(mask.loot) == "table" then
		local lootError = false
		for _, loot in pairs(mask.loot) do
			local parent = Loot()
			if loot.name then
				if not parent:setIdFromName(loot.name) then
					lootError = true
				end
			else
				if not isInteger(loot.id) or loot.id < 1 then
					lootError = true
				end
				parent:setId(loot.id)
			end
			if loot.subType or loot.charges then
				parent:setSubType(loot.subType or loot.charges)
			else
    			local lType = ItemType(loot.name and loot.name or loot.id)
				if lType and lType:getCharges() > 1 then
        			parent:setSubType(lType:getCharges())
				end
			end
			if loot.chance then
				parent:setChance(loot.chance)
			end
			if loot.minCount then
				parent:setMinCount(loot.minCount)
			end
			if loot.maxCount then
				parent:setMaxCount(loot.maxCount)
			end
			if loot.aid or loot.actionId then
				parent:setActionId(loot.aid or loot.actionId)
			end
			if loot.text or loot.description then
				parent:setText(loot.text or loot.description)
			end
			if loot.name then
				parent:setNameItem(loot.name)
			end
			if loot.article then
				parent:setArticle(loot.article)
			end
			if loot.attack then
				parent:setAttack(loot.attack)
			end
			if loot.defense then
				parent:setDefense(loot.defense)
			end
			if loot.extraDefense or loot.extraDef then
				parent:setExtraDefense(loot.extraDefense or loot.extraDef)
			end
			if loot.armor then
				parent:setArmor(loot.armor)
			end
			if loot.shootRange or loot.range then
				parent:setShootRange(loot.shootRange or loot.range)
			end
			if loot.unique then
				parent:setUnique(loot.unique)
			end
			if loot.child then
				for _, children in pairs(loot.child) do
					local child = Loot()
					if children.name then
						if not child:setIdFromName(children.name) then
							lootError = true
						end
					else
						if not isInteger(children.id) or children.id < 1 then
							lootError = true
						end
						child:setId(children.id)
					end
					if children.subType or children.charges then
						child:setSubType(children.subType or children.charges)
					else
    					local cType = ItemType(children.name and children.name or children.id)
						if cType and cType:getCharges() > 1 then
        					child:setSubType(cType:getCharges())
						end
					end
					if children.chance then
						child:setChance(children.chance)
					end
					if children.minCount then
						child:setMinCount(children.minCount)
					end
					if children.maxCount then
						child:setMaxCount(children.maxCount)
					end
					if children.aid or children.actionId then
						child:setActionId(children.aid or children.actionId)
					end
					if children.text or children.description then
						child:setText(children.text or children.description)
					end
					if loot.name then
						child:setNameItem(loot.name)
					end
					if children.article then
						child:setArticle(children.article)
					end
					if children.attack then
						child:setAttack(children.attack)
					end
					if children.defense then
						child:setDefense(children.defense)
					end
					if children.extraDefense or children.extraDef then
						child:setExtraDefense(children.extraDefense or children.extraDef)
					end
					if children.armor then
						child:setArmor(children.armor)
					end
					if children.shootRange or children.range then
						child:setShootRange(children.shootRange or children.range)
					end
					if children.unique then
						child:setUnique(children.unique)
					end
					parent:addChildLoot(child)
				end
			end
			npcType:addLoot(parent)
		end
		if lootError then
			print("[Warning - end] Monster: \"".. npcType:name() .. "\" loot could not correctly be load.")
		end
	end
end
registerNpcType.elements = function(npcType, mask)
	if type(mask.elements) == "table" then
		for _, element in pairs(mask.elements) do
			if element.type and element.percent then
				npcType:addElement(element.type, element.percent)
			end
		end
	end
end
registerNpcType.reflects = function(npcType, mask)
	if type(mask.reflects) == "table" then
		for _, reflect in pairs(mask.reflects) do
			if reflect.type and reflect.percent then
				npcType:addReflect(reflect.type, reflect.percent)
			end
		end
	end
end
registerNpcType.heals = function(npcType, mask)
	if type(mask.heals) == "table" then
		for _, heal in pairs(mask.heals) do
			if heal.type and heal.percent then
				npcType:addHealing(heal.type, heal.percent)
			end
		end
	end
end
registerNpcType.immunities = function(npcType, mask)
	if type(mask.immunities) == "table" then
		for _, immunity in pairs(mask.immunities) do
			if immunity.type and immunity.combat then
				npcType:combatImmunities(immunity.type)
			end
			if immunity.type and immunity.condition then
				npcType:conditionImmunities(immunity.type)
			end
		end
	end
end
registerNpcType.attacks = function(npcType, mask)
	if type(mask.attacks) == "table" then
		for _, attack in pairs(mask.attacks) do
			npcType:addAttack(readSpell(attack))
		end
	end
end

registerNpcType.defenses = function(npcType, mask)
	if type(mask.defenses) == "table" then
		if mask.defenses.defense then
			npcType:defense(mask.defenses.defense)
		end
		if mask.defenses.armor then
			npcType:armor(mask.defenses.armor)
		end
		for _, defense in pairs(mask.defenses) do
			if type(defense) == "table" then
				npcType:addDefense(readSpell(defense))
			end
		end
	end
end

function readSpell(incomingLua)
	local spell = MonsterSpell()
	if incomingLua.name then
		if incomingLua.name == "melee" then
			spell:setType("melee")
			if incomingLua.attack and incomingLua.skill then
				spell:setAttackValue(incomingLua.attack, incomingLua.skill)
			end
			if incomingLua.minDamage and incomingLua.maxDamage then
				spell:setCombatValue(incomingLua.minDamage, incomingLua.maxDamage)
			end
			if incomingLua.interval then
				spell:setInterval(incomingLua.interval)
			end
			if incomingLua.effect then
				spell:setCombatEffect(incomingLua.effect)
			end
		else
			spell:setType(incomingLua.name)
			if incomingLua.type then
				if incomingLua.name == "combat" then
					spell:setCombatType(incomingLua.type)
				elseif incomingLua.name == "condition" then
					spell:setConditionType(incomingLua.type)
				else 
					print("[Warning - register_monster_type] Monster \"".. npcType:name() .. "\": Loading spell \"".. incomingLua.name .. "\". Parameter type applies only for condition and combat.")
				end
			end
			if incomingLua.interval then
				spell:setInterval(incomingLua.interval)
			end
			if incomingLua.chance then
				spell:setChance(incomingLua.chance)
			end
			if incomingLua.range then
				spell:setRange(incomingLua.range)
			end
			if incomingLua.duration then
				spell:setConditionDuration(incomingLua.duration)
			end
			if incomingLua.speedChange then
				spell:setConditionSpeedChange(incomingLua.speedChange)
			end
			if incomingLua.target then
				spell:setNeedTarget(incomingLua.target)
			end
			if incomingLua.length then
				spell:setCombatLength(incomingLua.length)
			end
			if incomingLua.spread then
				spell:setCombatSpread(incomingLua.spread)
			end
			if incomingLua.radius then
				spell:setCombatRadius(incomingLua.radius)
			end
			if incomingLua.outfitMonster then
				spell:setOutfitMonster(incomingLua.outfitMonster)
			end
			if incomingLua.outfitItem then
				spell:setOutfitItem(incomingLua.outfitItem)
			end
			if incomingLua.minDamage and incomingLua.maxDamage then
				if incomingLua.name == "combat" or Spell(incomingLua.name) then
					spell:setCombatValue(incomingLua.minDamage, incomingLua.maxDamage)
				else
					local startDamage = 0
					if incomingLua.startDamage then
						startDamage = incomingLua.startDamage
					end
					spell:setConditionDamage(incomingLua.minDamage, incomingLua.maxDamage, startDamage)
				end
			end
			if incomingLua.effect then
				spell:setCombatEffect(incomingLua.effect)
			end
			if incomingLua.shootEffect then
				spell:setCombatShootEffect(incomingLua.shootEffect)
			end
		end

		-- This is for a complex spell, that has combat damage AND some condition
		-- For example scorpions, which attack and cause poison on attack
		if incomingLua.condition then
			if incomingLua.condition.type then
				spell:setConditionType(incomingLua.condition.type)
			end
			if incomingLua.condition.duration then
				spell:setConditionDuration(incomingLua.condition.duration)
			end
			if incomingLua.condition.interval then
				spell:setConditionTickInterval(incomingLua.condition.interval)
			end

			spell:setConditionDamage(incomingLua.condition.totalDamage, incomingLua.condition.totalDamage, 0)
		end
	elseif incomingLua.script then
		spell:setScriptName("monster/" .. incomingLua.script .. ".lua")
		if incomingLua.interval then
			spell:setInterval(incomingLua.interval)
		end
		if incomingLua.chance then
			spell:setChance(incomingLua.chance)
		end
		if incomingLua.minDamage and incomingLua.maxDamage then
			spell:setCombatValue(incomingLua.minDamage, incomingLua.maxDamage)
		end
		if incomingLua.target then
			spell:setNeedTarget(incomingLua.target)
		end
	end

	return spell
end
