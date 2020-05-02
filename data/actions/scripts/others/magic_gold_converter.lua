local converterIds = {
	[32109] = 33299,[33299] = 32109, -- transformar items magic gold converter ativo/inativo
}

local function start_converter(pid, itemid)
	local player = Player(pid)
	if player ~= nil then
	
	local item = player:getItemById(itemid,true)
		if player:getItemCount(itemid) >= 1 then -- verificar se o player ainda tem magic gold converter na BP
			if item:hasAttribute(ITEM_ATTRIBUTE_CHARGES) then
				local charges_n = item:getAttribute(ITEM_ATTRIBUTE_CHARGES) -- pegar as cargas
				if charges_n >= 1 then -- se houver cargas, prosseguimos
					if player:getItemCount(ITEM_GOLD_COIN) >= 100 then -- precisamos verificar se o player tem pelo menos uma pilha de 100
						player:removeItem(ITEM_GOLD_COIN, 100) -- removemos a pilha com 100 gold coins
						player:addItem(ITEM_PLATINUM_COIN, 1) -- adicionamos 1 platinum (100 gold)
						item:setAttribute(ITEM_ATTRIBUTE_CHARGES,(charges_n-1)) -- sempre remover 1 carga ao trocar uma pilha com 100
					end
					if player:getItemCount(ITEM_PLATINUM_COIN) >= 100 then
						player:removeItem(ITEM_PLATINUM_COIN, 100)
						player:addItem(ITEM_CRYSTAL_COIN, 1)
						item:setAttribute(ITEM_ATTRIBUTE_CHARGES,(charges_n-1))
					end
					local converting = addEvent(start_converter, 100, pid, itemid) -- garante que o magic gold converter fique trocando gold automaticamente
				else
						item:remove(1) -- se as cargas acabarem, removeremos o item
						stopEvent(converting) -- ao remover o item precisamos parar a verificação automática
				end
			end
		else
			stopEvent(converting) -- caso o magic gold converter ativo acabe ou não esteja mais na BP
		end
	end
	return true
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
		item:transform(converterIds[item.itemid]) --transforma o gold converter inativo para ativo
		item:decay() 
		start_converter(player:getId(), 33299) -- ultimo a ser chamado pq retorna true
	return true
end