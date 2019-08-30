Table = {}

function Table.val_to_str(v)
  if "string" == type(v) then
    v = string.gsub( v, "\n", "\\n" )
    if string.match( string.gsub(v,"[^'\"]",""), '^"+$' ) then
      return "'" .. v .. "'"
    end
    return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
  else
    return "table" == type( v ) and Table.tostring( v ) or
      tostring( v )
  end
end

function Table.key_to_str(k)
  if "string" == type(k) and string.match(k, "^[_%a][_%a%d]*$") then
    return k
  else
    return "[" .. Table.val_to_str( k ) .. "]"
  end
end

function Table.tostring(tbl)
  if not tbl then
    return false
  end

  if type(tbl) ~= "table" then
    return false
  end

  local result, done = {}, {}
  for k, v in ipairs( tbl ) do
    table.insert( result, Table.val_to_str( v ) )
    done[ k ] = true
  end
  for k, v in pairs( tbl ) do
    if not done[ k ] then
      table.insert( result,
        Table.key_to_str( k ) .. "=" .. Table.val_to_str( v ) )
    end
  end
  return "{" .. table.concat( result, "," ) .. "}"
end

function Table.dump(tbl)
  if not tbl then
    return false
  end

  if type(tbl) ~= "table" then
    return false
  end

  local result, done = {}, {}
  for k, v in ipairs( tbl ) do
    table.insert( result, Table.val_to_str( v ) )
    done[ k ] = true
  end
  for k, v in pairs( tbl ) do
    if not done[ k ] then
      table.insert( result,
        "\n"..Table.key_to_str( k ) .. "=" .. Table.val_to_str( v ) )
    end
  end
  return "{" .. table.concat( result, "," ) .. "}"
end

function Table.getTableFromString(string)
  if not string then
    return false
  end

  if not type(string) == "string" then
    return false
  end

  local table = loadstring("return "..string)()

  if not type(table) == "table" then
    return false
  end

  return table
end

function Table.copy(t)
  local u = { }
  for k, v in pairs(t) do u[k] = v end
  return setmetatable(u, getmetatable(t))
end

function table.getn(t)
  if type(t.n) == "number" then return t.n end
  local max = 0
  for i, _ in t do
    if type(i) == "number" and i>max then max=i end
  end
  return max
end

function table.shuffle(t)
    local rand = math.random 
    assert( t, "shuffleTable() expected a table, got nil" )
    local iterations = #t
    local j
    
    for i = iterations, 2, -1 do
        j = rand(i)
        t[i], t[j] = t[j], t[i]
    end
end

print("> Addons ==> Table aditional functions - loaded successfully!")