local config = {
	{newPosition = Position(31985, 32851, 14)},
	{pos = Position(31986, 32840, 14), monster = 'a shielded astral glyph'},
	{pos = Position(31975, 32856, 15), monster = 'bound astral power'},
	{pos = Position(31987, 32839, 14), monster = 'the astral source'},
	{pos = Position(31986, 32823, 15), monster = 'the distorted astral source'},
	{pos = Position(31989, 32823, 15), monster = 'an astral glyph'}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9825 then
		if player:getPosition() ~= Position(32019, 32844, 14) then
			item:transform(9826)
			return true
		end
	end
	if item.itemid == 9825 then
		if Game.getStorageValue(GlobalStorage.ForgottenKnowledge.LastLoreTimer) >= 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait a while, recently someone challenge The Last Lore Keeper.")
			return true
		end
		for xx = 14, 15 do
		local spectators = Game.getSpectators(Position(31986, 32846, xx), false, false, 21, 21, 21, 21)
			for i = 1, #spectators do
				spec = spectators[i]
				if spec:isPlayer() then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting with The Last Lore Keeper.")
					return true
				end
			end	
		end
		for x = 32018, 32020 do
			for y = 32844, 32848 do
				local playerTile = Tile(Position(x, y, 14)):getTopCreature()
				if playerTile and playerTile:isPlayer() then
					playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
					playerTile:teleportTo(config[1].newPosition)
					playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					playerTile:setExhaustion(Storage.ForgottenKnowledge.LastLoreTimer, 20 * 24 * 60 * 60)
				end
			end
		end
		--[[local creatures = Tile(config[1].newPosition):getCreatures()
		for i = 1, #creatures do
			local player = creatures[i]
			if player:isPlayer() then
				player:setExhaustion(Storage.ForgottenKnowledge.LastLoreTimer, 14 * 24 * 60 * 60 * 1000)
			end
		end]]
		for b = 2, #config do
			Game.createMonster(config[b].monster, config[b].pos, true, true)
		end
		Game.setStorageValue(GlobalStorage.ForgottenKnowledge.AstralPowerCounter, 1)
		Game.setStorageValue(GlobalStorage.ForgottenKnowledge.AstralGlyph, 0)
		player:say('The Astral Glyph begins to draw upon bound astral power to expel you from the room!', TALKTYPE_MONSTER_SAY)
		Game.setStorageValue(GlobalStorage.ForgottenKnowledge.LastLoreTimer, 1)
		addEvent(clearForgotten, 30 * 60 * 1000, Position(31968, 32821, 14), Position(32004, 32865, 15), Position(32035, 32859, 14), GlobalStorage.ForgottenKnowledge.LastLoreTimer)
		item:transform(9826)
		elseif item.itemid == 9826 then
		item:transform(9825)
	end
	return true
end
		
		
		
		