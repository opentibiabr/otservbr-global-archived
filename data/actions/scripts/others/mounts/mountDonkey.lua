local TYPE_ITEM, TYPE_MONSTER, TYPE_NPC = 0, 2, 3

local config = {
	[13537]	= {
		mountName = 'Donkey',
		lookType = 387,
		id = 13,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{removeTransformation = true, text = 'The donkey transformation suddenly wears off.'},
			{broke = true, sound = 'Heeee-haaa-haaa-haaw!', text = 'You did not manage to feed the donkey enough apple slices.'}
		},
		success = {sound = 'Heeee-haaaaw!', text = 'Munching a large pile of apple slices tamed the donkey.'}
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local mount = config[item.itemid]
	if not mount then
		return false
	end

	local targetName = target:getName():lower()
	if mount.type ~= target.type
			or (mount.lookType and mount.lookType ~= target:getOutfit().lookType)
			or (mount.name and mount.name ~= targetName) then
		return false
	end

	if player:hasMount(mount.id) then
		player:say('You already tamed a ' .. (mount.mountName or targetName) .. '.', TALKTYPE_MONSTER_SAY)
		return true
	end

	if target.type == TYPE_MONSTER then
		if target:getMaster() then
			return false
		end
	end

	if math.random(100) > mount.chance then
		local action = mount.fail[math.random(#mount.fail)]
		if action.run then
			target:remove()
		elseif action.broke then
			item:remove(1)
		elseif action.destroyObject then
			addEvent(Game.createItem, 60 * 60 * 1000, target.itemid, 1, toPosition)
			target:remove()
		elseif action.removeTransformation then
			target:removeCondition(CONDITION_OUTFIT)
		end

		doCreatureSayWithRadius(player, action.text, TALKTYPE_MONSTER_SAY, 2, 2)
		if action.sound then
			player:say(action.sound, TALKTYPE_MONSTER_SAY, false, 0, toPosition)
		end
		return true
	end

	player:addMount(mount.id)
	doCreatureSayWithRadius(player, mount.success.text, TALKTYPE_MONSTER_SAY, 2, 2)
	player:say(mount.success.sound, TALKTYPE_MONSTER_SAY, false, 0, toPosition)

	target:remove()
	item:remove(1)
	return true
end
