Prey = {
	Credits = "System remake: Westwol ~ Packet logic: Cjaker ~  Formulas: slavidodo",
	Version = "4.0",
	LastUpdate = "07/07/19",
}

CONST_SLOT_FIRST = 0
CONST_SLOT_SECOND = 1
CONST_SLOT_THIRD = 2

CONST_MONSTER_TIER_BRONZE = 0
CONST_MONSTER_TIER_SILVER = 1
CONST_MONSTER_TIER_GOLD = 2
CONST_MONSTER_TIER_GOLD = 3
CONST_MONSTER_TIER_PLATINUM = 4

CONST_BONUS_DAMAGE_BOOST = 0
CONST_BONUS_DAMAGE_REDUCTION = 1
CONST_BONUS_XP_BONUS = 2
CONST_BONUS_IMPROVED_LOOT = 3

Prey.Config = {
	ListRerollPrice = 2000
}

Prey.S_Packets = {
	ShowDialog = 0xED,
	PreyRerollPrice = 0xE9,
	PreyData = 0xE8,
	PreyTimeLeft = 0xE7
}

Prey.StateTypes = {
	LOCKED = 0,
	INACTIVE = 1,
	ACTIVE = 2,
	SELECTION = 3,
	SELECTION_CHANGE_MONSTER = 4
}

Prey.UnlockTypes = {
	PREMIUM_OR_STORE = 0,
	STORE = 1,
	NONE = 2
}

Prey.Actions = {
	NEW_LIST = 0,
	NEW_BONUS = 1,
	SELECT = 2,
}

Prey.C_Packets = {
	RequestData = 0xED,
	PreyAction = 0xEB
}

Prey.Bonuses = {
	[CONST_BONUS_DAMAGE_BOOST] = {step = 2, min = 7, max = 25},
	[CONST_BONUS_DAMAGE_REDUCTION] = {step = 2, min = 12, max = 30},
	[CONST_BONUS_XP_BONUS] = {step = 3, min = 13, max = 40},
	[CONST_BONUS_IMPROVED_LOOT] = {step = 3, min = 13, max = 40}
}

Prey.MonsterList = {
	[CONST_MONSTER_TIER_BRONZE] = {
		"Rotworm", "Carrion Worm", "Skeleton", "Ghoul", "Cyclops", "Cyclops Drone", "Cyclops Smith", "Dark Magician",
		"Beholder", "Dragon", "Dragon Hatchling", "Dwarf", "Dwarf Guard", "Dwarf Geomancer", "Dwarf Soldier", "Earth Elemental",
		"Fire Elemental", "Gargoyle", "Merlkin", "Minotaur", "Minotaur Guard", "Minotaur Mage", "Minotaur Archer", "Nomad",
		"Amazon", "Hunter", "Orc", "Orc Berserker", "Orc Leader", "Orc Shaman", "Orc Spearman", "Orc Warlord", "Panda",
		"Rotworm Queen", "Tarantula", "Scarab", "Skeleton Warrior", "Smuggler"
	},
	[CONST_MONSTER_TIER_SILVER] = {
		 "Pirate Buccaneer", "Pirate Ghost", "Pirate Marauder", "Pirate Skeleton", "Dragon Lord Hatchling", "Frost Dragon Hatchling",
		"Behemoth", "Faun", "Dark Faun", "Dragon Lord", "Frost Dragon", "Hydra", "Hero", "Bullwark", "Giant Spider", "Crystal Spider",
		"Deepling Brawler", "Deepling Elite", "Deepling Guard", "Deepling Master Librarian", "Deepling Tyrant", "Deepling Warrior",
		"Wyrm", "Elder Wyrm", "Fleshslicer", "Frost Giant", "Ghastly Dragon", "Ice Golem", "Infernalist", "Warlock", "Lich",
		"Lizard Chosen", "Lizard Dragon Priest", "Lizard High Guard", "Lizard Legionnaire", "Lizard Zaogun", "Massive Energy Elemental",
		"Massive Fire Elemental", "Massive Water Elemental", "Minotaur Amazon", "Execowtioner", "Minotaur Hunter", "Mooh'Tah Warrior",
		"Mutated Bat", "Mutated Human", "Necromancer", "Nightmare", "Nightmare Scion", "Ogre Brute", "Ogre Savage", "Ogre Shaman",
		"Orclops Doomhauler", "Orclops Ravager", "Quara Constrictor", "Quara Constrictor Scout", "Quara Hydromancer", "Quara Mantassin",
		"Quara Pincher", "Quara Predator", "Sea Serpent", "Shaper Matriarch", "Silencer", "Spitter", "Worker Golem", "Werewolf",
		"Hellspawn", "Shadow Tentacle", "Vampire Bride", "Dragonling", "Shock Head", "Frazzlemaw",
	},
	[CONST_MONSTER_TIER_GOLD] = {
		"Plaguesmith", "Demon", "Crystal Spider", "Defiler", "Destroyer", "Diamond Servant", "Draken Elite",
		"Draken Spellweaver", "Draken Warmaster", "Draken Abomination", "Feversleep", "Terrorsleep", "Draptor",
		"Grim Reaper", "Guzzlemaw", "Hellfire Fighter", "Hand of Cursed Fate", "Hellhound", "Juggernaut",
		"Sparkion", "Dark Torturer", "Undead Dragon", "Retching Horror", "Choking Fear", "Choking Fear",
		"Shiversleep", "Sight Of Surrender", "Demon Outcast", "Blightwalker", "Grimeleech", "Vexclaw", "Grimeleech",
		"Dawnfire Asura", "Midnight Asura", "Frost Flower Asura", "True Dawnfire Asura", "True Frost Flower Asura",
		"True Midnight Asura"
	}
}

