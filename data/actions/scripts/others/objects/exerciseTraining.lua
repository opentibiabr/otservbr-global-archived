-- Test Gentebra v0.0.9

-- 0 a 30		|	20,00%
-- 31 a 40		|	11,00%
-- 41 a 50		|	7,00%
-- 51 a 60		|	1,50%
-- 61 a 70		|	1,00%
-- 71 a 80		|	0,30%
-- 81 a 90		|	0,18%
-- 91 a 100		|	0,04%
-- 101 a 110	|	0,02%
-- 111+			|	0,01%

-- by RochaSJK

local skills = {
	[32384] = {id=SKILL_SWORD,voc=4},
	[32385] = {id=SKILL_AXE,voc=4},
	[32386] = {id=SKILL_CLUB,voc=4},
	[32387] = {id=SKILL_DISTANCE,voc=3,range=CONST_ANI_SIMPLEARROW},
	[32388] = {id=SKILL_MAGLEVEL,voc=2,range=CONST_ANI_ENERGY},
	[32389] = {id=SKILL_MAGLEVEL,voc=1,range=CONST_ANI_FIRE},

}

------- CONFIG -----//
local dummies = {32142,32147,32148,32143,32144,32145,32146,32149}
--local skill_gain = 1 -- per hit

local function start_train(pid,start_pos,itemid,fpos)
	local player = Player(pid)
	if player ~= nil then
		local pos_n = player:getPosition()

		if start_pos:getDistance(pos_n) == 0 and getTilePzInfo(pos_n) then
			if player:getItemCount(itemid) >= 1 then
				local exercise = player:getItemById(itemid,true)

				if exercise:isItem() then
					if exercise:hasAttribute(ITEM_ATTRIBUTE_CHARGES) then
						local charges_n = exercise:getAttribute(ITEM_ATTRIBUTE_CHARGES)

						if charges_n >= 1 then
							exercise:setAttribute(ITEM_ATTRIBUTE_CHARGES, (charges_n-1))

							local required = 0
							local toadd = 0
							local currently = 0
							local voc = player:getVocation()
								if skills[itemid].id == SKILL_MAGLEVEL then
									if(isInArray({1,2,5,6}, voc:getId())) then
											if player:getBaseMagicLevel() < 30 then
												required = voc:getRequiredManaSpent(player:getBaseMagicLevel() + 1)
												player:addManaSpent(0.0033*required)
											elseif player:getBaseMagicLevel() >= 30 and player:getBaseMagicLevel() < 40 then
												required = voc:getRequiredManaSpent(player:getBaseMagicLevel() + 1)
												player:addManaSpent(0.0033*required)
											elseif player:getBaseMagicLevel() >= 40 and player:getBaseMagicLevel() < 50 then
												required = voc:getRequiredManaSpent(player:getBaseMagicLevel() + 1)
												player:addManaSpent(0.0033*required)
											elseif player:getBaseMagicLevel() >= 50 and player:getBaseMagicLevel() < 60 then
												required = voc:getRequiredManaSpent(player:getBaseMagicLevel() + 1)
												player:addManaSpent(0.0033*required)
											elseif player:getBaseMagicLevel() >= 60 and player:getBaseMagicLevel() < 70 then
												required = voc:getRequiredManaSpent(player:getBaseMagicLevel() + 1)
												player:addManaSpent(0.00033*required)
											elseif player:getBaseMagicLevel() >= 70 and player:getBaseMagicLevel() < 80 then
												required = voc:getRequiredManaSpent(player:getBaseMagicLevel() + 1)
												player:addManaSpent(0.00033*required)
											elseif player:getBaseMagicLevel() >= 80 and player:getBaseMagicLevel() < 90 then
												required = voc:getRequiredManaSpent(player:getBaseMagicLevel() + 1)
												player:addManaSpent(0.00033*required)
											elseif player:getBaseMagicLevel() >= 90 and player:getBaseMagicLevel() < 100 then
												required = voc:getRequiredManaSpent(player:getBaseMagicLevel() + 1)
												player:addManaSpent(0.00033*required)
											elseif player:getBaseMagicLevel() >= 100 and player:getBaseMagicLevel() < 110 then
												required = voc:getRequiredManaSpent(player:getBaseMagicLevel() + 1)
												player:addManaSpent(0.000033*required)
											elseif player:getBaseMagicLevel() >= 110 then
												required = voc:getRequiredManaSpent(player:getBaseMagicLevel() + 1)
												player:addManaSpent(0.000033*required)
											end
									else

									end
								else
									if(isInArray({3,4,7,8}, voc:getId())) then
										if player:getSkillLevel(skills[itemid].id) < 30 then
										required = voc:getRequiredSkillTries(skills[itemid].id, player:getSkillLevel(skills[itemid].id)+1)
										player:addSkillTries(skills[itemid].id, (0.0033*required))
										elseif player:getSkillLevel(skills[itemid].id) >= 30 and player:getSkillLevel(skills[itemid].id) < 40 then
										required = voc:getRequiredSkillTries(skills[itemid].id, player:getSkillLevel(skills[itemid].id)+1)
										player:addSkillTries(skills[itemid].id, (0.0033*required))
										elseif player:getSkillLevel(skills[itemid].id) >= 40 and player:getSkillLevel(skills[itemid].id) < 50 then
										required = voc:getRequiredSkillTries(skills[itemid].id, player:getSkillLevel(skills[itemid].id)+1)
										player:addSkillTries(skills[itemid].id, (0.0033*required))
										elseif player:getSkillLevel(skills[itemid].id) >= 50 and player:getSkillLevel(skills[itemid].id) < 60 then
										required = voc:getRequiredSkillTries(skills[itemid].id, player:getSkillLevel(skills[itemid].id)+1)
										player:addSkillTries(skills[itemid].id, (0.0033*required))
										elseif player:getSkillLevel(skills[itemid].id) >= 60 and player:getSkillLevel(skills[itemid].id) < 70 then
										required = voc:getRequiredSkillTries(skills[itemid].id, player:getSkillLevel(skills[itemid].id)+1)
										player:addSkillTries(skills[itemid].id, (0.00033*required))
										elseif player:getSkillLevel(skills[itemid].id) >= 70 and player:getSkillLevel(skills[itemid].id) < 80 then
										required = voc:getRequiredSkillTries(skills[itemid].id, player:getSkillLevel(skills[itemid].id)+1)
										player:addSkillTries(skills[itemid].id, (0.00033*required))
										elseif player:getSkillLevel(skills[itemid].id) >= 80 and player:getSkillLevel(skills[itemid].id) < 90 then
										required = voc:getRequiredSkillTries(skills[itemid].id, player:getSkillLevel(skills[itemid].id)+1)
										player:addSkillTries(skills[itemid].id, (0.00033*required))
										elseif player:getSkillLevel(skills[itemid].id) >= 90 and player:getSkillLevel(skills[itemid].id) < 100 then
										required = voc:getRequiredSkillTries(skills[itemid].id, player:getSkillLevel(skills[itemid].id)+1)
										player:addSkillTries(skills[itemid].id, (0.00033*required))
										elseif player:getSkillLevel(skills[itemid].id) >= 100 and player:getSkillLevel(skills[itemid].id) < 110 then
										required = voc:getRequiredSkillTries(skills[itemid].id, player:getSkillLevel(skills[itemid].id)+1)
										player:addSkillTries(skills[itemid].id, (0.000033*required))
										elseif player:getSkillLevel(skills[itemid].id) >= 110 then
										required = voc:getRequiredSkillTries(skills[itemid].id, player:getSkillLevel(skills[itemid].id)+1)
										player:addSkillTries(skills[itemid].id, (0.000033*required))
										end
									end
							end

							fpos:sendMagicEffect(CONST_ME_HITAREA)
							if skills[itemid].range then
								pos_n:sendDistanceEffect(fpos, skills[itemid].range)
							end

						    if charges_n == 1 then
								exercise:remove(1)
								return true
						    end
							local training = addEvent(start_train, voc:getAttackSpeed(), pid,start_pos,itemid,fpos)
						else
							exercise:remove(1)
							player:setStorageValue(Storage.Exercisedummy.exaust, 0)
							stopEvent(training)
						end
					end
				end
			end
		else
		player:setStorageValue(Storage.Exercisedummy.exaust, 0)
			stopEvent(training)
		end
	else
	player:setStorageValue(Storage.Exercisedummy.exaust, 0)
		stopEvent(training)
	end
		return true
