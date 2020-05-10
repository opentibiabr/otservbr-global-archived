-- Lions rock entrance
local lionsRockEntrance = MoveEvent()

function lionsRockEntrance.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end

	if player:getStorageValue(setting.need) >= setting.needCount then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(setting.toPos)
		player:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			"You have passed the Lion's Tests and are now worthy to enter the inner sanctum!"
		)
		player:getPosition():sendMagicEffect(CONST_ME_THUNDER)
		return true
	else
		player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
		player:teleportTo(fromPosition)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to pass the Lion's Tests to enter the inner sanctum!")
		return false
	end
end

lionsRockEntrance:uid(24914)
lionsRockEntrance:register()

-- Lions rock sign
local lionsRockSigns = MoveEvent()

function lionsRockSigns.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end

	if player:getStorageValue(setting.need) >= setting.needCount and player:getStorageValue(setting.need) < 10 then
		if player:getStorageValue(setting.storage) < 0 then
			if player:getItemCount(setting.needItem) == 1 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, setting.message1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, setting.message2)
				player:setStorageValue(setting.need, player:getStorageValue(setting.need) + 1)
				player:setStorageValue(setting.storage, 1)
				return true
			end
		end
	end
	return true
end

for value = 24916, 24919 do
	lionsRockSigns:uid(value)
end

lionsRockSigns:register()
