local summon = {
	[VOCATION.CLIENT_ID.SORCERER] = {id = 994},
	[VOCATION.CLIENT_ID.DRUID] = {id = 993},
	[VOCATION.CLIENT_ID.PALADIN] = {id = 992},
	[VOCATION.CLIENT_ID.KNIGHT] = {id = 991}
}

local familiarLogin = CreatureEvent("FamiliarLogin")

function familiarLogin.onLogin(player)
	local vocation = summon[player:getVocation():getClientId()]
	if vocation then
		if (not isPremium(player) and player:hasFamiliar(vocation.id)) or player:getLevel() < 200 then
				player:removeFamiliar(vocation.id)
		elseif isPremium(player) and player:getLevel() >= 200 then
			if player:getFamiliarLooktype() == 0 then
				player:setFamiliarLooktype(vocation.id)
			end
			if not player:hasFamiliar(vocation.id) then
				player:addFamiliar(vocation.id)
			end
		end
	end
	return true
end

familiarLogin:register()

local advanceFamiliar = CreatureEvent("AdvanceFamiliar")

function advanceFamiliar.onAdvance(player, skill, oldLevel, newLevel)
	local vocation = summon[player:getVocation():getClientId()]
	if newLevel >= 200 and isPremium(player) then
		if player:getFamiliarLooktype() == 0 then
				player:setFamiliarLooktype(vocation.id)
		end
		if not player:hasFamiliar(vocation.id) then
			player:addFamiliar(vocation.id)
		end
	end
	return true
end

advanceFamiliar:register()
