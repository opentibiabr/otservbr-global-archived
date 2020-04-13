dofile('data/modules/scripts/blessings/blessings.lua')
function onDeath(player, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	if player:hasFlag(PlayerFlag_NotGenerateLoot) then
		return true
	end
	Blessings.DebugPrint("onDeath DROPLOOT EVENT DropLoot")
	return Blessings.PlayerDeath(player, corpse, killer)
end
