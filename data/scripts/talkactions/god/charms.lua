local talk = TalkAction("/addcharms")

function talk.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end
	local usage = "/addcharms PLAYER NAME,AMOUNT"
	if param == "" then
		player:sendCancelMessage("Command param required. Usage: ".. usage)
		return false
	end
	local split = param:split(",")
	if not split[2] then
		player:sendCancelMessage("Insufficient parameters. Usage: ".. usage)
		return false
	end
	local target = Player(split[1])
	if not target then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end
	--trim left
	split[2] = split[2]:gsub("^%s*(.-)$", "%1")
	
	player:sendCancelMessage("Added " .. split[2] .. " charm points to character '" .. target:getName() .. "'.")
	target:sendCancelMessage("Received " .. split[2] .. " charm points!")
	target:addCharmPoints(tonumber(split[2]))
    target:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

end
talk:separator(" ")
talk:register()
local talk = TalkAction("/resetcharms")

function talk.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	if param == "" then
		param = player:getName()
	end
	local target = Player(param)
	if not target then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	player:sendCancelMessage("Reseted charm points from character '" .. target:getName() .. "'.")	
	target:sendCancelMessage("Reseted your charm points!")
	target:setCharmPoints(0)
	target:setCharmRuneUsedAmount(0)
	target:setCharmRuneSlotExpansion(false)
	
	for i, charm in pairs(Bestiary.Charms) do
		target:resetCharmRuneCreature(charm)
	end
	target:setCharmUnlockedRuneBit(0)
    target:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

end


talk:separator(" ")
talk:register()


local talk = TalkAction("/charmexpansion")

function talk.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	if param == "" then
		param = player:getName()
	end
	local target = Player(param)
	if not target then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	player:sendCancelMessage("Added charm expansion for player '" .. target:getName() .. "'.")	
	target:sendCancelMessage("Received charm expansion!")
	target:setCharmRuneSlotExpansion(true)
    target:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

end


talk:separator(" ")
talk:register()


local talk = TalkAction("/charmrunes")

function talk.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	if param == "" then
		param = player:getName()
	end
	local target = Player(param)
	if not target then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	player:sendCancelMessage("Added all charm runes to '" .. target:getName() .. "'.")	
	target:sendCancelMessage("Received all charm runes!")
	playerCurBit = target:getCharmRunesBit()

	for i, charm in pairs(Bestiary.Charms) do
		target:addCharmRune(charm)
		playerCurBit = target:calculateCharmRuneBit(charm, true, playerCurBit)
	end
	target:setCharmRuneBit(playerCurBit)
    target:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

end


talk:separator(" ")
talk:register()

