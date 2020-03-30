function insertIndex(i, buffer)
	table.insert(buffer, "[")
	if type(i) == "string" then
		table.insert(buffer, '"')
		table.insert(buffer, i)
		table.insert(buffer, '"')
	elseif type(i) == "number" then
		table.insert(buffer, tostring(i))
	end
	table.insert(buffer, "] = ")
end

function indexToStr(i, v, buffer)
	local tp = type(v)
	local itp = type(i)
	if itp ~= "number" and itp ~= "string" then
		print("Invalid index to serialize: " .. type(i))
	else
		if tp == "table" then
			insertIndex(i, buffer)
			serializeTable(v, buffer)
			table.insert(buffer, ",")
		elseif tp == "number" then
			insertIndex(i, buffer)
			table.insert(buffer, tostring(v))
			table.insert(buffer, ",")
		elseif tp == "string" then
			insertIndex(i, buffer)
			table.insert(buffer, '"')
			table.insert(buffer, v)
			table.insert(buffer, '",')
		elseif tp == "boolean" then
			insertIndex(i, buffer)
			table.insert(buffer, v == true and "true" or "false")
			table.insert(buffer, ",")
		else
			print("Invalid type to serialize: " .. tp .. ", index: " .. i)
		end
	end
end

function serializeTable(t, buffer)
	local buffer = buffer or {}
	table.insert(buffer, "{")
	for i, x in pairs(t) do
		indexToStr(i, x, buffer)
	end
	table.insert(buffer, "}")
	return table.concat(buffer)
end

function table.copy(t, out)
	out = out or {}
	if type(t) ~= "table" then
		return false
	end

	for i, x in pairs(t) do
		if type(x) == "table" then
			out[i] = {}
			table.copy(t[i], out[i])
		else
			out[i] = x
		end
	end
	return out
end

function unserializeTable(str, out)
	local tmp = loadstring("return " .. str)
	if tmp then
		tmp = tmp()
	else
		print("Unserialization error: " .. str)
		return false
	end
	return table.copy(tmp, out)
end

local function setTableIndexes(t, i, v, ...)
	if i and v then
		t[i] = v
		return setTableIndexes(t, ...)
	end
end

local function getTableIndexes(t, i, ...)
	if i then
		return t[i], getTableIndexes(t, ...)
	end
end

function unpack2(tab, i)
	local i, v = next(tab, i)
	if next(tab, i) then
		return i, v, unpack2(tab, i)
	else
		return i, v
	end
end

function pack(t, ...)
	for i = 1, select("#", ...) do
		local tmp = select(i, ...)
		t[i] = tmp
	end
	return t
end

function Item:setSpecialAttribute(...)
	local tmp
	if self:hasAttribute(ITEM_ATTRIBUTE_SPECIAL) then
		tmp = self:getAttribute(ITEM_ATTRIBUTE_SPECIAL)
	else
		tmp = "{}"
	end

	local tab = unserializeTable(tmp)
	if tab then
		setTableIndexes(tab, ...)
		tmp = serializeTable(tab)
		self:setAttribute(ITEM_ATTRIBUTE_SPECIAL, tmp)
		return true
	end
end

function Item:getSpecialAttribute(...)
	local tmp
	if self:hasAttribute(ITEM_ATTRIBUTE_SPECIAL) then
		tmp = self:getAttribute(ITEM_ATTRIBUTE_SPECIAL)
	else
		tmp = "{}"
	end

	local tab = unserializeTable(tmp)
	if tab then
		return getTableIndexes(tab, ...)
	end
end

if not PLAYER_STORAGE then
	PLAYER_STORAGE = {}
end

function Player:setSpecialStorage(storage, value)
	if not PLAYER_STORAGE[self:getGuid()] then
		self:loadSpecialStorage()
	end

	PLAYER_STORAGE[self:getGuid()][storage] = value
end

function Player:getSpecialStorage(storage)
	if not PLAYER_STORAGE[self:getGuid()] then
		self:loadSpecialStorage()
	end

	return PLAYER_STORAGE[self:getGuid()][storage]
end

function Player:loadSpecialStorage()
	if not PLAYER_STORAGE then
		PLAYER_STORAGE = {}
	end

	PLAYER_STORAGE[self:getGuid()] = {}
	local resultId = db.storeQuery("SELECT * FROM `player_misc` WHERE `player_id` = " .. self:getGuid())
	if resultId then
		local info = result.getStream(resultId , "info") or "{}"
		unserializeTable(info, PLAYER_STORAGE[self:getGuid()])
	end
end

function Player:saveSpecialStorage()
	if PLAYER_STORAGE and PLAYER_STORAGE[self:getGuid()] then
		local tmp = serializeTable(PLAYER_STORAGE[self:getGuid()])
		db.query("DELETE FROM `player_misc` WHERE `player_id` = " .. self:getGuid())
		db.query(string.format("INSERT INTO `player_misc` (`player_id`, `info`) VALUES (%d, %s)", self:getGuid(), db.escapeBlob(tmp, #tmp)))
	end
end
