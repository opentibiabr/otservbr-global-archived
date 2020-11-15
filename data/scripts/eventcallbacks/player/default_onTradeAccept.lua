local ec = EventCallback
function ec:onTradeAccept(target, item, targetItem)
	self:closeImbuementWindow()
	target:closeImbuementWindow()
	return true
end
