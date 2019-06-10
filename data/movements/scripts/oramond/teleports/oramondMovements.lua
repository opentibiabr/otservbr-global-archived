local action_id = {
	[13400] = {x = 33634, y = 31891, z = 6},
	[13401] = {x = 33488, y = 31987, z = 7},
	[13402] = {x = 33632, y = 31661, z = 12},
	[13403] = {x = 33682, y = 31939, z = 9},
	[13404] = {x = 33678, y = 32461, z = 7},
	[13405] = {x = 32942, y = 31594, z = 8},
	[13406] = {x = 33143, y = 31528, z = 2},
	[13407] = {x = 33626, y = 31897, z = 6},
	[13408] = {x = 33651, y = 31943, z = 7},
	[13409] = {x = 33662, y = 31936, z = 9},
	[13410] = {x = 33612, y = 31640, z = 14},
	[13411] = {x = 33787, y = 31736, z = 12},
	[13412] = {x = 33626, y = 31639, z = 15},
	[13413] = {x = 33623, y = 31627, z = 14},
	[13415] = {x = 33506, y = 31577, z = 8}, -- krailos
	[13416] = {x = 33503, y = 31580, z = 7}, -- krailos
	[13417] = {x = 33622, y = 31789, z = 13}, -- oramond sea
	[13418] = {x = 32234, y = 32919, z = 9},	-- liberty bay quaras
	[13419] = {x = 32235, y = 32921, z = 8},	-- liberty bay quaras
	[13420] = {x = 32247, y = 32893, z = 9}, -- liberty bay quaras
	[13421] = {x = 32244, y = 32892, z = 8}, -- liberty bay quaras
	[13422] = {x = 32262, y = 32913, z = 9}, -- liberty bay quaras
	[13423] = {x = 32264, y = 32911, z = 8}, -- liberty bay quaras
	[13424] = {x = 32271, y = 32872, z = 9}, -- liberty bay quaras
	[13425] = {x = 32272, y = 32872, z = 8}, -- liberty bay quaras
	[13426] = {x = 31376, y = 32776, z = 7}, -- treiners
	[13427] = {x = 31247, y = 32787, z = 7}, -- treiners
	[13428] = {x = 33545, y = 31861, z = 7},
    [13510] = {x = 32520, y = 32022, z = 8}, -- kazordoon
	[13511] = {x = 32444, y = 32388, z = 10}, -- kazordoon
	[13512] = {x = 33159, y = 32636, z = 8}, -- ankrahmun
	[13513] = {x = 32130, y = 31359, z = 12},	 -- ankrahmun
	[13514] = {x = 32103, y = 31329, z = 12},	-- no respawn
	[13515] = {x = 32114, y = 31327, z = 12}, -- no respawn
	[13516] = {x = 32111, y = 31372, z = 14}, -- pra recompensa
	[13517] = {x = 32102, y = 31400, z = 13}, -- fora da recompensa
	[13518] = {x = 32114, y = 31353, z = 13},  -- pro começo
	[13519] = {x = 32090, y = 31320, z = 13}, -- do msg pra recompensa
	[13520] = {x = 32272, y = 31382, z = 14}, -- primeiro boss pra segunda alavanca
	[13521] = {x = 32113, y = 31353, z = 13}, -- saindo dos bosses

	[13522] = {x = 32337, y = 31289, z = 14}, -- segundo boss pra terceira alavanca
	[13523] = {x = 32306, y = 31250, z = 14}, -- terceiro boss pra quarta alavanca
	[13524] = {x = 32203, y = 31284, z = 14}, -- quarto boss pra ultima alavanca do ultimo boss
	[13525] = {x = 32216, y = 31378, z = 14}, -- saida do World Devourer pra recompensa
	[13526] = {x = 32162, y = 31295, z = 7}, -- svarground saida
	[13527] = {x = 32112, y = 31390, z = 11}, -- svarground entrada

	[13528] = {x = 33185, y = 31643, z = 8}, -- lá dentro da quest e vai pra edron
	[13529] = {x = 32113, y = 31358, z = 13}, -- de edron lá pra dentro COORDENADA CERTA
	[13531] = {x = 32113, y = 31358, z = 13}, -- de farmine lá pra dentro COORDENADA CERTA	-- oramond sea
}

function onStepIn(creature, item, position, fromPosition)

	local action = action_id[item.actionid]
	if action then
		local player = creature:getPlayer()
		if player == nil then
			return false
		end

		player:teleportTo(action)
		player:say("Slrrp!", TALKTYPE_MONSTER_SAY)
	end

	return true
end
