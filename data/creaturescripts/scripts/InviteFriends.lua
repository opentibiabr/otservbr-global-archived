function onLogin(player)
player:registerEvent("FriendsPoints")
if player:getStorageValue(_invite_friends.storages[1]) < 0 then
player:setStorageValue(_invite_friends.storages[1], 0) 
player:setStorageValue(_invite_friends.storages[4], 0)
end
if getInvitePoints(player) > 0 then
local acc = player:getAccountId()
local FriendPoints, CheckPoints = getInvitePoints(player), player:getStorageValue(_invite_friends.storages[4])
for vod, ka in pairs(_invite_friends.rewards) do
local str = ""
if FriendPoints >= vod and CheckPoints < vod then
str = str.."--> Invite Players System <--\n\nVocê acaba de receber algumas recompensas:\n\nItems: \n"..getItemsFromList(ka.items)..".\n\n"
if ka.p_days > 0 then 
player:addPremiumDays(ka.p_days) 
str = str.."Premium Days:\n"..ka.p_days.." Premium Days." 
end
if ka.p_points > 0 then 
db.executeQuery('UPDATE accounts SET premium_points=premium_points+' .. p_points ..' WHERE id=' .. acc)
str = str.."Premium Points:\n"..ka.p_points.." Premium Points."
end
if ka.out[1] > 0 then 
player:addOutfitAddon(player:getSex() == PLAYERSEX_FEMALE and ka.out[1] or ka.out[2], 3) 
str = str.."[New Outfit]\nRecebeu uma Nova Outfit."
end
if ka.mount_id > 0 then 
player:addMount(ka.mount_id) 
str = str.."[New Outfit]\nRecebeu uma Nova Montaria."
end
player:setStorageValue(_invite_friends.storages[4], FriendPoints)
local town_id = player:getTown():getId()
if #ka.items > 0 then
local parcel = player:getDepotChest(town_id, true):addItem(2595)
for _, i_i in ipairs(ka.items) do
local item, amount = i_i[1],i_i[2]
if isItemStackable(item) or amount == 1 then
parcel:addItem(item, amount)
else
for i = 1, amount do
parcel:addItem(item, 1)
end
end
end
end
local townid = player:getTown():getId()
local letter = player:getDepotChest(town_id, true):addItem(2598, 1, true, 1)
letter:setAttribute(ITEM_ATTRIBUTE_WRITER, "[+] Invite Players System [+]")
letter:setAttribute(ITEM_ATTRIBUTE_TEXT, str)
player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE,"[Invite Players System] Você Recebeu algumas premiações por estar convidando jogadores para o servidor, Por favor conferir os itens no Depot.")
end
end 
end
return true
end
function onAdvance(player, skill, oldlevel, newlevel)
if (skill == SKILL__LEVEL) then
if hasInviteFriend(player) and player:getStorageValue(_invite_friends.storages[3]) < newLevel and _invite_friends.levels_win[newLevel] then
local f_name, points = getNameFriend(player), _invite_friends.levels_win[newLevel]
player:setStorageValue(_invite_friends.storages[3], newLevel)
addInvitePoints(f_name, points)
player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "[Invite Friends] você atingiu o level "..newLevel.." e o seu amigou "..f_name.." recebeu "..points.." Friend Points. Obrigado!")
end
end
return true
end