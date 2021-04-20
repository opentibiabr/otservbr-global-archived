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
registerNpcType.speechBubble = function(npcType, mask)
	if mask.speechBubble then
		npcType:setSpeechBubble(mask.speechBubble)
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
		if mask.flags.hostile ~= nil then
			npcType:isHostile(mask.flags.hostile)
		end
		if mask.flags.floorchange ~= nil then
			npcType:floorChange(mask.flags.floorchange)
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
registerNpcType.events = function(npcType, mask)
	if type(mask.events) == "table" then
		for k, v in pairs(mask.events) do
			npcType:registerEvent(v)
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
