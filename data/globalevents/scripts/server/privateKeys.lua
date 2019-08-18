local function createPrivate(params)
  local player = params.player
  local item = params.item
  local actionId = item.actionid
  local questName

  for index,questInfo in pairs(privateKeysTable) do
    local questPos = questInfo.position
    local itemPos = item:getPosition()

    if questPos.x == itemPos.x and questPos.y == itemPos.y and questPos.z == itemPos.z then
      questName = index
    end
  end

  if not questName then
    return false
  end

  if not privateKeysTable[questName] then
    return false
  end

end
  print("> Loaded Advanced Actioner by Fernando Mieza el Tuero Fuerte")

local function _questLoader()
  for questName,questInfo in pairs(privateKeysTable) do
    local tile = Tile(questInfo.position)
    local item = getThingfromPos(questInfo.position)
    
    -- verifica se a posição é válida
    if tile then
        local item = nil
        -- verifica se já não tem nenhum item criado
        if tile:getItemCountById(questInfo.itemId) == 0 then
            -- cria item
            item = Game.createItem(questInfo.itemId, 1, questInfo.position) 
        else
            -- se já tiver item criado, pega o ultimo da pilha
            item = tile:getItemById(questInfo.itemId) -- TODO: testar se essa função pega a ultima da pilha
        end

        -- se ele encontrou o item, adicionar a actionid
        if item then
            item:setActionId(questInfo.aid)
            item:setAttribute(ITEM_ATTRIBUTE_UNIQUEID, questInfo.uid)
            item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, questInfo.desc)
        end

    end

  end
end

function onStartup()
    addEvent(_questLoader, 1 * 1000)
    return true
end
