--[[ 
gray beach vortex

go to gray beach
]]
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
local positionGo = Position(33456, 31346, 8)

	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(positionGo)
	targetPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dive into the vortex to swim below the rocks to the other side of the cave.')
	return true
end

moveevent:position({x=32201,y=31977,z=8})
moveevent:register()

-- back of gray beach to edron
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
local positionBack = Position(33199, 31978, 8)

	local player = creature:getPlayer()
	if not player then
		return true
	end
	
	player:teleportTo(positionBack)
	targetPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dive into the vortex to swim below the rocks to the other side of the cave.')
	return true
end

moveevent:position({x=33456,y=31346,z=8})
moveevent:register()