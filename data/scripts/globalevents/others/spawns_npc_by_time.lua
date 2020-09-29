local spawns = {
	-- spawnByType day / night
	[1] = {		nameAdd = "ghostly_wolf",	nameRem = "Ghostly Wolf",		spawnByType =  "night",		position = { x = 33332, y = 32052, z = 7 }	}
}

local function typeTimeInverter(typeTime)
	if (typeTime == "night") then
		return "day"
	else 
		return "night"
	end
end

local function addNpcs(tablename, typeTime)
	for index, value in pairs(tablename) do
		if value.nameAdd and value.position and value.spawnByType == typeTime then
			local spawn = Game.createNpc(value.nameAdd, value.position)
			if spawn then
				print("> NPC "..value.nameAdd.."  Added!")
				spawn:setMasterPos(value.position)
				spawn:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			end
		end
	end
end

local function removerNpcs(tablename, typeTime)
	for index, value in pairs(tablename) do
		if value.nameRem and value.position and value.spawnByType == typeTime then
			local target = Npc(value.nameRem)
			if target then
				print("> NPC "..value.nameRem.."  Removed!")
				target:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				return target:remove()
			end
		end
	end
end

local nowType = "night"
local spawnsByTime = GlobalEvent("spawnsByTime")
function spawnsByTime.onThink(interval, lastExecution)
	local time = getWorldTime()
	local light = getWorldLight()
	local dayOrNight = getTibiaTimerDayOrNight()

	if (nowType ~= dayOrNight) then
		print("Now is ".. dayOrNight ..", Light "..light.." and Tibia Time "..getFormattedWorldTime(time).." (".. time ..").")
		removerNpcs(spawns, typeTimeInverter(dayOrNight)) -- Remove
		addNpcs(spawns, dayOrNight) -- Add
		nowType = dayOrNight -- Change flag controller
	end
	return true
end

spawnsByTime:interval(60000)
spawnsByTime:register()
