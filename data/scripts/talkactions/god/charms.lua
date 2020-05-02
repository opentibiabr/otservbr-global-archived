local addCharm = TalkAction("/addcharms")

function addCharm.onSay(player, words, param)
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
addCharm:separator(" ")
addCharm:register()

local resetCharm = TalkAction("/resetcharms")

function resetCharm.onSay(player, words, param)
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
	target:setCharmRuneSlotExpansion(false)
	local runesUsed = target:getCharmUsedRuneBitAll()
	for i, charm in pairs(runesUsed) do
		target:resetCharmRuneCreature(Bestiary.Charms[charm])
	end
	target:setCharmUnlockedRuneBit(0)
	target:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

end

resetCharm:separator(" ")
resetCharm:register()

local charmExpansion = TalkAction("/charmexpansion")

function charmExpansion.onSay(player, words, param)
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

charmExpansion:separator(" ")
charmExpansion:register()

local charmRune = TalkAction("/charmrunes")

function charmRune.onSay(player, words, param)
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
	local playerCurBit = target:getCharmUnlockedRunesBit()
	for i, charm in pairs(Bestiary.Charms) do
		playerCurBit = Bestiary.bitToggle(playerCurBit, charm.id, true)
	end
	target:setCharmUnlockedRuneBit(playerCurBit)
	target:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

end

charmRune:separator(" ")
charmRune:register()

local setBestiary = TalkAction("/setbestiary")

function setBestiary.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	local usage = "/setbestiary PLAYER NAME,MONSTER NAME,AMOUNT"
	if param == "" then
		player:sendCancelMessage("Command param required. Usage: ".. usage)
		return false
	end
	local split = param:split(",")
	if not split[3] then
		player:sendCancelMessage("Insufficient parameters. Usage: ".. usage)
		return false
	end
	local target = Player(split[1])
	if not target then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	split[2] = split[2]:gsub("^%s*(.-)$", "%1") --Trim left
	split[3] = split[3]:gsub("^%s*(.-)$", "%1") --Trim left

	local monsterID = Bestiary.MonstersName[split[2]]
	if not monsterID then
		player:sendCancelMessage("This monster has no bestiary. Type the name exactly as in game.")
		return false
	end
	local amount = tonumber(split[3])

	player:sendCancelMessage("Set bestiary kill of monster '".. split[2] .. "' from player '" .. target:getName() .. "' to '" .. amount .. "'.")
	target:sendCancelMessage("Updated kills of monster '".. split[2] .. "'!")
	local playerCurBit = target:setBestiaryKillCount(monsterID, amount)
	target:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
end


setBestiary:separator(" ")
setBestiary:register()
