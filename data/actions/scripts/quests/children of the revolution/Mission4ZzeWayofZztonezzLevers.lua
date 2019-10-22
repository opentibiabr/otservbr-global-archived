local leverChange = {
	[1] = {1, 3, 2, 4},
	[2] = {2, 1, 3, 4},
	[3] = {2, 3, 1, 4},
	[4] = {3, 2, 4, 1},
	[5] = {4, 2, 1, 3}
}

local position = {
	[1] = {
		Position(33355, 31126, 7),
		Position(33356, 31126, 7),
		Position(33357, 31126, 7),
		Position(33358, 31126, 7)
	},
	[2] = {
		Position(33352, 31126, 5),
		Position(33353, 31126, 5),
		Position(33354, 31126, 5),
		Position(33355, 31126, 5)
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.actionid ~= 8013 then
		return false
	end

	if player:getStorageValue(Storage.ChildrenoftheRevolution.Questline) ~= 14 then
		player:say("The lever does not budge.", TALKTYPE_MONSTER_SAY)
		return true
	end

	local lever, tmp, ground = toPosition.y - 31122, {}
	for i = 1, #position[1] do
		ground = Tile(position[1][i]):getGround()
		if ground then
			tmp[i] = ground.itemid
		end
	end

	for i = 1, #position[2] do
		ground = Tile(position[2][i]):getGround()
		if ground then
			ground:transform(tmp[leverChange[lever][i]])
			ground:getPosition():sendMagicEffect(CONST_ME_POFF)
		end
	end

	local groundIds, pass = {10856, 10853, 10855, 10850}, 0
	for i = 1, #position[2] do
		ground = Tile(position[2][i]):getGround()
		if ground and ground.itemid == groundIds[i] then
			pass = pass + 1
		end
	end

	if pass ~= 4 then
		return true
	end

	player:setStorageValue(Storage.ChildrenoftheRevolution.Questline, 17)
	player:setStorageValue(Storage.ChildrenoftheRevolution.Mission04, 5) --Questlog, Children of the Revolution "Mission 4: Zze Way of Zztonezz"
	player:say("After a cracking noise a deep humming suddenly starts from somewhere below.", TALKTYPE_MONSTER_SAY)

	item:transform(item.itemid == 10044 and 10045 or 10044)
	return true
end
