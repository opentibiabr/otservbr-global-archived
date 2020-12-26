--[[
	/addoutfit playername, looktype
	make sure you’re adding a male outfit to a male character
	if you try to add a female outfit to a male character, it won’t work
]]

local printConsole = true

local addOutfit = TalkAction("/addoutfit")

function addOutfit.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	local split = param:split(",")
	local name = split[1]
	local lookType = tonumber(split[2])

	local target = Player(name)
	if target then
		target:addOutfit(lookType)
		target:sendTextMessage(MESSAGE_EVENT_ADVANCE, "".. player:getName() .." has been added a new outfit for you.")
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have sucessfull added looktype ".. lookType .. " to the player ".. target:getName() ..".")
		if printConsole then
			print("[Info - TalkAction /addOutfit] Player: '".. player:getName() .."' has been added looktype: '".. lookType .. "' to the player: '".. target:getName() .."'")
		end
		return true
	else
		player:sendCancelMessage("Player not found.")
		return true
	end
	return false
end

addOutfit:separator(" ")
addOutfit:register()
