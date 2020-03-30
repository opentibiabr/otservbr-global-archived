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
	
	player:sendCancelMessage("Adicionado " .. split[2] .. " charm points para o personagem '" .. target:getName() .. "'.")
	target:sendCancelMessage("Recebido " .. split[2] .. " charm points!")
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

	player:sendCancelMessage("Resetado as charms do personagem '" .. target:getName() .. "'.")	
	player:sendCancelMessage("Adicionado " .. split[2] .. " charm points para o personagem '" .. target:getName() .. "'.")
	target:sendCancelMessage("Resetado as suas charms points!")
	target:setCharmPoints(0)
    target:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

end
