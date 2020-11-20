local serverInfo = TalkAction("!serverinfo")

function serverInfo.onSay(player, words, param)
	local configRateSkill = 3
	local lootRate = 2;
	local magicRate = 1.5;

	if (configManager.getNumber(configKeys.RATE_SKILL) > 3) then
		configRateSkill = 6;
	end

	if (configManager.getNumber(configKeys.RATE_LOOT) > 2) then
		lootRate = 4;
	end

	if (configManager.getNumber(configKeys.RATE_MAGIC) > 2) then
		magicRate = 3;
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Server Info:"
	.. "\nExp rate: " .. getRateFromTable(experienceStages, player:getLevel(), configManager.getNumber(configKeys.RATE_EXP))
	.. "\nSkill rate: " .. configRateSkill
	.. "\nMagic rate: " .. magicRate
	.. "\nLoot rate: " .. lootRate)
	return false
end

serverInfo:separator(" ")
serverInfo:register()