-- Communication functions
function Player.sendResource(self, resourceType, value)
	local typeByte = 0
	if resourceType == "bank" then
		typeByte = 0x00
	elseif resourceType == "inventory" then
		typeByte = 0x01
	elseif resourceType == "prey" then
		typeByte = 0x0A
	end
	local msg = NetworkMessage()
	msg:addByte(0xEE)
	msg:addByte(typeByte)
	msg:addU64(value)
	msg:sendToPlayer(self)
end

function Player.sendErrorDialog(self, error)
	local msg = NetworkMessage()
	msg:addByte(Prey.S_Packets.ShowDialog)
	msg:addByte(0x15)
	msg:addString(error)
	msg:sendToPlayer(self)
end

-- Core functions
function Player.setRandomBonusValue(self, slot, bonus, typeChange)
	local type = self:getPreyBonusType(slot)

	local min = Prey.Bonuses[type].min
	local max = Prey.Bonuses[type].max
	local step = Prey.Bonuses[type].step

	if bonus then
		if typeChange then
			self:setPreyBonusValue(slot, math.random(min, max))
		else
			local oldValue = self:getPreyBonusValue(slot)
			if (oldValue + step >= max) then
				self:setPreyBonusValue(slot, max)
			else
				while (self:getPreyBonusValue(slot) - oldValue < step) do
					self:setPreyBonusValue(slot, math.random(min, max))
				end
			end
		end
	else
		self:setPreyBonusValue(slot, math.random(min, max))
	end

	self:setPreyBonusGrade(slot, math.floor((self:getPreyBonusValue(slot) - min) / (max - min) * 10))   
	if (self:getPreyBonusGrade(slot) == 10 and self:getPreyBonusValue(slot) < max) then
		self:setPreyBonusGrade(slot, self:getPreyBonusGrade(slot) - 1)
	end
end

function Player.getMonsterTier(self)
	if self:getLevel() > 0 and self:getLevel() < 60 then
		return CONST_MONSTER_TIER_BRONZE
	elseif self:getLevel() >= 60 and self:getLevel() < 160 then
		return CONST_MONSTER_TIER_SILVER
	elseif self:getLevel() >= 160 then
		return CONST_MONSTER_TIER_GOLD
	end
end

