function sendConditionCults2(playerid, inf, fromPos, toPos, fromPos2, toPos2, tempo)
	local player = Player(playerid)
	if not player then
		return false
	end
	-- if ( not player:getPosition():isInRange(fromPos2, toPos2) ) then
		if (not player:getPosition():isInRange(fromPos, toPos)) then
			broadcastMessage('aqui1')
			return true
		end
	-- end

	tempo = tempo + 2
	if tempo == 30 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, inf.msgs[2])
	elseif tempo == 60 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, inf.msgs[2])
	elseif tempo == 90 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, inf.msgs[2])
	elseif tempo >= 120 then
		local stg = player:getStorageValue(inf.stg90) < 0 and 0 or player:getStorageValue(inf.stg90)
		if stg < 3 and stg ~= 1 and stg ~= 2 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, inf.msgs[3])
			player:setStorageValue(inf.stg90, 1)
		end
	end
	player:getPosition():sendMagicEffect(inf.effect)
	addEvent(sendConditionCults2, 2000, playerid, inf, fromPos, toPos, fromPos2, toPos2, tempo)
end

function passagemPiso1Piso22(playerid, info, tempo)
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
	addEvent(passagemPiso1Piso22, 1000, playerid, info, tempo - 1)
end

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	local _type = {
		fromPos = Position(32677, 31393, 8),
		-- toPos = Position(32724, 31430, 8),
		toPos = Position(32722, 31440, 8),
		fromPos2 = Position(32696, 31429, 8),
		toPos2 = Position(32728, 31435, 8),
		effect = CONST_ME_GIANTICE,
		primeiroSqm = Position(32698, 31405, 8),
		-- segundoSqm = Position(32664, 31504, 8),
		stg90 = Storage.CultsOfTibia.Barkless.ice,
		msgs = {
			"As you enter the icy cavern, you feel an unnatural frostiness. The ice cold air stings in your face. Survive and prove worthy.", -- ao entrar
			"Your body temperature sinks. You can see your breath freezing in the cold.", -- 30/60 segundos
			"The icy cold is grasping to you. You can barely move anymore.", -- 120 segundos
			"You are now washed and ready to purify yourself in the chambers of purification.", -- pisar no primeiro piso
			"You are now ready to prove your worth. Take heart and cross the threshold of ice.", -- pisar no segundo
			"You took so long. You are no longer purified.", -- nao da tempo de pisar
		}
	}
	if fromPosition.y == 31441 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, _type.msgs[1])
		sendConditionCults2(player:getId(), _type, _type.fromPos, _type.toPos, _type.fromPos2, _type.toPos2, 0)
		return true
	end

	if item:getPosition():compare(_type.primeiroSqm) then
		if player:getStorageValue(_type.stg90) ~= 1 then
			return true
		end
		player:setStorageValue(_type.stg90, 2)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, _type.msgs[4])
		passagemPiso1Piso22(player:getId(), _type, 60)
		return true
	end

	if fromPosition.y == 31439 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A bit of warmth returns to your body as you leave the icy cavern.")
		return true
	end
	return true
end