end



function onUse(player, item, fromPosition, target, toPosition, isHotkey)




	if (player:getStorageValue(Storage.Exercisedummy.exaust) == 1) then
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You are already using this item.")
		stopEvent(training)
	return true
end






	local start_pos = player:getPosition()
	stopEvent(training) -- to prevent from multiple uses

	player:setStorageValue(Storage.Exercisedummy.exaust, 0)

	if target:isItem() then
	stopEvent(training)


		if isInArray(dummies,target:getId()) then
			if not skills[item.itemid].range and (start_pos:getDistance(target:getPosition()) > 1) then
				stopEvent(training)

	player:setStorageValue(Storage.Exercisedummy.exaust, 0)
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You need to be closer to dummy to use this item.")
				return false
			end


--			if (skills[item.itemid].voc ~= player:getVocation():getId()) or ((skills[item.itemid].voc + 4) ~= player:getVocation():getId()) then
			if(isInArray({1,2,5,6}, player:getVocation():getId())) and skills[item.itemid].id ~= SKILL_MAGLEVEL then
				stopEvent(training)
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your vocation can't use this exercise item.")
				return false
			elseif(isInArray({3,7}, player:getVocation():getId())) and skills[item.itemid].id ~= SKILL_DISTANCE then
				stopEvent(training)
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your vocation can't use this exercise item.")
				return false
			elseif(isInArray({4,8}, player:getVocation():getId())) and ((skills[item.itemid].id ~= SKILL_SWORD) and (skills[item.itemid].id ~= SKILL_CLUB) and (skills[item.itemid].id ~= SKILL_AXE)) then
				stopEvent(training)
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your vocation can't use this exercise item.")
				return false
			end

	player:setStorageValue(Storage.Exercisedummy.exaust, 1)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You started training.")
		start_train(player:getId(),start_pos,item.itemid,target:getPosition())
		end
	end

	return true
end
