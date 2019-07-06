Prey = {
	Developer = "Initial credits to Cjaker and rewritten by Westwol",
	Version = "4.0",
	LastUpdate = "23/07/2017 - 10:58 (AM)",
}

CONST_SLOT_FIRST = 0
CONST_SLOT_SECOND = 1
CONST_SLOT_THIRD = 2

CONST_MONSTER_TIER_BRONZE = 0
CONST_MONSTER_TIER_SILVER = 1
CONST_MONSTER_TIER_GOLD = 2
CONST_MONSTER_TIER_GOLD = 3
CONST_MONSTER_TIER_PLATINUM = 4

Prey.Config = {
	initialSlots = 2
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

Prey.C_Packets = {
	RequestData = 0xED,
	PreyAction = 0xEB
}

Prey.Slots = {
	[CONST_SLOT_FIRST] = {state = 48000, bonus = 48001},
	[CONST_SLOT_SECOND] = {state = 48002, bonus = 48003},
	[CONST_SLOT_THIRD] = {state = 48004, bonus = 48005}
}

local monsterList = {
	[CONST_MONSTER_TIER_BRONZE] = {"Rat", "Rotworm", "Cave Rat", "Orc", "Dwarf", "Ghoul", "Minotaur", "Fire Elemental", "Earth Elemental"},
	[CONST_MONSTER_TIER_SILVER] = {"Pirate Ghost", "Elder Wyrm", "Orclops Doomhauler", "Giant Spider", "Lizard Zaogun", "Nightmare"}, 
	[CONST_MONSTER_TIER_GOLD] = {"Quara Pincher", "Quara Predator", "Ogre Brute", "Minotaur Amazon", "Guzzlemaw", "Grim Reaper"},
	[CONST_MONSTER_TIER_PLATINUM] = {"Demon", "Plaguesmith", "Defiler", "Destroyer"}
}

function onRecvbyte(player, msg, byte)
	if (byte == Prey.C_Packets.RequestData) then
		player:sendPreyData(CONST_SLOT_FIRST)
		player:sendPreyData(CONST_SLOT_SECOND)
		player:sendPreyData(CONST_SLOT_THIRD)
	elseif (byte == Prey.C_Packets.PreyAction) then
		print("TODO: Prey action")
	end
end

function Player.getMonsterTier(self)
	local tier = CONST_MONSTER_TIER_BRONZE
	if (self:getLevel() > 0 and self:getLevel() < 50) then
		tier = CONST_MONSTER_TIER_BRONZE
	elseif (self:getLevel() >= 50 and self:getLevel() < 100) then
		tier = CONST_MONSTER_TIER_SILVER
	elseif (self:getLevel() >= 100 and self:getLevel() < 150) then
		tier = CONST_MONSTER_TIER_GOLD
	elseif (self:getLevel() >= 150) then
		tier = CONST_MONSTER_TIER_PLATINUM
	end
	return tier
end

function Player.setInitialSlots(self)
	self:setStorageValue(Prey.Slots[CONST_SLOT_FIRST].state, Prey.StateTypes.SELECTION_CHANGE_MONSTER)
	self:setStorageValue(Prey.Slots[CONST_SLOT_SECOND].state, Prey.StateTypes.SELECTION_CHANGE_MONSTER)
	self:setStorageValue(Prey.Slots[CONST_SLOT_THIRD].state, Prey.StateTypes.LOCKED)
end

function Player.getSlotState(self, slot)
	if (Prey.Slots[slot]) then
		if (table.contains({CONST_SLOT_FIRST, CONST_SLOT_SECOND, CONST_SLOT_THIRD}, slot) and self:getStorageValue(Prey.Slots[slot].state) < 0) then
			self:setInitialSlots()
		end
		return self:getStorageValue(Prey.Slots[slot].state)
	end
end

function Player.sendResource(self, resourceType, value)
	local typeByte = 0
	if (resourceType == "bank") then
		typeByte = 0x00
	elseif (resourceType == "inventory") then
		typeByte = 0x01
	elseif (resourceType == "prey") then
		typeByte = 0x0A
	end

	local msg = NetworkMessage()
	msg:addByte(0xEE)
	msg:addByte(typeByte)
	msg:addU64(value)
	msg:sendToPlayer(self)
end

function Player.createMonsterList(self)
	local monsters = {}
	while #monsters ~= 3 do
		local randomMonster = monsterList[self:getMonsterTier()][math.random(#monsterList[self:getMonsterTier()])]
		-- Verify that monster actually exists
		if (MonsterType(randomMonster) and not table.contains(monsters, randomMonster)) then
			monsters[#monsters + 1] = randomMonster
		end
	end
	return monsters
end

function Player.sendPreyData(self, slot)
	if not slot then
		print("[PREY]: " .. slot .. " was not found")
	end

	local slotState = self:getSlotState(slot)	
	if (slot == 2) then
		slotState = Prey.StateTypes.ACTIVE
	end

	local msg = NetworkMessage()
	msg:addByte(Prey.S_Packets.PreyData) -- packet header
	msg:addByte(slot) -- slot number
	msg:addByte(slotState) -- slot state
	
	-- This slot will preserve the same bonus and % but the monster might be changed
	if (slotState == Prey.StateTypes.SELECTION_CHANGE_MONSTER) then
		print("Slot: " .. slot .. " | State: SELECTION_CHANGE_MONSTER ")

		-- This values have to be stored on each slot
		msg:addByte(0) -- Type
		msg:addU16(20) -- Value
		msg:addByte(1) -- 1~10 Grade

		-- Gather monsterList at this point
		-- TODO: store player MonsterList on each slot
		local monsterList = self:createMonsterList()
		msg:addByte(#monsterList)
		for k, monster in ipairs(monsterList) do
			local tmpMonster = MonsterType(monster)
			if tmpMonster then
				msg:addString(monster)
				msg:addU16(136) -- looktype
				msg:addByte(100)
				msg:addByte(100)
				msg:addByte(100)
				msg:addByte(100)
				msg:addByte(100)
			end
		end

	-- This slot will have a new monsterList and a random bonus
	elseif(slotState == Prey.StateTypes.SELECTION) then
		print("Slot: " .. slot .. " | State: SELECTION ")

		local monsterList = self:createMonsterList()
		msg:addByte(#monsterList)
		for k, monster in ipairs(monsterList) do
			local tmpMonster = MonsterType(monster)
			if tmpMonster then
				msg:addString(monster)
				msg:addU16(136) -- looktype
				msg:addByte(100)
				msg:addByte(100)
				msg:addByte(100)
				msg:addByte(100)
				msg:addByte(100)
			end
		end

	-- This slot is active and will show current monster and bonus
	elseif (slotState == Prey.StateTypes.ACTIVE) then

		-- TODO: get monster name, prey bonus, from each slot
		local monster = MonsterType("Demon"):getOutfit()
		msg:addString("Demon")
		msg:addU16(monster.lookType)
		msg:addByte(0)
		msg:addByte(0)
		msg:addByte(0)
		msg:addByte(0)
		msg:addByte(0)
		msg:addByte(0) -- Type
		msg:addU16(10) -- Value
		msg:addByte(1) -- 1~10 Grade
		msg:addU16(os.time() + 3000) -- Time Left Bonus
	
	-- This slot is inactive and will not take any extra bytes
	elseif (slotState == Prey.StateTypes.INACTIVE) then

		
	elseif (slotState == Prey.StateTypes.LOCKED) then
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
