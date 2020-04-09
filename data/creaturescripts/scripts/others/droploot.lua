dofile('data/modules/scripts/blessings/blessings.lua')
function onDeath(player, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	if getPlayerFlagValue(player, PlayerFlag_NotGenerateLoot) then --or player:getVocation():getId() == VOCATION_NONE then
		return true
	end
	Blessings.DebugPrint("onDeath DROPLOOT EVENT DropLoot")
	return Blessings.PlayerDeath(player, corpse, killer)
end