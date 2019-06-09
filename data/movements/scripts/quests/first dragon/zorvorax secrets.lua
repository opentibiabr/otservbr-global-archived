local config = {
	[24894] = {msg = 'You enter the beautiful oasis. By visiting this sacred site you\'re infused with the power of water bringing life to the desert.'},
	[24895] = {msg = 'You enter the circle of trees and flowers. By visiting this sacred site you\'re infused with the power of nature and plants.'},
	[24896] = {msg = 'You entered the suntower of Ab\'dendriel. By visiting this sacred site you\'re infused with the power of the life-giving sun.'}
}
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	local secret = config[item.actionid]
	if not secret then
		return true
	end
	player:setStorageValue(item.actionid, 1)
	player:setStorageValue(Storage.FirstDragon.SecretsCounter, player:getStorageValue(Storage.FirstDragon.SecretsCounter) + 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, secret.msg)
	return true
end
