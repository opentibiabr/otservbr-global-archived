
local config = {
	days = 7,
	maxDays = 365,
	price = 10000
}

local buyPremium = TalkAction("!buypremium")

function buyPremium.onSay(player, words, param)
	if configManager.getBoolean(configKeys.FREE_PREMIUM) then
		return true
	end

	if player:getPremiumDays() <= config.maxDays then
		if player:removeMoneyNpc(config.price) then
			player:addPremiumDays(config.days)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have bought " .. config.days .." days of premium account.")
			-- Add lastday column time for otclient
			db.query("UPDATE `accounts` SET `lastday` = ".. os.time() .." WHERE `id` = " .. player:getAccountId())
		else
			player:sendCancelMessage("You don't have enough money, " .. config.maxDays .. " days premium account costs " .. config.price .. " gold coins.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
		end
	else
		player:sendCancelMessage("You can not buy more than " .. config.maxDays .. " days of premium account.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return false
end

buyPremium:register()
