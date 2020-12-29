local today = os.date("*t").wday
local todayLabel = os.date("%A")

local positionByDay = {
	[1] = Position(32328, 31782, 6), -- Sunday
	[2] = Position(32207, 31155, 7), -- Monday
	[3] = Position(32300, 32837, 7), -- Tuesday
	[4] = Position(32577, 32753, 7), -- Wednesday
	[5] = Position(33066, 32879, 6), -- Thursday
	[6] = Position(33235, 32483, 7), -- Friday
	[7] = Position(33166, 31810, 6)  -- Saturday
}

local rashidSpawnOnStartup = GlobalEvent("rashidSpawnOnStartup")
function rashidSpawnOnStartup.onStartup()

	if positionByDay[today] then
		local rashid = Game.createNpc("Rashid", positionByDay[today])
		rashid:setMasterPos(positionByDay[today])
		rashid:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		print(">> Rashid arrived at " .. todayLabel .. "s destination.")
	else
		print("[!] -> Cannot create Rashid. Day: " .. todayLabel .. ".")
	end

	return true

end
rashidSpawnOnStartup:register()

local rashidSpawnOnTime = GlobalEvent("rashidSpawnOnTime")
function rashidSpawnOnTime.onTime(interval)

	local rashidTarget = Npc("Rashid")
	if rashidTarget then
		print(">> Rashid is traveling to " .. todayLabel .. "s location.")
		rashidTarget:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		rashidTarget:teleportTo(positionByDay[today])
		rashidTarget:setMasterPos(positionByDay[today])
		rashidTarget:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end

	return true

end
rashidSpawnOnTime:time("07:00:00")
rashidSpawnOnTime:register()
