local bags = {
	[7737] = {'orc warrior', 'pirate cutthroat', 'dworc voodoomaster', 'dwarf guard', 'minotaur mage', 'ogre shaman', 'ogre brute', 'rat'}, -- common
	[7739] = {'serpent spawn', 'demon', 'juggernaut', 'behemoth', 'ashmunrah', 'vexclaw', 'grimeleech', 'hellflayer', 'black sheep'}, -- uncommon
	[9076] = {'quara hydromancer', 'diabolic imp', 'banshee', 'frost giant', 'lich', 'vexclaw', 'grimeleech', 'hellflayer', 'ogre shaman', 'ogre brute', 'pig'}, -- deluxe
	[27617] = {'old bonelord', 'old bug', 'old wolf', 'old giant spider', {[PLAYERSEX_FEMALE] = 949, [PLAYERSEX_MALE] = 948}} -- retro
}

local costumeBags = Action()

function costumeBags.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local outfits = bags[item.itemid]
	if not outfits then
		return true
	end
	local outfit = outfits[math.random(#outfits)]
	local outfitTime = 5 * 60 * 60 * 1000
	if type(outfit) == "string" then
		player:sendTextMessage(MESSAGE_STATUS, 'You will stay 5 hours transformed in a monster!')
		doSetMonsterOutfit(player, outfit, outfitTime)
	elseif type(outfit) == "table" then
		local condition = Condition(CONDITION_OUTFIT)
		condition:setTicks(outfitTime)
		condition:setOutfit({lookType = outfit[player:getSex()]})
		player:addCondition(condition)
	end
	player:addAchievementProgress('Masquerader', 100)
	item:getPosition():sendMagicEffect(36)
	item:remove()
	return true
end

costumeBags:id(7737, 7739, 9076, 27617)
costumeBags:register()
