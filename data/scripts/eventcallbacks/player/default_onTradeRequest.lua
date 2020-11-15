local storeItemID = {
	-- registered item ids here are not tradable with players
	-- these items can be set to moveable at items.xml
	-- 500 charges exercise weapons
	32384, -- exercise sword
	32385, -- exercise axe
	32386, -- exercise club
	32387, -- exercise bow
	32388, -- exercise rod
	32389, -- exercise wand

	-- 50 charges exercise weapons
	32124, -- training sword
	32125, -- training axe
	32126, -- training club
	32127, -- training bow
	32128, -- training wand
	32129, -- training club

	-- magic gold and magic converter (activated/deactivated)
	32109, -- magic gold converter
	33299, -- magic gold converter
	26378, -- gold converter
	29020, -- gold converter

	-- foods
	35172, -- roasted wyvern wings
	35173, -- carrot pie
	35174, -- tropical marinated tiger
	35175, -- delicatessen salad
	35176, -- chilli con carniphila
	35177, -- svargrond salmon filet
	35178, -- carrion casserole
	35179, -- consecrated beef
	35180, -- overcooked noodles
}

local ec = EventCallback
function ec:onTradeRequest(target, item)
	-- No trade items with actionID = 100
	if item:getActionId() == NOT_MOVEABLE_ACTION then
		return false
	end

	if isInArray(storeItemID,item.itemid) then
		return false
	end
	return true
end