local condition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
condition:setParameter(CONDITION_PARAM_SUBID, 88888)
condition:setParameter(CONDITION_PARAM_TICKS, 10*60*1000)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 0.01)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 10*60*1000)

local function firstTeleport(cid, var)
	local teleportPos = Position(1227, 775, 9)
    local creature = Creature(cid)
    if not creature then
        return
    end
	
	creature:say("Fer'bashahr shouted, and disappeared in a flash of light, instantly teleporting down into the depths of the earth.", TALKTYPE_MONSTER_SAY)
	for i = 1, 5 do
		Game.createMonster("Demon", Position(creature:getPosition().x + math.random(-2, 2), creature:getPosition().y + math.random(-2, 2), creature:getPosition().z), true, true)
	end
	creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	creature:teleportTo(teleportPos)
end

function onCastSpell(creature, var)
	local creaturePos = creature:getPosition()
	if creature:getHealth() < creature:getMaxHealth() * 0.5 and not creature:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, 88888) then
				
		addEvent(function(cid, var)
			local creature = Creature(cid)
			if not creature then
				return
			end
			creature:addCondition(condition)
			creature:say("*TELEPORTING IN PROGRESS*", TALKTYPE_MONSTER_SAY)
		end, 1, creature:getId(), var)
		
		addEvent(function(cid, effect)
			local creature = Creature(cid)
			if not creature then
				return
			end
			creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT) 
		end, 8 * 1000, creature:getId(), var)
		addEvent(function(cid, effect)
			local creature = Creature(cid)
			if not creature then
				return
			end
			creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT) 
		end, 8.5 * 1000, creature:getId(), var)
		addEvent(function(cid, effect)
			local creature = Creature(cid)
			if not creature then
				return
			end
			creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT) 
		end, 9 * 1000, creature:getId(), var)
		addEvent(function(cid, effect)
			local creature = Creature(cid)
			if not creature then
				return
			end
			creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT) 
		end, 9.5 * 1000, creature:getId(), var)
		addEvent(firstTeleport, 10 * 1000, creature:getId(), var)
		addEvent(function(cid, prev) 
			local creature = Creature(cid) 
			if not creature then 
				return 
			end 
			creature:teleportTo(prev)
			creature:say("I'M BACK!!", TALKTYPE_MONSTER_SAY)
			creaturePos:sendMagicEffect(CONST_ME_TELEPORT)		
		end, 30 * 1000, creature:getId(), creaturePos)		
	end
	return false
end