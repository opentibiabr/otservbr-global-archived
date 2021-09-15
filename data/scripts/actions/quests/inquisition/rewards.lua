local rewards = {
	[1787] = 8062,
	[1788] = 8090,
	[1789] = 8053,
	[1790] = 8060,
	[1791] = 8023,
	[1792] = 8096,
	[1793] = 8100,
	[1794] = 8102,
	[1795] = 8026
}

local inquisitionRewards = Action()
function inquisitionRewards.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.TheInquisition.Reward) < 1 then
		player:setStorageValue(Storage.TheInquisition.Reward, 1)
		player:setStorageValue(Storage.TheInquisition.Questline, 25)
		player:setStorageValue(Storage.TheInquisition.Mission07, 5) -- The Inquisition Questlog- "Mission 7: The Shadow Nexus"
		player:addItem(rewards[item.uid], 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found " .. ItemType(rewards[item.uid]):getName() .. ".")
		player:addAchievement('Master of the Nexus')
		player:addOutfitAddon(288, 2)
		player:addOutfitAddon(288, 1)
		player:addOutfitAddon(289, 1)
		player:addOutfitAddon(289, 2)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end

for value = 1787, 1795 do
	inquisitionRewards:uid(value)
end
inquisitionRewards:register()