-- vines (temple of equilibrium)
local action = Action()

function action.onUse(player, item, target, position, toPosition, isHotkey)

	local teleportName ={
		"VinesDown",
		"VinesUp"
		}
		
	for k, key in pairs(teleportName) do
	local setting = GlobalConfig[key]
		if item.uid == 5002 then
			player:teleportTo(setting.destination)
			setting.destination:sendMagicEffect(CONST_ME_POFF)
			player:say("The slippery vines barely hold your weight and you rather slide than climb down.", TALKTYPE_MONSTER_SAY)
		elseif item.uid == 5003 then
			player:say("The vines are too slippery down here to climb them.", TALKTYPE_MONSTER_SAY)
			setting.destination:sendMagicEffect(CONST_ME_SMALLPLANTS)
		end
		return true
	end
end

action:uid(5002,5003)
action:register()

-- boats teleport
local action = Action()

function action.onUse(player, item, fromPosition, itemEx, toPosition)

	local config ={
		"BoatFarmine1",
		"BoatFarmine2",
		"BoatFarmine3",
		"BoatFarmine4",
		"BoatFarmine5"
	}

	for k, key in pairs(config) do
	local setting = GlobalConfig[key]
	   if (setting.uniqueId == item.uid) then
			player:teleportTo(setting.destination)
			setting.destination:sendMagicEffect(CONST_ME_POFF)
			fromPosition:sendMagicEffect(CONST_ME_POFF)
		end
	end
	return true
end

for uids = 5004,5008 do
action:uid(uids)
end
action:register()

-- farmine lever/elevator
local action = Action() 

function action.onUse(player, item, fromPosition, itemEx, toPosition)

	local config ={"FromFlyingCarpet", "ToFlyingCarpet", "ElevatorToFarmine", "FarmineStage3", "FarmineStage2", "FarmineStage1"}
	for k, key in pairs(config) do
	local setting = GlobalConfig[key] 
		if item.itemid == 2772 then
			if Tile(setting.playerPos):getTopCreature() and setting.uniqueId == item.uid then
				if player:getStorageValue(Storage.TheNewFrontier.Mission05) == 7 then -- if Farmine is on Stage 3
					player:teleportTo(setting.destination)
				elseif player:getStorageValue(Storage.TheNewFrontier.Mission03) >= 2 then -- if Farmine is on Stage 2
					player:teleportTo(setting.destination)
				elseif player:getStorageValue(Storage.TheNewFrontier.Mission03) < 2 then -- if Farmine is on Stage 1
					player:teleportTo(setting.destination)
				end
				item:transform(item.itemid+1)
				player:teleportTo(setting.destination)
				setting.destination:sendMagicEffect(CONST_ME_TELEPORT)
				fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
			else
			end
		elseif setting.uniqueId == item.uid and item.itemid == 2773 then
			item:transform(item.itemid-1)
		end
	end
	return true
end

for uids = 5009,5014 do
action:uid(uids)
end
action:register()