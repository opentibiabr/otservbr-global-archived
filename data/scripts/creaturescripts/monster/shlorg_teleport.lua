local position = {
    [1] = {pos = {x=27582, y=26971, z=9}},
    [2] = {pos = {x=27673, y=27047, z=9}},
    [3] = {pos = {x=27669, y=27058, z=9}},
    [4] = {pos = {x=27513, y=27055, z=9}}
}

local shlorgTeleport = CreatureEvent("ShlorgTeleport")
function shlorgTeleport.onThink(creature)
	local chance = math.random(1, 100)
	if chance < 7 then
		if(not creature:isMonster()) then
			return true
		end
		local spawn = position[math.random(4)]
		creature:teleportTo(spawn.pos)
		creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
end
shlorgTeleport:register()
