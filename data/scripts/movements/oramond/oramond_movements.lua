local positions = {
	[5776] = Position(33634, 31891, 6),
	[5864] = Position(33488, 31987, 7),
	[5923] = Position(33632, 31661, 12),
	[5955] = Position(33682, 31939, 9),
	[5959] = Position(33678, 32461, 7),
	[6286] = Position(32942, 31594, 8),
	[6287] = Position(33143, 31528, 2),
	[6351] = Position(33626, 31897, 6),
	[6554] = Position(33651, 31943, 7),
	[6555] = Position(33662, 31936, 9),
	[6559] = Position(33612, 31640, 14),
	[6868] = Position(33787, 31736, 12),
	[6938] = Position(33626, 31639, 15),
	[7179] = Position(33623, 31627, 14),
	[7313] = Position(33506, 31577, 8), -- krailos
	[7525] = Position(33503, 31580, 7), -- krailos
	[7536] = Position(33622, 31789, 13), -- oramond sea
	[7765] = Position(32234, 32919, 9), -- liberty bay quaras
	[7766] = Position(32235, 32921, 8), -- liberty bay quaras
	[8217] = Position(32247, 32893, 9), -- liberty bay quaras
	[473] = Position(32244, 32892, 8), -- liberty bay quaras
	[9044] = Position(32262, 32913, 9), -- liberty bay quaras
	[9117] = Position(32264, 32911, 8), -- liberty bay quaras
	[9130] = Position(32271, 32872, 9), -- liberty bay quaras
	[474] = Position(32272, 32872, 8), -- liberty bay quaras
	[9202] = Position(31376, 32776, 7), -- treiners
	[9203] = Position(31247, 32787, 7), -- treiners
	[9245] = Position(33545, 31861, 7),
	[12521] = Position(32520, 32022, 8), -- kazordoon
	[12522] = Position(32444, 32388, 10), -- kazordoon
	[12523] = Position(33159, 32636, 8), -- ankrahmun
	[12524] = Position(32130, 31359, 12), -- ankrahmun
	[12525] = Position(32103, 31329, 12), -- no respawn
	[12526] = Position(32114, 31327, 12), -- no respawn
	[12527] = Position(32111, 31372, 14), -- reward
	[12528] = Position(32102, 31400, 13), -- out reward
	[12529] = Position(32114, 31353, 13),  -- init
	[12530] = Position(32090, 31320, 13),
	[12531] = Position(32272, 31382, 14), -- first boss for the second lever
	[12532] = Position(32113, 31353, 13), -- exit boss
	[12533] = Position(32337, 31289, 14), -- second boss for the thrird lever
	[12534] = Position(32306, 31250, 14), -- third boss for the four lever
	[12535] = Position(32203, 31284, 14), -- four boss for the last boss lever
	[12536] = Position(32216, 31378, 14), -- world devourer exit for the reward
	[12537] = Position(32162, 31295, 7), -- svarground exit
	[12538] = Position(32112, 31390, 11), -- svarground entrance
	[12539] = Position(33185, 31643, 8), -- from the quest for edron
	[12540] = Position(32113, 31358, 13), -- from edron for the quest
	[12542] = Position(32113, 31358, 13), -- from farmine for the quest
}

local oramondMovements = MoveEvent()

function oramondMovements.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local newPosition = positions[item.actionid]
	if newPosition then
		player:teleportTo(newPosition)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		player:say("Slrrp!", TALKTYPE_MONSTER_SAY)
	end
	return true
end

oramondMovements:type("stepin")

for index, value in pairs(positions) do
	oramondMovements:aid(index)
end

oramondMovements:register()
