local boss = {
	[540] = "fury of the emperor",
	[541] = "wrath of the emperor",
	[542] = "scorn of the emperor",
	[543] = "spite of the emperor",
}

local wrathEmperorMiss10Message = Action()
function wrathEmperorMiss10Message.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if boss[target.uid] and target.itemid == 11427 then
		target:transform(10797)
		Game.createMonster(boss[target.uid], {x = toPosition.x + 4, y = toPosition.y, z = toPosition.z})
		Game.setStorageValue(target.uid - 4, 1)
	elseif target.itemid == 11361 then
		if toPosition.x > 28273 and toPosition.x < 28318 and
			toPosition.y > 471 and toPosition.y < 2150 then
			if player:getStorageValue(Storage.WrathoftheEmperor.BossStatus) == 1 then
				player:setStorageValue(Storage.WrathoftheEmperor.BossStatus, 2)
				player:setStorageValue(Storage.WrathoftheEmperor.Mission10, 3) --Questlog, Wrath of the Emperor "Mission 10: A Message of Freedom"
				player:say("The sceptre is almost torn from your hand as you banish the presence of the emperor.", TALKTYPE_MONSTER_SAY)
			end
		elseif toPosition.x > 28327 and toPosition.x < 28358 and
			toPosition.y > 471 and toPosition.y < 2143 then
			if player:getStorageValue(Storage.WrathoftheEmperor.BossStatus) == 2 then
				player:setStorageValue(Storage.WrathoftheEmperor.BossStatus, 3)
				player:setStorageValue(Storage.WrathoftheEmperor.Mission10, 4) --Questlog, Wrath of the Emperor "Mission 10: A Message of Freedom"
				player:say("The sceptre is almost torn from your hand as you banish the presence of the emperor.", TALKTYPE_MONSTER_SAY)
			end
		elseif toPosition.x > 28325 and toPosition.x < 28359 and
			toPosition.y > 2470 and toPosition.y < 2561 then
			if player:getStorageValue(Storage.WrathoftheEmperor.BossStatus) == 3 then
				player:setStorageValue(Storage.WrathoftheEmperor.BossStatus, 4)
				player:setStorageValue(Storage.WrathoftheEmperor.Mission10, 5) --Questlog, Wrath of the Emperor "Mission 10: A Message of Freedom"
				player:say("The sceptre is almost torn from your hand as you banish the presence of the emperor.", TALKTYPE_MONSTER_SAY)
			end
		elseif toPosition.x > 28274 and toPosition.x < 28316 and
			toPosition.y > 2479 and toPosition.y < 2561 then
			if player:getStorageValue(Storage.WrathoftheEmperor.BossStatus) == 4 then
				player:setStorageValue(Storage.WrathoftheEmperor.BossStatus, 5)
				player:setStorageValue(Storage.WrathoftheEmperor.Mission10, 6) --Questlog, Wrath of the Emperor "Mission 10: A Message of Freedom"
				player:say("The sceptre is almost torn from your hand as you banish the presence of the emperor.", TALKTYPE_MONSTER_SAY)
				local destination = Position(33072, 31151, 15)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:teleportTo(destination)
				destination:sendMagicEffect(CONST_ME_TELEPORT)
			end
		end
	elseif target.itemid == 11429 then
		if player:getStorageValue(Storage.WrathoftheEmperor.Questline) == 31 then
			player:setStorageValue(Storage.WrathoftheEmperor.Questline, 32)
			player:setStorageValue(Storage.WrathoftheEmperor.Mission11, 2) --Questlog, Wrath of the Emperor "Mission 11: Payback Time"
		end
			player:say("NOOOoooooooo...!", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			player:say("This should have dealt the deathblow to the snake things' ambitions.", TALKTYPE_MONSTER_SAY)
	end
	return true
end

wrathEmperorMiss10Message:id(11362)
wrathEmperorMiss10Message:register()