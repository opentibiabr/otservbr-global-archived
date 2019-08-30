function createClass(parent)
  local newClass = {}
  function newClass:new(instance)
    local instance = instance or {}
    setmetatable(instance, {__index = newClass})
    return instance
  end

  if(parent ~= nil) then
    setmetatable(newClass, {__index = parent})
  end

  function newClass:getSelf()
    return newClass
  end

  function newClass:getParent()
    return baseClass
  end

  function newClass:isa(class)
    local tmp = newClass
    while(tmp ~= nil) do
      if(tmp == class) then
        return true
      end

      tmp = tmp:getParent()
    end

    return false
  end
  
  function newClass:setAttributes(attributes)
    for k, v in pairs(attributes) do
      newClass[k] = v
    end
  end

  return newClass
end


if(result == nil) then
  print("> WARNING: Couldn't load database lib.")
  return
end

Result = createClass(nil)
Result:setAttributes({
  id = -1,
  query = ""
})

function Result:getID()
  return self.id
end

function Result:setID(_id)
  self.id = _id
end

function Result:getQuery()
  return self.query
end

function Result:setQuery(_query)
  self.query = _query
end

function Result:create(_query)
  self:setQuery(_query)
  local _id = db.storeQuery(self:getQuery())
  if(_id) then
    self:setID(_id)
  end

  return self:getID()
end

function Result:getRows(free)
  local free = free or false
  if(self:getID() == -1) then
--    error("[Result:getRows] Result not set!")
    return 0
  end

  local c = 0
  repeat
    c = c + 1
  until not self:next()

  local _query = self:getQuery()
  self:free()
  if(not free) then
    self:create(_query)
  end

  return c
end

function Result:getDataInt(s)
  if(self:getID() == -1) then
    error("[Result:getDataInt] Result not set!")
  end

  return result.getDataInt(self:getID(), s)
end

function Result:getDataLong(s)
  if(self:getID() == -1) then
    error("[Result:getDataLong] Result not set!")
  end

  return result.getDataLong(self:getID(), s)
end

function Result:getDataString(s)
  if(self:getID() == -1) then
    error("[Result:getDataString] Result not set!")
  end

  return result.getDataString(self:getID(), s)
end

function Result:getDataStream(s)
  if(self:getID() == -1) then
    error("[Result:getDataStream] Result not set!")
  end

  return result.getDataStream(self:getID(), s)
end

function Result:next()
  if(self:getID() == -1) then
    error("[Result:next] Result not set!")
  end

  return result.next(self:getID())
end

function Result:free()
  if(self:getID() == -1) then
    error("[Result:free] Result not set!")
  end

  self:setQuery("")
  local ret = result.free(self:getID())
  self:setID(-1)
  return ret
end

Result.numRows = Result.getRows
function db.getResult(query)
  if(type(query) ~= 'string') then
    return nil
  end

  local ret = Result:new()
  ret:create(query)
  return ret
end

print("> Addons ==> Database - loaded successfully!")