function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local orig = player:getPosition()
	local npc = Game.createNpc(param, orig)
	if npc then
		orig:sendMagicEffect(CONST_ME_MAGIC_RED)
		npc:setMasterPos(orig)
	else
		player:sendCancelMessage("There is not enough room.")
		orig:sendMagicEffect(CONST_ME_POFF)
	end
	return false
end
