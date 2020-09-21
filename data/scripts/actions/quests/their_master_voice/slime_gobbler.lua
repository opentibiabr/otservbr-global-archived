local slime = Action()
function slime.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    return Gobbler_onUse(player, item, fromPosition, target, toPosition, isHotkey)
end

slime:id(13601)
slime:register()