local configQuest = {
	["fogo"] = {
		itidCount = 3613,
		beginPos = Position(32748, 31488, 8),
		fromPos = Position(32737, 31489, 8),
		toPos = Position(32761, 31512, 8),
		effect = CONST_ME_HITBYFIRE,
		primeiroSqm = Position(32750, 31508, 8),
		segundoSqm = Position(32746, 31469, 8),
		stg90 = Storage.CultsOfTibia.Barkless.tar,
		msgs = {
			"As you enter the tar pits, you feel the heat around you rising dramatically. Survive the heat long enough to prove worthy.", -- ao entrar
			"Your body is heating up, the air around you is flickering.", -- 30/60 segundos
			"The heat is now unbearable, the blood in your body feels like lava. There's almost no strength left in you - act quickly!", -- 90 segundos
			"Embrace the stigma of bad fortune. The tar does not feel so hot anymore. You passed the tar trial.", -- pisar no primeiro piso
			"Your body reacts to this strange green substance as you reach out to touch it. You feel an urge for more of this energy.", -- pisar no segundo
			"The tar covering you has cooled down and tell off for the most part. Your body is not heated up anymore.", -- nao da tempo de pisar
		}
	},
	["acido"] = {
		itidCount = 4417,
		beginPos = Position(32693, 31478, 8),
		fromPos = Position(32647, 31479, 8),
		toPos = Position(32710, 31519, 8),
		effect = CONST_ME_YELLOW_RINGS,
		primeiroSqm = Position(32680, 31485, 8),
		segundoSqm = Position(32664, 31504, 8),
		stg90 = Storage.CultsOfTibia.Barkless.sulphur,
		msgs = {
			"As you enter the sulphur pits, you feel the dry, burning vapours of the sulphur all around you. Prove worthy, survive the acid.", -- ao entrar
			"The sulphur is burning your skin. You almost feel your body melting away in acid.", -- 30/60 segundos
			"The acid burning is now unbearable, you skin feels like a sieve. There's almost no strength left in you - act quickly!", -- 90 segundos
			"Embrace the stigma of vanity. The sulphur does not burn your skin anymore. You passed the trial.", -- pisar no primeiro piso
			"You are now ready to prove your worth. Take heart and cross the threshold of sulphur.", -- pisar no segundo
			"The acid covering you has cooled down and tell off for the most part. Your body is not heated up anymore.", -- nao da tempo de pisar
		}
	},
}

function sendConditionCults(playerid, _type, fromPos, toPos, tempo)
	local player = Player(playerid)
	if not player or not player:getPosition():isInRange(fromPos, toPos) then
		return false
	end
	local inf = configQuest[_type]
	tempo = tempo + 2
	if tempo == 30 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, inf.msgs[2])
	elseif tempo == 60 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, inf.msgs[2])
	elseif tempo >= 90 then
		local stg = player:getStorageValue(inf.stg90) < 0 and 0 or player:getStorageValue(inf.stg90)
		if stg < 3 and stg ~= 1 and stg ~= 2 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, inf.msgs[3])
			player:setStorageValue(inf.stg90, 1)
		end
	end
	player:getPosition():sendMagicEffect(inf.effect)
	addEvent(sendConditionCults, 2000, playerid, _type, fromPos, toPos, tempo)
end

function passagemPiso1Piso2(playerid, info, tempo)
	local player = Player(playerid)
	if not player then
		return true
	end
	local stg = player:getStorageValue(info.stg90) < 0 and 0 or player:getStorageValue(info.stg90)
	if tempo == 0 and stg < 3 then
		player:setStorageValue(info.stg90, 0)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, info.msgs[6])
		return true
	end
	if stg == 3 then
		return true
	end
	addEvent(passagemPiso1Piso2, 1000, playerid, info, tempo - 1)
end

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	for _, pid in pairs(configQuest)do
		if item:getId() == pid.itidCount and fromPosition:compare(pid.beginPos) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, pid.msgs[1])
			sendConditionCults(player:getId(), _, pid.fromPos, pid.toPos, 0)
			return true
		elseif position:compare(pid.primeiroSqm) and player:getStorageValue(pid.stg90) == 1 then
			if player:getStorageValue(pid.stg90) ~= 1 then
				return true
			end
			player:setStorageValue(pid.stg90, 2)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, pid.msgs[4])
			passagemPiso1Piso2(player:getId(), pid, 60)
		elseif position:compare(pid.segundoSqm) then
			if player:getStorageValue(pid.stg90) == 2 then
				player:setStorageValue(pid.stg90, 3)
				if player:getStorageValue(Storage.CultsOfTibia.Barkless.sulphur) == 3 and player:getStorageValue(Storage.CultsOfTibia.Barkless.tar) == 3 then
					player:setStorageValue(Storage.CultsOfTibia.Barkless.Mission, 2)
				end
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, pid.msgs[5])
			end
		end
	end
	return true
end
function onStepOut(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if item:getActionId() == 5531 then
		if fromPosition.x == 32736 then
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			if player:getStorageValue(Storage.CultsOfTibia.Barkless.tar) < 3 then
				player:teleportTo(Position(32737, 31451, 8), true)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not ready yet.")
				return false
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You traverse the tar unharmed.")
		end
	end
	if item:getActionId() == 5530 then
		if fromPosition.x == 32717 then
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			if player:getStorageValue(Storage.CultsOfTibia.Barkless.sulphur) < 3 then
				player:teleportTo(Position(32718, 31444, 8), true)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not ready yet.")
				return false
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You traverse the sulphur unharmed.")
		end
	end
	return true
end
