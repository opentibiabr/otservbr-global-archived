local carpetItems = {
	[22737] = 22736, --rift carpet
	[22736] = 22737, --rift carpet
	[23537] = 23536, --void carpet
	[23536] = 23537, --void carpet
	[23431] = 23453, --yalahahari carpet
	[23453] = 23431, --yalahahari carpet
	[23432] = 23454, --white fur carpet
	[23454] = 23432, --white fur carpet
	[23433] = 23455, --bamboo mat carpet
	[23455] = 23433, --bamboo matr carpet
	[23715] = 23707, --crimson carpet
	[23707] = 23715, --crimson carpet
	[23710] = 23716, --azure carpet
	[23716] = 23710, --azure carpet
	[23711] = 23717, --emerald carpet
	[23717] = 23711, --emerald carpet
	[23712] = 23718, --light parquet carpet
	[23718] = 23712, --light parquet carpet
	[23713] = 23719, --dark parquet carpet
	[23719] = 23713, --dark parquet carpet
	[23714] = 23720, --mable floor
	[23720] = 23714, --marble floor
	[24416] = 24424, --flowery carpet
	[24424] = 24416, --flowery carpet
	[24417] = 24425, --Colourful Carpet
	[24425] = 24417, --Colourful Carpet
	[24418] = 24426, --striped carpet
	[24426] = 24418, --striped carpet
	[24419] = 24427, --fur carpet
	[24427] = 24419, --fur carpet
	[24420] = 24428, --diamond carpet
	[24428] = 24420, --diamond carpet
	[24421] = 24429, --patterned carpet
	[24429] = 24421, --patterned carpet
	[24422] = 24430, --night sky carpet
	[24430] = 24422, --night sky carpet
	[24423] = 24431, --star carpet
	[24431] = 24423, --star carpet
	[26114] = 26115, --verdant carpet
	[26115] = 26114, --verdant carpet
	[26116] = 26117, --shaggy carpet
	[26117] = 26116, --shaggy carpet
	[26119] = 26118, --mystic carpet
	[26118] = 26119, --mystic carpet
	[26120] = 26121, --stone tile
	[26121] = 26120, --stone tile
	[26123] = 26122, --wooden plank
	[26122] = 26123, --wooden plank
	[26150] = 26151, --wheat carpet
	[26151] = 26150, --wheat carpet
	[26152] = 26153, --crested carpet
	[26153] = 26152, --crested carpet
	[26154] = 26155, --decorated carpet
	[26155] = 26154, --decorated carpet
	[31466] = 31468, --tournament carpet
	[31468] = 31466, --tournament carpet
	[31467] = 31469, --sublime tournament carpet
	[31469] = 31467, --sublime tournament carpet
	[35941] = 35942, --grandiose carpet
	[35942] = 35941, --grandiose carpet
}

local carpets = Action()

function carpets.onUse(player, item, fp, target, toPosition, isHotkey)
	local carpet = carpetItems[item.itemid]
	if not carpet then
		return false
	end

	local fromPosition = item:getPosition()
	local tile = Tile(fromPosition)
	if not fromPosition:getTile():getHouse() then
		player:sendTextMessage(MESSAGE_FAILURE, "You may use this only inside a house.")
	elseif tile:getItemCountById(item.itemid) == 1 then
		for k,v in pairs(carpetItems) do
			if tile:getItemCountById(k) > 0 and k ~= item.itemid then
				player:sendCancelMessage(Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
				return true
			end
		end
		item:transform(carpet)
	end
	return true
end

for index, value in pairs(carpetItems) do
	carpets:id(index)
end

carpets:register()