-- TODO: do not repeat monsters between lists
function Player.createMonsterList(self)
	local monsters = {}
	while #monsters ~= 7 do
		local randomMonster = Prey.MonsterList[self:getMonsterTier()][math.random(#Prey.MonsterList[self:getMonsterTier()])]
		-- Verify that monster actually exists
		if MonsterType(randomMonster) and not table.contains(monsters, randomMonster) then
			monsters[#monsters + 1] = randomMonster
		end
	end
	return table.concat(monsters, ";")
end

function onRecvbyte(player, msg, byte)
	if (byte == Prey.C_Packets.RequestData) then
		player:sendPreyData(CONST_SLOT_FIRST)
		player:sendPreyData(CONST_SLOT_SECOND)
		player:sendPreyData(CONST_SLOT_THIRD)
	elseif (byte == Prey.C_Packets.PreyAction) then
		player:preyAction(msg)
	end
end

function Player.preyAction(self, msg)

	local slot = msg:getByte() 
	local action = msg:getByte() 

	if not slot then
		return self:sendErrorDialog("Sorry, there was an issue, please relog-in.")
	end

	-- Verify whether the slot is unlocked
	if (self:getPreyUnlocked(slot) ~= 1) then
		return self:sendErrorDialog("Sorry, you don't have this slot unlocked yet.")
	end
	
	-- Listreroll
	if (action == Prey.Actions.NEW_LIST) then

		-- Verifying state
		if (self:getPreyState(slot) ~= Prey.StateTypes.ACTIVE and self:getPreyState(slot) ~= Prey.StateTypes.SELECTION and self:getPreyState(slot) ~= Prey.StateTypes.SELECTION_CHANGE_MONSTER ) then
			return self:sendErrorDialog("This is slot is not even active.")
		end

		self:setPreyMonsterList(slot, self:createMonsterList())
		self:setPreyState(slot, Prey.StateTypes.SELECTION_CHANGE_MONSTER)

	-- Bonus reroll
	elseif (action == Prey.Actions.NEW_BONUS) then

		-- Verifying state
		if (self:getPreyState(slot) ~= Prey.StateTypes.ACTIVE) then
			return self:sendErrorDialog("This is slot is not even active.")
		end

		-- TODO: check for bonus rerolls
		local oldType = self:getPreyBonusType(slot)
		self:setPreyBonusType(slot, math.random(CONST_BONUS_DAMAGE_BOOST, CONST_BONUS_IMPROVED_LOOT))
		self:setRandomBonusValue(slot, true, (oldType ~= self:getPreyBonusType(slot) and true or false))

	-- Select monster from list
	elseif (action == Prey.Actions.SELECT) then

		local selectedMonster = msg:getByte() 
		local monsterList = self:getPreyMonsterList(slot):split(";")

		-- Verify if the monster exists.
		local monster = MonsterType(monsterList[selectedMonster + 1])
		if not monster then
			return self:sendPreyData(slot)
		end

		-- Verifying slot state
		if (self:getPreyState(slot) ~= Prey.StateTypes.SELECTION and self:getPreyState(slot) ~= Prey.StateTypes.SELECTION_CHANGE_MONSTER) then
			return self:sendErrorDialog("This slot can't select monsters.")
		end

		-- Proceeding to prey monster selection
		self:selectPreyMonster(slot, monsterList[selectedMonster + 1])
	end

	-- Perfom slot update
	return self:sendPreyData(slot)
end

function Player.selectPreyMonster(self, slot, monster)

	-- Verify if the monster exists.
	local monster = MonsterType(monster)
	if not monster then
		return self:sendPreyData(slot)
	end

	local msg = NetworkMessage()

	-- Only first/expired selection list gets new prey bonus
	if (self:getPreyState(slot) == Prey.StateTypes.SELECTION) then
		-- Generating random prey type
		self:setPreyBonusType(slot, math.random(CONST_BONUS_DAMAGE_BOOST, CONST_BONUS_IMPROVED_LOOT))
		-- Generating random bonus stats
		self:setRandomBonusValue(slot, false, false)
	end
	
	-- Setting current monster
	self:setPreyCurrentMonster(slot, monster:getName())
	-- Setting preySlot state
	self:setPreyState(slot, Prey.StateTypes.ACTIVE)
	-- Cleaning up monsterList
	self:setPreyMonsterList(slot, "")
	-- Time left
	self:setPreyTimeLeft(slot, 7200) -- 2 hours
	-- Next use
	self:setPreyNextUse(slot, 0)
end

function Player.sendPreyData(self, slot)
	if not slot then
		print("[PREY]: " .. slot .. " was not found")
	end

	local slotState = self:getPreyState(slot)	

	local msg = NetworkMessage()
	msg:addByte(Prey.S_Packets.PreyData) -- packet header
	msg:addByte(slot) -- slot number
	msg:addByte(slotState) -- slot state
	
	-- This slot will preserve the same bonus and % but the monster might be changed
	if slotState == Prey.StateTypes.SELECTION_CHANGE_MONSTER then
		print("Slot: " .. slot .. " | State: SELECTION_CHANGE_MONSTER ")

		-- This values have to be stored on each slot
		msg:addByte(0) -- Type
		msg:addU16(20) -- Value
		msg:addByte(1) -- 1~10 Grade

		-- MonsterList already exists in the slot
		local monsterList = self:getPreyMonsterList(slot):split(";")
		msg:addByte(#monsterList)
		for i = 1, #monsterList do
			local monster = MonsterType(monsterList[i])
			if monster then
				msg:addString(monster:getName())
				msg:addU16(monster:getOutfit().lookType or 21) 
				msg:addByte(monster:getOutfit().lookHead or 0x00) 
				msg:addByte(monster:getOutfit().lookBody or 0x00)
				msg:addByte(monster:getOutfit().lookLegs or 0x00)
				msg:addByte(monster:getOutfit().lookFeet or 0x00)
				msg:addByte(monster:getOutfit().lookAddons or 0x00)
			else
				print("[PREY]: SELECTION | Error while loading monster on slot: " .. slot)
				return true
			end
		end


	-- This slot will have a new monsterList and a random bonus
	elseif slotState == Prey.StateTypes.SELECTION then
		print("Slot: " .. slot .. " | State: SELECTION ")

		-- If list is empty, then we will create a new one and assign it to the monsterList or timeleft = 0
		local preyMonsterList = self:getPreyMonsterList(slot)
		if preyMonsterList == '' then
			self:setPreyMonsterList(slot, self:createMonsterList())
			-- Resending this preySlot as there was a change.
			return self:sendPreyData(slot)
		end

		local monsterList = preyMonsterList:split(";")
		msg:addByte(#monsterList)
		for i = 1, #monsterList do
			local monster = MonsterType(monsterList[i])
			if monster then
				msg:addString(monster:getName())
				msg:addU16(monster:getOutfit().lookType or 21) 
				msg:addByte(monster:getOutfit().lookHead or 0x00) 
				msg:addByte(monster:getOutfit().lookBody or 0x00)
				msg:addByte(monster:getOutfit().lookLegs or 0x00)
				msg:addByte(monster:getOutfit().lookFeet or 0x00)
				msg:addByte(monster:getOutfit().lookAddons or 0x00)
			else
				print("[PREY]: SELECTION | Error while loading monster on slot: " .. slot)
				return true
			end
		end
	
	-- This slot is active and will show current monster and bonus
	elseif slotState == Prey.StateTypes.ACTIVE then
		print("Slot: " .. slot .. " | State: ACTIVE ")
		-- Getting current monster
		local monster = MonsterType(self:getPreyCurrentMonster(slot))
		if monster then
			msg:addString(monster:getName())
			msg:addU16(monster:getOutfit().lookType or 21) 
			msg:addByte(monster:getOutfit().lookHead or 0x00) 
			msg:addByte(monster:getOutfit().lookBody or 0x00)
			msg:addByte(monster:getOutfit().lookLegs or 0x00)
			msg:addByte(monster:getOutfit().lookFeet or 0x00)
			msg:addByte(monster:getOutfit().lookAddons or 0x00)
			msg:addByte(self:getPreyBonusType(slot)) 
			msg:addU16(self:getPreyBonusValue(slot))
			msg:addByte(self:getPreyBonusGrade(slot))
			msg:addU16(self:getPreyTimeLeft()) 
		else
			print("[PREY]: ACTIVE | Error while loading monster on slot: " .. slot)
			return true
		end

	-- This slot is inactive and will not take any extra bytes
	elseif slotState == Prey.StateTypes.INACTIVE then

		
	elseif slotState == Prey.StateTypes.LOCKED then
		print("Slot: " .. slot .. " | State: LOCKED ")
		msg.addByte(Prey.UnlockTypes.PREMIUM_OR_STORE) -- Store unlock method
	end
	

	-- Resources and times are always sent
	msg:addU16(os.time() + 200) -- next prey reroll here
	msg:addByte(0xEC)
	self:sendResource("prey", 3)
	self:sendResource("bank", 123)
	self:sendResource("inventory", 2424)

	-- Sending message to client
	msg:sendToPlayer(self)

end
