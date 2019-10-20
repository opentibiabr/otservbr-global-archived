local config = {
	["citizen"] = {
		male = 128,
		female = 136,
		addon = 3,
		items = {
			{5878,100}
		}
	},
	["hunter"] = {
		male = 129,
		female = 137,
		addon = 3,
		items = {
			{5876, 100}, {5948, 100}
		}
	},
	["mage"] = {
		male = 130,
		female = 138,
		addon = 3,
		items = {
			{2160, 1000}
		 }
	},
	["knight"] = {
		male = 131,
		female = 139,
		addon = 3,
		items = {
			{5880, 100}, {5893, 100}
		}
	},
	["summoner"] = {
		male = 133,
		female = 141,
		addon = 3,
		items = {
			{2160,1000}
		}
	},
	["warrior"] = {
		male = 134,
		female = 142,
		addon = 3,
		items = {
			{5925, 100}, {5899, 100}, {5919, 1}, {5880, 100}
		}
	},
	["barbarian"] = {
		male = 147,
		female = 143,
		addon = 3,
		items = {
			{5911, 50}, {5910, 50}, {5879, 100}
		}
	},
	["druid"] = {
		male = 148,
		female = 144,
		addon = 3,
		items = {
			{5896, 50}, {5897, 50}
		}
	},
	["wizard"] = {
		male = 149,
		female = 145,
		addon = 3,
		items = {
			{2536, 1}, {2492, 1}, {2488, 1}, {2123, 1}, {5922, 50}
		}
	},
	["oriental"] = {
		male = 150,
		female = 146,
		addon = 3,
		items = {
			{5883, 100}, {5895, 100}, {5912, 100}
		}
	},
	["pirate"] = {
		male = 151,
		female = 155,
		addon = 3,
		items = {
			{6098, 100}, {6126, 100}, {6097, 100}
		}
	},
	["assassin"] = {
		male = 152,
		female = 156,
		addon = 3,
		items = {
			{5898, 30}, {5882, 10}, {5881, 30}, {5895, 20}, {5905, 10}
		}
	},
	["beggar"] = {
		male = 153,
		female = 157,
		addon = 3,
		items = {
			{5878, 50}, {2743, 30}, {5913, 20}, {5894, 10}
		}
	},
	["shaman"] = {
		male = 154,
		female = 158,
		addon = 3,
		items = {
			{3955, 5}, {5810, 5}, {3966, 5}, {3967, 5}
		}
	},
	["norseman"] = {
		male = 251,
		female = 252,
		addon = 3,
		items = {
			{7290, 15}
		}
	},
	["nightmare"] = {
		male = 268,
		female = 269,
		addon = 3,
		items = {
			{6500, 200}
		}
	},
	["jester"] = {
		male = 273,
		female = 270,
		addon = 3,
		items = {
			{2160, 25}
		}
	},
	["brotherhood"] = {
		male = 278,
		female = 279,
		addon = 3,
		items = {
			{6500, 200}
		}
	}
}

function onSay(player, words, param)
	local v = config[param:lower()]
	if not v then
		return false
	end

	local outfit = player:getSex() == PLAYERSEX_FEMALE and v["female"] or v["male"]
	if player:hasOutfit(outfit, 3) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already obtained the " .. param .. " addons.")
		return false
	end

	local text = ""
	for i = 1, #v["items"] do
		local itemType = ItemType(v["items"][i][1])
		text = text .. (i ~= 1 and (i == #v["items"] and " and " or ", ") or "") .. (v["items"][i][2] > 1 and v["items"][i][2] or itemType:getArticle()) .. " " .. (v["items"][i][2] > 1 and itemType:getPluralName() or itemType:getName())
	end

	for i = 1, #v["items"] do
		if player:getItemCount(v["items"][i][1]) < v["items"][i][2] then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need " .. text .. " for the whole " .. param .. " outfit.")
			return false
		end
	end

	for i = 1, #v["items"] do
		player:removeItem(unpack(v["items"][i]))
	end
	player:addOutfitAddon(v["female"], 3)
	player:addOutfitAddon(v["male"], 3)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Enjoy your new addons to your " .. param .. " outfit!")
	player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
	return false
end
