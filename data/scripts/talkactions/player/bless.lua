function getCost(level)
	if level <= 30 then
		return 10000 * 3
	elseif level >= 120 then
		return 10000 * 8
	else
		return ((level - 20) * 200 * 7)
	end
end

local talk = TalkAction("!bless")

function talk.onSay(player, words, param)

	if not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) and (player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT))  then
		player:sendCancelMessage("You can't buy bless while in battle.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return
	end

	local blessCost = getCost(player:getLevel())
	local blessCount = {}
	for b = 1, 8 do
		if not player:hasBlessing(b) then
			table.insert(blessCount, b)
		end
	end
	if #blessCount == 0 then
		player:sendCancelMessage("You are already blessed.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return
	end
	if player:removeMoneyNpc(blessCost) then
		for i, v in ipairs(blessCount) do
			player:addBlessing(v, 1)
		end
		player:sendCancelMessage("You received the remaining " .. #blessCount .. " blesses for a total of " .. blessCost ..".")
		player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	else
		player:sendCancelMessage("You don't have enough money. You need " .. blessCost .. " to buy all blesses.", cid)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
end

talk:register()
