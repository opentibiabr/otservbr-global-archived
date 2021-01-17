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

	local today = os.date("*t").wday

	if positionByDay[today] then
		local rashid = Game.createNpc("rashid", positionByDay[today])
		rashid:setMasterPos(positionByDay[today])
		rashid:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		print(">> Rashid arrived at " .. os.date("%A") .. "s destination.")
	else
		print("[!] -> Cannot create Rashid. Day: " .. os.date("%A") .. ".")
	end

	return true

end
rashidSpawnOnStartup:register()

local rashidSpawnOnTime = GlobalEvent("rashidSpawnOnTime")
function rashidSpawnOnTime.onTime(interval)

	local today = os.date("*t").wday

	local rashidTarget = Npc("rashid")

	if rashidTarget then
		print(">> Rashid is traveling to " .. os.date("%A") .. "s location.")
		rashidTarget:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		rashidTarget:teleportTo(positionByDay[today])
		rashidTarget:setMasterPos(positionByDay[today])
		rashidTarget:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end

	return true

end
rashidSpawnOnTime:time("00:01")
rashidSpawnOnTime:register()
