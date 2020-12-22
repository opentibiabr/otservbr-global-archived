local summon = {
	[VOCATION.ID.SORCERER] = {id = 994},
	[VOCATION.ID.MASTER_SORCERER] = {id = 994},
	[VOCATION.ID.DRUID] = {id = 993},
	[VOCATION.ID.ELDER_DRUID] = {id = 993},
	[VOCATION.ID.PALADIN] = {id = 992},
	[VOCATION.ID.ROYAL_PALADIN] = {id = 992},
	[VOCATION.ID.KNIGHT] = {id = 991},
	[VOCATION.ID.ELITE_KNIGHT] = {id = 991}
}

local familiarLogin = CreatureEvent("FamiliarLogin")

function familiarLogin.onLogin(player)
	local vocation = summon[player:getVocation():getId()]
	if player:getAccountType() >= ACCOUNT_TYPE_GAMEMASTER and player:getGroup():getId() >= 4 then
		return true
	end
	if vocation then
		if (not isPremium(player) and player:hasFamiliar(vocation.id)) or player:getLevel()<200 then
				player:removeFamiliar(vocation.id)
		elseif isPremium(player) and player:getLevel()>=200 then
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
	local vocation = summon[player:getVocation():getId()]
	if newLevel>=200 and isPremium(player) then
		if not player:hasFamiliar(vocation.id) then
			player:addFamiliar(vocation.id)
		end
	end
	return true
end

advanceFamiliar:register()
