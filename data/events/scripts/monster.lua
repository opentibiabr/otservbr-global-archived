function Monster:onDropLoot(corpse)
	if configManager.getNumber(configKeys.RATE_LOOT) == 0 then
		return
	end

	local mType = self:getType()
	if mType:isRewardBoss() then
		corpse:registerReward()
		return
	end

	local player = Player(corpse:getCorpseOwner())
	local autolooted = ""
	
	if not player or player:getStamina() > 840 then
		local monsterLoot = mType:getLoot()
		for i = 1, #monsterLoot do
			local item = corpse:createLootItem(monsterLoot[i])
			if item < 0 then
				print('[Warning] DropLoot:', 'Could not add loot item to corpse. itemId: '..monsterLoot[i].itemId)
			else
				-- autoloot
				if item > 0 then
					local tmpItem = Item(item)
					if player and player:getAutoLootItem(tmpItem:getId()) and configManager.getNumber(configKeys.AUTOLOOT_MODE) == 1 then
						if tmpItem:moveTo(player) then
							autolooted = string.format("%s, %s", autolooted, tmpItem:getNameDescription())
						end
					end
				end
			end
		end

		if player then
			local text = ("Loot of %s: "):format(mType:getNameDescription())
			-- autoloot
			local lootMsg = corpse:getContentDescription()
			if autolooted ~= "" and corpse:getContentDescription() == "nothing" then
				lootMsg = autolooted:gsub(",", "", 1) .. " that was autolooted"
			elseif autolooted ~= "" then
				lootMsg = corpse:getContentDescription() .. " and " .. autolooted:gsub(",", "", 1) .. " was auto looted"
			end
			text = string.format("%s%s", text, lootMsg)

			local party = player:getParty()
			if party then
				if autolooted ~= "" then
					text = string.format("%s by %s", text, player:getName())
				end
				party:broadcastPartyLoot(text)
			else
				player:sendTextMessage(MESSAGE_LOOT, text)
			end
		end
	else
		local text = ("Loot of %s: nothing (due to low stamina)"):format(mType:getNameDescription())
		local party = player:getParty()
		if party then
			party:broadcastPartyLoot(text)
		else
			player:sendTextMessage(MESSAGE_LOOT, text)
		end
	end

	if configManager.getNumber(configKeys.AUTOLOOT_MODE) == 2 then
		corpse:setActionId(500)
	end
end

function Monster:onSpawn(position)
	if self:getType():isRewardBoss() then
		self:setReward(true)
	end

	if not self:getType():canSpawn(position) then
		self:remove()
	else
		local spec = Game.getSpectators(position, false, false)
		for _, pid in pairs(spec) do
			local monster = Monster(pid)
			if monster and not monster:getType():canSpawn(position) then
				monster:remove()
			end
		end

		if self:getName():lower() == 'iron servant replica' then
			local chance = math.random(100)
			if Game.getStorageValue(GlobalStorage.ForgottenKnowledge.MechanismDiamond) >= 1 and Game.getStorageValue(GlobalStorage.ForgottenKnowledge.MechanismGolden) >= 1 then
				if chance > 30 then
					local chance2 = math.random(2)
					if chance2 == 1 then
						Game.createMonster('diamond servant replica', self:getPosition(), false, true)
					elseif chance2 == 2 then
						Game.createMonster('golden servant replica', self:getPosition(), false, true)
					end
					self:remove()
				end
				return true
			end
			if Game.getStorageValue(GlobalStorage.ForgottenKnowledge.MechanismDiamond) >= 1 then
				if chance > 30 then
					Game.createMonster('diamond servant replica', self:getPosition(), false, true)
					self:remove()
				end
			end
			if Game.getStorageValue(GlobalStorage.ForgottenKnowledge.MechanismGolden) >= 1 then
				if chance > 30 then
					Game.createMonster('golden servant replica', self:getPosition(), false, true)
					self:remove()
				end
			end
			return true
		end
	end
end
