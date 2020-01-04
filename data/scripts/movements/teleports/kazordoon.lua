-- the spike entrance
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = Uniques.KazordoonTeleports[item.uid]
	if not teleport then
		return true
	end
	if teleport then
		if isPremium() == FALSE then
			player:teleportTo(fromPosition)
			player:sendCancelMessage("You need a premium account to access this area.")
			fromPosition:sendMagicEffect(CONST_ME_POFF)
		elseif isPremium() == TRUE then
			player:teleportTo(teleport.destination)
			item:getPosition():sendMagicEffect(CONST_ME_GREEN_RINGS)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
	return true
end

moveevent:uid(5087)
moveevent:register()

-- the spike teleports
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = Uniques.KazordoonTeleports[item.uid]
	if not teleport then
		return true
	end

	
	if player:getLevel() >= teleport.levelMin and player:getLevel() <= teleport.levelMax then 
			player:teleportTo(teleport.destination)
			position:sendMagicEffect(CONST_ME_TELEPORT)
			teleport.destination:sendMagicEffect(CONST_ME_TELEPORT)
			else
			player:teleportTo(fromPosition)
	end
return true
end

for uids = 5088,5104 do
moveevent:uid(uids)
end
moveevent:register()