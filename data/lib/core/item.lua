function Item.getType(self)
	return ItemType(self:getId())
end

function Item.isContainer(self)
	return false
end

function Item.isCreature(self)
	return false
end

function Item.isMonster(self)
	return false
end

function Item.isNpc(self)
	return false
end

function Item.isPlayer(self)
	return false
end

function Item.isTeleport(self)
	return false
end

function Item.isTile(self)
	return false
end

function Item.setDescription(self, description)
	if description ~= '' then
		self:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, description)
	else
		self:removeAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
	end
end

function Item.setText(self, text)
	if text ~= '' then
		self:setAttribute(ITEM_ATTRIBUTE_TEXT, text)
	else
		self:removeAttribute(ITEM_ATTRIBUTE_TEXT)
	end
end

function Item.setUniqueId(self, uniqueId)
	if type(uniqueId) ~= 'number' or uniqueId < 0 or uniqueId > 65535 then
		return false
	end

	self:setAttribute(ITEM_ATTRIBUTE_UNIQUEID, uniqueId)
end

--Special lib
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
