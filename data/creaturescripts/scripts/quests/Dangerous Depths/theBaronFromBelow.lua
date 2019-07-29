--[[local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)

function spellCallbackTemp(param)
	local tile = Tile(Position(param.pos))
	if tile then
		if tile:getTopCreature() and tile:getTopCreature():isMonster() then
			if tile:getTopCreature():getName():lower() == "the duke of the depths" then
				tile:getTopCreature():addHealth(math.random(0, 5000))
			end
		elseif tile:getTopCreature() and tile:getTopCreature():isPlayer() then
			tile:getTopCreature():addHealth(- math.random(0, 1500))
		end
	end
end

function onTargetTile(cid, pos)
	local param = {}
	param.cid = cid
	param.pos = pos
	param.count = 0
	spellCallbackTemp(param)
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")--]]


local function invocarHungry(creature)
	local c = Creature(creature)
	local temOrganic = false
	if c then
		local bossOldPosition = c:getPosition()
		local bossOldHealth = c:getHealth()
		c:remove()
		local hungryBoss = Game.createMonster("The Hungry Baron From Below", Position(33648, 32300, 15), true, true)
		local organicMatter = Game.createMonster("Organic Matter", Position(33647, 32300, 15), true, true)
		if hungryBoss then
			hungryBoss:registerEvent("theBaronFromBelow")
			hungryBoss:addHealth(-(hungryBoss:getHealth() - bossOldHealth))
			hungryBoss:say("Gulp!", TALKTYPE_MONSTER_SAY)
			addEvent(function()
				if hungryBoss then
					hungryBoss:say("Gulp!", TALKTYPE_MONSTER_SAY)
				end
				end, 2*1000)
			addEvent(function()
				local spectators = Game.getSpectators(Position(33648, 32303, 15), false, false, 20, 20, 20, 20)
				for _, checagem in pairs(spectators) do
					if checagem then
						if checagem:getName():lower() == "organic matter" then
							temOrganic = true
						end
					end
				end
				if temOrganic == true then
					local organicPosition = organicMatter:getPosition()
					organicMatter:remove()
					local hungryBossHealth = hungryBoss:getHealth()
					local hungryBossPosition = hungryBoss:getPosition()
					hungryBoss:remove()
					local newBoss = Game.createMonster("The Baron From Below", hungryBossPosition, true, true)
					if newBoss then
						newBoss:registerEvent("theBaronFromBelow")
						newBoss:addHealth( - (newBoss:getHealth() - hungryBossHealth))
						newBoss:addHealth(math.random(10000, 30000))
						for i = 1, 4 do
							Game.createMonster("Aggressive Matter", organicPosition, true, false)
						end
					end
				else
					local hungryBossHealth = hungryBoss:getHealth()
					local hungryBossPosition = hungryBoss:getPosition()
					hungryBoss:remove()
					local newBoss = Game.createMonster("The Baron From Below", hungryBossPosition, true, true)
					if newBoss then
						newBoss:registerEvent("theBaronFromBelow")
						newBoss:addHealth( - (newBoss:getHealth() - hungryBossHealth))
					end
				end
			end, 10*1000)
		end
	end
end

function onThink(creature)
	if not creature:isMonster() then
		return true
	end

	local c
	if creature:getName():lower() == "the baron from below" then
		addEvent(invocarHungry, 30*1000, creature:getId())
	end


	return true
end

function onKill(player, creature)
	if not player:isPlayer() then
		return true
	end

	if not creature:isMonster() then
		return true
	end

	local monsterName = creature:getName():lower()
	local position = creature:getPosition()
	if monsterName == "organic matter" then
		for i = 1, 4 do
			Game.createMonster("Aggressive Matter", position, true, false)
		end
	end
end
