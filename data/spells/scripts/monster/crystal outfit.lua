function onCastSpell(creature, var)
local hp = (creature:getHealth()/creature:getMaxHealth())* 100
	if hp <= 25 then
		creature:say("PROTECT ME!!", TALKTYPE_ORANGE_2)
		creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		creature:setOutfit({lookTypeEx = 17999})
	elseif hp > 25 then
		creature:setOutfit({lookTypeEx = 17598})
	end
return true
end