local function revertItem(toPosition, getItemId, itemTransform)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(getItemId)
		if thing then
			thing:transform(itemTransform)
		end
	end
end

local config = {
	[23400] = {itemGerator = 23405, itemTransform = 23400}, -- Gerator 1
	[23401] = {itemGerator = 23406, itemTransform = 23401}, -- Gerator 2
	[23402] = {itemGerator = 23407, itemTransform = 23402}, -- Gerator 3
}

local theAncientSewers = Action()

function theAncientSewers.onUse(player, item, fromPosition, itemEx, toPosition)
	if item.itemid == 23403 then
		revertItem(toPosition, 23409, 23403) -- Revert Valvula
	end

	local gerator = config[item.itemid]
	if gerator then
		local chance = math.random(1, 100)
		if((chance >= 1) and (chance < 50)) then
			player:say("<clong!> <clong!> There This piece fixed.", TALKTYPE_ORANGE_1)
		elseif((chance >= 50) and (chance < 100)) then
			player:say("<clong!> <clong!> <scrit scrit scrit>This should do it.", TALKTYPE_ORANGE_1)
		end

		item:transform(gerator.itemGerator)
		addEvent(revertItem, 60 * 60 * 1000, toPosition, gerator.itemGerator, gerator.itemTransform)
		toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
		if getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) <= 0 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,1)
			setPlayerStorageValue(cid, Storage.Oramond.MissionToTakeRoots1)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 1 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,2)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 2 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,3)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 3 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,4)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 4 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,5)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 5 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,6)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 6 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,7)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 7 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,8)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 8 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,9)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 9 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,10)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 10 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,11)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 11 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,12)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 12 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,13)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 13 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,14)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 14 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,15)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 15 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,16)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 16 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,17)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 17 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,18)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 18 then
			setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,19)
		elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 19 then
			setPlayerStorageValue(cid, Storage.DarkTrails.Mission03,1)
		end
	end
	return true
end

theAncientSewers:id(23400,23401,23402,23403)
theAncientSewers:register()
