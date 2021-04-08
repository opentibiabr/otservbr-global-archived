local rune = Spell("rune")

function rune.onCastSpell(player, variant)
	local position = variant:getPosition()
	local tile = Tile(position)
	if tile then
		local corpse = tile:getTopDownItem()
		if corpse then
			local itemType = corpse:getType()
			if itemType:isCorpse() and itemType:isMovable() then
				if #player:getSummons() < 2 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 99 then
					local summon = Game.createMonster("Skeleton", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 2 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 149 then
					local summon = Game.createMonster("Demon Skeleton", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end	
				elseif #player:getSummons() < 2 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 199 then
					local summon = Game.createMonster("Bonebeast", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 2 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 249 then
					local summon = Game.createMonster("Lich", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 2 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 299 then
					local summon = Game.createMonster("Undead Gladiator", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 2 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 349 then
					local summon = Game.createMonster("Vampire Bride", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 2 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 399 then
					local summon = Game.createMonster("Vicious Manbat", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 2 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 449 then
					local summon = Game.createMonster("Skeleton Elite Warrior", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 2 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 499 then
					local summon = Game.createMonster("Undead Elite Gladiator", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 2 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 549 then
					local summon = Game.createMonster("Undead Dragon", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 2 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 599 then
					local summon = Game.createMonster("Demon", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 1 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 699 then
					local summon = Game.createMonster("Hellflayer", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 1 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 799 then
					local summon = Game.createMonster("Mr. Punish", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 1 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 899 then
					local summon = Game.createMonster("Courage Leech", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 1 and player:getSkull() ~= SKULL_BLACK and player:getLevel() <= 999 then
					local summon = Game.createMonster("Zulazza the Corruptor", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end
				elseif #player:getSummons() < 1 and player:getSkull() ~= SKULL_BLACK and player:getLevel() >= 1000 then
					local summon = Game.createMonster("Distorted Phantom", position, true, true)
					if summon then
						corpse:remove()
						player:addSummon(summon)
						summon:reload()
						position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
						return true
					end					
				else
					player:sendCancelMessage("You cannot control more creatures.")
					player:getPosition():sendMagicEffect(CONST_ME_POFF)
					return false
				end
			end
		end
	end

	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
	return false
end

rune:group("support")
rune:id(83)
rune:name("Animate Dead")
rune:runeId(2316)
rune:allowFarUse(true)
rune:charges(1)
rune:level(27)
rune:magicLevel(4)
rune:cooldown(2 * 1000)
rune:groupCooldown(2 * 1000)
rune:isBlocking(true) -- True = Solid / False = Creature
rune:register()