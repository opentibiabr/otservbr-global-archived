local config = {
	[7737] = {'orc warrior', 'pirate cutthroat', 'dworc voodoomaster', 'dwarf guard', 'minotaur mage', 'ogre shaman', 'ogre brute', 'rat'}, -- common
	[7739] = {'serpent spawn', 'demon', 'juggernaut', 'behemoth', 'ashmunrah', 'vexclaw', 'grimeleech', 'hellflayer', 'black sheep'}, -- uncommon
	[9076] = {'quara hydromancer', 'diabolic imp', 'banshee', 'frost giant', 'lich', 'vexclaw', 'grimeleech', 'hellflayer', 'ogre shaman', 'ogre brute', 'pig'} -- deluxe
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local monsterNames = config[item.itemid]
	if not monsterNames then
		return true
	end
    player:sendTextMessage(MESSAGE_STATUS_DEFAULT, 'You will stay 5 minutes transformed in a monster!')
	doSetMonsterOutfit(player, monsterNames[math.random(#monsterNames)], 300 * 1000)
	player:addAchievementProgress('Masquerader', 100)
	item:getPosition():sendMagicEffect(36)
	item:remove()
	return true
end
