

local lantern = Action()


local condition = Condition(CONDITION_HEX)
	condition:setParameter(CONDITION_PARAM_TICKS, -1)
	condition:setParameter(CONDITION_PARAM_SUBID, 1095)
	condition:setParameter(CONDITION_PARAM_BUFF_HEALINGRECEIVED, 40)
	condition:setParameter(CONDITION_PARAM_BUFF_DAMAGEDEALT, 40)
	condition:setParameter(CONDITION_PARAM_HEALTHREDUCTIONPERCENT, 60)

function lantern.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player:getCondition(CONDITION_HEX, CONDITIONID_COMBAT, 1095) then
		player:sendCancelMessage("You are not in fight with the pale worm.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end
	local chances = math.random(1, 100)
	player:removeCondition(CONDITION_HEX, CONDITIONID_COMBAT, 1095)
	if chances <= 20 then
		item:remove()
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your soulforged lantern has burned out and dissipates into nothingness!")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your soulforged lantern has cleansed the taint of the worm!")
	end
	player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	
	return true
end

lantern:id(37426)

lantern:register()