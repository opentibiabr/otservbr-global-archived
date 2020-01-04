local action = Action()

function action.onUse(player, item, fromPosition, target, isHotkey)

local config ={
		"OreWagon1", "OreWagon2", "OreWagon3", "OreWagon4", "OreWagon5", "OreWagon6", "OreWagon7", "OreWagon8", "OreWagon9", "OreWagon10", "OreWagon11", "OreWagon12", "OreWagon13", "OreWagon14", "OreWagon15", "OreWagon16", "OreWagon17", "OreWagon18", "OreWagon19", "OreWagon20", "OreWagon21", "OreWagon22", "OreWagon23", "OreWagon24", "OreWagon25", "OreWagon26", "OreWagon27", "OreWagon28", "OreWagon29", "OreWagon30", "OreWagon31", "OreWagon32", "OreWagon33", "OreWagon34", "OreWagon35", "OreWagon36", "OreWagon37", "OreWagon38"}
		
	if item.uid < 5528 and player:getStorageValue(Storage.wagonTicket) < os.time() then
		player:say("Purchase a weekly ticket from Gewen, Lokur in the post office, The Lukosch brothers or from Brodrosch on the steamboat.", TALKTYPE_MONSTER_SAY)
		return true
	end
	
	for wagons, key in pairs(config) do
	local setting = GlobalConfig[key]
		if (setting.uniqueId == item.uid) then
			player:addAchievementProgress('Rollercoaster', 100)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(setting.destination)
			setting.destination:sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
	return true
end

for uids = 6013,6050 do
action:uid(uids)
end
action:register()
