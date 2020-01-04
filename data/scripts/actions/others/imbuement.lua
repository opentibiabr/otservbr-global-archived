-- imbuement
local action = Action() 

function action.onUse(player, item, fromPosition, itemEx, toPosition)
action:useImbueShrine()
end

for ids = 25060,25061 and 25182,25183 do
action:id(ids)
end
action:register()