function onThink(creature)
local hp = (creature:getHealth()/creature:getMaxHealth())*100
	if hp < 85.0 then
		addEvent(function(cid)
			local creature = Creature(cid)
			local monsterPos = Position(33160, 31945, 15)
			if not creature then
				return
			end
			Game.createMonster("Liqour Spirit", monsterPos)
			creature:say("SPLASH!", TALKTYPE_ORANGE_2)
			creature:addHealth((creature:getMaxHealth()) - (creature:getHealth()))
			return true
		end, 100, creature:getId())
	end
end
