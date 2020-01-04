-- This script will be used to register functions

result.getDataInt = result.getNumber
result.getDataLong = result.getNumber
result.getDataString = result.getString
result.getDataStream = result.getStream

function createFunctions(class)
	local exclude = {[2] = {"is"}, [3] = {"get", "set", "add", "can"}, [4] = {"need"}}
	local temp = {}
	for name, func in pairs(class) do
		for strLen, strTable in pairs(exclude) do
			if not table.contains(strTable, name:sub(1,strLen)) then
				local str = name:sub(1,1):upper()..name:sub(2)
				local getFunc = function(self) return func(self) end
				local setFunc = function(self, ...) return func(self, ...) end
				local get = "get".. str
				local set = "set".. str
				table.insert(temp, {set, setFunc, get, getFunc})
			end
		end
	end
	for _,func in ipairs(temp) do
		rawset(class, func[1], func[2])
		rawset(class, func[3], func[4])
	end
end

do
	local function CreatureIndex(self, key)
		local methods = getmetatable(self)
		if key == "uid" then
			return methods.getId(self)
		elseif key == "type" then
			local creatureType = 0
			if methods.isPlayer(self) then
				creatureType = THING_TYPE_PLAYER
			elseif methods.isMonster(self) then
				creatureType = THING_TYPE_MONSTER
			elseif methods.isNpc(self) then
				creatureType = THING_TYPE_NPC
			end
			return creatureType
		elseif key == "itemid" then
			return 1
		elseif key == "actionid" then
			return 0
		end
		return methods[key]
	end
	rawgetmetatable("Player").__index = CreatureIndex
	rawgetmetatable("Monster").__index = CreatureIndex
	rawgetmetatable("Npc").__index = CreatureIndex
end

do
	local function ItemIndex(self, key)
		local methods = getmetatable(self)
		if key == "itemid" then
			return methods.getId(self)
		elseif key == "actionid" then
			return methods.getActionId(self)
		elseif key == "uid" then
			return methods.getUniqueId(self)
		elseif key == "type" then
			return methods.getSubType(self)
		end
		return methods[key]
	end
	rawgetmetatable("Item").__index = ItemIndex
	rawgetmetatable("Container").__index = ItemIndex
	rawgetmetatable("Teleport").__index = ItemIndex
end

do
	local function ActionNewIndex(self, key, value)
		if key == "onUse" then
			self:onUse(value)
			return
		end
		rawset(self, key, value)
	end
	rawgetmetatable("Action").__newindex = ActionNewIndex
end

do
	local function TalkActionNewIndex(self, key, value)
		if key == "onSay" then
			self:onSay(value)
			return
		end
		rawset(self, key, value)
	end
	rawgetmetatable("TalkAction").__newindex = TalkActionNewIndex
end

do
	local function CreatureEventNewIndex(self, key, value)
		if key == "onLogin" then
			self:type("login")
			self:onLogin(value)
			return
		elseif key == "onLogout" then
			self:type("logout")
			self:onLogout(value)
			return
		elseif key == "onThink" then
			self:type("think")
			self:onThink(value)
			return
		elseif key == "onPrepareDeath" then
			self:type("preparedeath")
			self:onPrepareDeath(value)
			return
		elseif key == "onDeath" then
			self:type("death")
			self:onDeath(value)
			return
		elseif key == "onKill" then
			self:type("kill")
			self:onKill(value)
			return
		elseif key == "onAdvance" then
			self:type("advance")
			self:onAdvance(value)
			return
		elseif key == "onModalWindow" then
			self:type("modalwindow")
			self:onModalWindow(value)
			return
		elseif key == "onTextEdit" then
			self:type("textedit")
			self:onTextEdit(value)
			return
		elseif key == "onHealthChange" then
			self:type("healthchange")
			self:onHealthChange(value)
			return
		elseif key == "onManaChange" then
			self:type("manachange")
			self:onManaChange(value)
			return
		elseif key == "onExtendedOpcode" then
			self:type("extendedopcode")
			self:onExtendedOpcode(value)
			return
		end
		rawset(self, key, value)
	end
	rawgetmetatable("CreatureEvent").__newindex = CreatureEventNewIndex
end

do
	local function MoveEventNewIndex(self, key, value)
		if key == "onEquip" then
			self:type("equip")
			self:onEquip(value)
			return
		elseif key == "onDeEquip" then
			self:type("deequip")
			self:onDeEquip(value)
			return
		elseif key == "onAddItem" then
			self:type("additem")
			self:onAddItem(value)
			return
		elseif key == "onRemoveItem" then
			self:type("removeitem")
			self:onRemoveItem(value)
			return
		elseif key == "onStepIn" then
			self:type("stepin")
			self:onStepIn(value)
			return
		elseif key == "onStepOut" then
			self:type("stepout")
			self:onStepOut(value)
			return
		end
		rawset(self, key, value)
	end
	rawgetmetatable("MoveEvent").__newindex = MoveEventNewIndex
end

do
	local function GlobalEventNewIndex(self, key, value)
		if key == "onThink" then
			self:onThink(value)
			return
		elseif key == "onTime" then
			self:onTime(value)
			return
		elseif key == "onStartup" then
			self:type("startup")
			self:onStartup(value)
			return
		elseif key == "onShutdown" then
			self:type("shutdown")
			self:onShutdown(value)
			return
		elseif key == "onRecord" then
			self:type("record")
			self:onRecord(value)
			return
		end
		rawset(self, key, value)
	end
	rawgetmetatable("GlobalEvent").__newindex = GlobalEventNewIndex
end

do
	local function WeaponNewIndex(self, key, value)
		if key == "onUseWeapon" then
			self:onUseWeapon(value)
			return
		end
		rawset(self, key, value)
	end
	rawgetmetatable("Weapon").__newindex = WeaponNewIndex
end

do
	local function SpellNewIndex(self, key, value)
		if key == "onCastSpell" then
			self:onCastSpell(value)
			return
		end
		rawset(self, key, value)
	end
	rawgetmetatable("Spell").__newindex = SpellNewIndex
end

function getAccountNumberByPlayerName(name)
	local player = Player(name)
	if player then
		return player:getAccountId()
	end

	local resultId = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if resultId ~= false then
		local accountId = result.getDataInt(resultId, "account_id")
		result.free(resultId)
		return accountId
	end
	return 0
end

function getPlayerGUIDByName(name)
	local player = Player(name)
	if player then
		return player:getGuid()
	end

	local resultId = db.storeQuery("SELECT `id` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if resultId ~= false then
		local guid = result.getDataInt(resultId, "id")
		result.free(resultId)
		return guid
	end
	return 0
end

-- function used by closing door

function doRelocate(fromPos, toPos)
	if fromPos == toPos then
		return false
	end

	local fromTile = Tile(fromPos)
	if fromTile == nil then
		return false
	end

	if Tile(toPos) == nil then
		return false
	end

	for i = fromTile:getThingCount() - 1, 0, -1 do
		local thing = fromTile:getThing(i)
		if thing then
			if thing:isItem() then
				if ItemType(thing:getId()):isMovable() then
					thing:moveTo(toPos)
				end
			elseif thing:isCreature() then
				thing:teleportTo(toPos)
			end
		end
	end
	return true
end