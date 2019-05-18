local summons = {
    [1] = {name = "Ironblight"},
    [2] = {name = "Cliff Strider"},
	[3] = {name = "Stone Devourer"},
	[4] = {name = "Enraged Crystal Golem"},
	[5] = {name = "Armadile"},
	[6] = {name = "Crystalcrusher"}
}

function onCastSpell(creature, var)
local t, spectator = Game.getSpectators(creature:getPosition(), false, false, 15, 15, 15, 15)
    local check = 0
    if #t ~= nil then
        for i = 1, #t do
		spectator = t[i]
            if spectator:isMonster() and not spectator:getMaster() then
               check = check + 1
            end
        end
    end
	local hp = (creature:getHealth()/creature:getMaxHealth())* 100
	if ((check < 6) and hp > 25) or ((check < 11) and hp <= 25) then
		creature:say("PROTECT THE CRYSTAL!", TALKTYPE_ORANGE_2)
		local a, b = math.random(-2, 2), math.random(-2, 2)
		for i = 1, 5 do
			Game.createMonster(summons[math.random(#summons)].name, Position(creature:getPosition().x + a, creature:getPosition().y + b, creature:getPosition().z), false, false)
		end
		else
	end
return true
end