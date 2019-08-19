local function _questLoader()
    
    -- verifica se a posição é válida
    if tile then
        local item = nil
        -- verifica se já não tem nenhum item criado
        if tile:getItemCountById(privateKeysTable.itemId) == 0 then
            -- cria item
            item = Game.createItem(privateKeysTable.itemId, 1, privateKeysTable.position) 
        else
            -- se já tiver item criado, pega o ultimo da pilha
            item = tile:getItemById(privateKeysTable.itemId) -- TODO: testar se essa função pega a ultima da pilha
        end

        -- se ele encontrou o item, adicionar a actionid
        if item then
            item:setActionId(privateKeysTable.aid)
            item:setAttribute(ITEM_ATTRIBUTE_UNIQUEID, privateKeysTable.uid)
            item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, privateKeysTable.desc)
        end

    end
end

function onStartup()
    addEvent(_questLoader, 1 * 1000) -- execute once after startup
    return true
end
