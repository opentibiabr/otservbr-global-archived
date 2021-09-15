-- /addons playername

local addons = TalkAction("/addons")
local looktypes = {

	-- Female Outfits
	136, 137, 138, 139, 140, 141, 142, 147, 148, 149, 150, 155, 156, 157, 158, 252, 269, 270, 279, 288,
	324, 329, 336, 366, 436, 438, 478, 480, 596, 513, 514, 542, 575, 578, 618, 620, 632, 635, 636, 664,
	666, 683, 694, 696, 698, 870, 732, 745, 749, 759, 845, 852, 1082, 885, 1109, 1118, 1161, 1188, 1190, 1195,
	1210, 1212, 1214, 1216, 1218, 1220, 1265, 1269, 1288, 1295, 1302, 1315, 1340, 1348, 1373, 1392, 1407, 1419, 1432,
	1448, 1624, 1626, 1630, 1663, 1665, 1671, 1742, 1751, 1754, 1776, 1780, 1810, 1819, 1826, 1934, 1945, 1947,
	
	-- Male Outfits
	128, 129, 130, 131, 132, 133, 134, 143, 144, 145, 146, 151, 152, 153, 154, 251, 268, 273, 278, 289,
	325, 328, 335, 367, 435, 437, 477, 479, 597, 512, 516, 541, 574, 577, 610, 619, 633, 634, 637, 665,
	667, 684, 695, 697, 699, 725, 733, 746, 750, 760, 846, 853, 1081, 884, 1108, 1117, 1163, 1187, 1189, 1194,
	1196, 1211, 1213, 1215, 1217, 1219, 1266, 1268, 1287, 1296, 1301, 1314, 168, 1347, 1372, 1391, 1406,	1418, 1431,
	1447, 1449, 1625, 1629, 1662, 1664, 1670, 1741, 1750, 1753, 1775, 1779, 1809, 1818, 1825, 1933, 1944, 1946 
}

function addons.onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local target
	if param == '' then
		target = player:getTarget()
		if not target then
			player:sendTextMessage(MESSAGE_ATTENTION, 'Gives players the ability to wear all addons. Usage: /addons <player name>')
			return false
		end
	else
		target = Player(param)
	end

	if not target then
		player:sendTextMessage(MESSAGE_ATTENTION, 'Player ' .. param .. ' is currently not online.')
		return false
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD  then
		player:sendTextMessage(MESSAGE_ATTENTION, 'Cannot perform action.')
		return false
	end

	for i = 1, #looktypes do
		target:addOutfitAddon(looktypes[i], 3)
	end

	player:sendTextMessage(MESSAGE_ATTENTION, 'All addons unlocked for ' .. target:getName() .. '.')
	target:sendTextMessage(MESSAGE_ATTENTION, 'All of your addons have been unlocked!')
	return false
end

addons:separator(" ")
addons:register()