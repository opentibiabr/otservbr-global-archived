local setting = {
	--Carlin
	[7063] = {position = Position(32192, 31419, 2), storage = 10017}, --ice
	[7064] = {position = Position(32972, 32227, 7), storage = 10017}, --earth
	[7065] = {position = Position(32911, 32336, 15), storage = 10017}, --fire
	[7066] = {position = Position(33059, 32716, 5), storage = 10017}, --electric
	--Thais
	[7066] = {position = Position(32192, 31419, 2), storage = 10018}, --ice
	[906] = {position = Position(32972, 32227, 7), storage = 10018}, --earth
	[653] = {position = Position(32911, 32336, 15), storage = 10018}, --fire
	[654] = {position = Position(33059, 32716, 5), storage = 10018}, --electric
	--Venore
	[655] = {position = Position(32192, 31419, 2), storage = 10019}, --ice
	[110] = {position = Position(32972, 32227, 7), storage = 10019}, --earth
	[138] = {position = Position(32911, 32336, 15), storage = 10019}, --fire
	[3573] = {position = Position(33059, 32716, 5), storage = 10019}, --electric
	--Ab"Dendriel
	[140] = {position = Position(32192, 31419, 2), storage = 10020}, --ice
	[3991] = {position = Position(32972, 32227, 7), storage = 10020}, --earth
	[144] = {position = Position(32911, 32336, 15), storage = 10020}, --fire
	[5025] = {position = Position(33059, 32716, 5), storage = 10020}, --electric
	--Kazodron
	[5026] = {position = Position(32192, 31419, 2), storage = 10021 }, --ice
	[5027] = {position = Position(32972, 32227, 7), storage = 10021}, --earth
	[5028] = {position = Position(32911, 32336, 15), storage = 10021}, --fire
	[5029] = {position = Position(33059, 32716, 5), storage = 10021}, --electric
	--Darashia
	[5030] = {position = Position(32192, 31419, 2), storage = 10022}, --ice
	[5031] = {position = Position(32972, 32227, 7), storage = 10022}, --earth
	[5032] = {position = Position(32911, 32336, 15), storage = 10022}, --fire
	[5033] = {position = Position(33059, 32716, 5), storage = 10022}, --electric
	--Ankrahmun
	[5034] = {position = Position(32192, 31419, 2), storage = 10023}, --ice
	[5035] = {position = Position(32972, 32227, 7), storage = 10023}, --earth
	[5036] = {position = Position(32911, 32336, 15), storage = 10023}, --fire
	[5037] = {position = Position(33059, 32716, 5), storage = 10023}, --electric
	--Edron
	[5038] = {position = Position(32192, 31419, 2), storage = 10024}, --ice
	[5039] = {position = Position(32972, 32227, 7), storage = 10024}, --earth
	[5040] = {position = Position(32911, 32336, 15), storage = 10024}, --fire
	[5041] = {position = Position(33059, 32716, 5), storage = 10024}, --electric
	--Liberty Bay
	[5042] = {position = Position(32192, 31419, 2), storage = 10025}, --ice
	[5043] = {position = Position(32972, 32227, 7), storage = 10025}, --earth
	[5044] = {position = Position(32911, 32336, 15), storage = 10025}, --fire
	[5401] = {position = Position(33059, 32716, 5), storage = 10025}, --electric
	--Port Hope
	[5402] = {position = Position(32192, 31419, 2), storage = 10026}, --ice
	[5403] = {position = Position(32972, 32227, 7), storage = 10026}, --earth
	[5798] = {position = Position(32911, 32336, 15), storage = 10026}, --fire
	[8853] = {position = Position(33059, 32716, 5), storage = 10026}, --electric
	--Svargrond
	[5939] = {position = Position(32192, 31419, 2), storage = 10027}, --ice
	[8193] = {position = Position(32972, 32227, 7), storage = 10027}, --earth
	[8194] = {position = Position(32911, 32336, 15), storage = 10027}, --fire
	[8195] = {position = Position(33059, 32716, 5), storage = 10027}, --electric
	--Yalahar
	[8196] = {position = Position(32192, 31419, 2), storage = 10028}, --ice
	[8197] = {position = Position(32972, 32227, 7), storage = 10028}, --earth
	[8198] = {position = Position(32911, 32336, 15), storage = 10028}, --fire
	[8199] = {position = Position(33059, 32716, 5), storage = 10028}, --electric
	--Oramond
	[8200] = {position = Position(32192, 31419, 2), storage = 10029}, --ice
	[8201] = {position = Position(32972, 32227, 7), storage = 10029}, --earth
	[8202] = {position = Position(32911, 32336, 15), storage = 10029}, --fire
	[8203] = {position = Position(33059, 32716, 5), storage = 10029} --electric
}

local shrineEntrance = MoveEvent()

function shrineEntrance.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local portal = setting[item.uid]
	if not portal or player:getLevel() < 30 then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("Only players of level 30 or higher may enter this portal.", TALKTYPE_MONSTER_SAY)
		return true
	end

	player:teleportTo(portal.position)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(portal.storage, 1)
	return true
end

shrineEntrance:type("stepin")

for index, value in pairs(setting) do
	shrineEntrance:uid(index)
end

shrineEntrance:register()
