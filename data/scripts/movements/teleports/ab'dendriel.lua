-- ab'dendriel teleports
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
	
	local config ={"Teleport2", "Teleport3", "Teleport4", "Teleport5", "Teleport6", "Teleport7"}
	
	local player = creature:getPlayer()
	if not player then
		return false
	end
	
	for k, key in pairs(config) do
	local setting = GlobalConfig[key] 
		if setting.uniqueId == item.uid then
			player:teleportTo(setting.destination)
			position:sendMagicEffect(CONST_ME_POFF)
			return true
		end
	end
end

for uids = 5002,5007 do
moveevent:uid(uids)
end
moveevent:register()

-- ab'dendriel teleports
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
	local exitPosition = Position(32308, 32267, 7)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getVocation():getBase():getId() == 1 then
		return true
	end

	player:teleportTo(exitPosition)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	return true
end

moveevent:position({x=32300,y=32267,z=7})
moveevent:position({x=32300,y=32268,z=7})
moveevent:register()