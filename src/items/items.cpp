/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2019  Mark Samman <mark.samman@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include "otpch.h"

#include "items.h"
#include "spells.h"
#include "weapons.h"

#include "pugicast.h"

#ifdef __cpp_lib_filesystem
#include <filesystem>
namespace fs = std::filesystem;
#else
#include <boost/filesystem.hpp>
namespace fs = boost::filesystem;
#endif

extern Weapons* g_weapons;

Items::Items(){}

void Items::clear()
{
	items.clear();
	reverseItemMap.clear();
	nameToItems.clear();
}

using LootTypeNames = std::unordered_map<std::string, ItemTypes_t>;

LootTypeNames lootTypeNames = {
	{"armor", ITEM_TYPE_ARMOR},
	{"amulet", ITEM_TYPE_AMULET},
	{"boots", ITEM_TYPE_BOOTS},
	{"container", ITEM_TYPE_CONTAINER},
	{"decoration", ITEM_TYPE_DECORATION},
	{"food", ITEM_TYPE_FOOD},
	{"helmet", ITEM_TYPE_HELMET},
	{"legs", ITEM_TYPE_LEGS},
	{"other", ITEM_TYPE_OTHER},
	{"potion", ITEM_TYPE_POTION},
	{"ring", ITEM_TYPE_RING},
	{"rune", ITEM_TYPE_RUNE},
	{"shield", ITEM_TYPE_SHIELD},
	{"tools", ITEM_TYPE_TOOLS},
	{"valuable", ITEM_TYPE_VALUABLE},
	{"ammo", ITEM_TYPE_AMMO},
	{"axe", ITEM_TYPE_AXE},
	{"club", ITEM_TYPE_CLUB},
	{"distance", ITEM_TYPE_DISTANCE},
	{"sword", ITEM_TYPE_SWORD},
	{"wand", ITEM_TYPE_WAND},
	{"creatureproduct", ITEM_TYPE_CREATUREPRODUCT},
	{"retrieve", ITEM_TYPE_RETRIEVE},
	{"gold", ITEM_TYPE_GOLD},
	{"unassigned", ITEM_TYPE_UNASSIGNED},
};

ItemTypes_t Items::getLootType(const std::string& strValue)
{
	auto lootType = lootTypeNames.find(strValue);
	if (lootType != lootTypeNames.end()) {
		return lootType->second;
	}
	return ITEM_TYPE_NONE;
}

bool Items::reload()
{
	clear();
	loadFromOtb("data/items/items.otb");

	if (!loadFromXml()) {
		return false;
	}

	g_weapons->loadDefaults();
	return true;
}

constexpr auto OTBI = OTB::Identifier{{'O','T', 'B', 'I'}};

FILELOADER_ERRORS Items::loadFromOtb(const std::string& file)
{
	if (!fs::exists(file)) {
		SPDLOG_ERROR("[Items::loadFromOtb] - Failed to load {}, file doesn't exist", file);
		return ERROR_NOT_OPEN;
	}

	OTB::Loader loader{file, OTBI};

	auto& root = loader.parseTree();

	PropStream props;
	if (loader.getProps(root, props)) {
		//4 byte flags
		//attributes
		//0x01 = version data
		uint32_t flags;
		if (!props.read<uint32_t>(flags)) {
			return ERROR_INVALID_FORMAT;
		}

		uint8_t attr;
		if (!props.read<uint8_t>(attr)) {
			return ERROR_INVALID_FORMAT;
		}

		if (attr == ROOT_ATTR_VERSION) {
			uint16_t datalen;
			if (!props.read<uint16_t>(datalen)) {
				return ERROR_INVALID_FORMAT;
			}

			if (datalen != sizeof(VERSIONINFO)) {
				return ERROR_INVALID_FORMAT;
			}

			VERSIONINFO vi;
			if (!props.read(vi)) {
				return ERROR_INVALID_FORMAT;
			}

			majorVersion = vi.dwMajorVersion; //items otb format file version
			minorVersion = vi.dwMinorVersion; //client version
			buildNumber = vi.dwBuildNumber; //revision
		}
	}

	if (majorVersion == 0xFFFFFFFF) {
		SPDLOG_WARN("[Items::loadFromOtb] - items.otb using generic client version");
	} else if (majorVersion != 3) {
		SPDLOG_ERROR("[Items::loadFromOtb] - "
                     "Old version detected, a newer version of items.otb is required");
		return ERROR_INVALID_FORMAT;
	} else if (minorVersion < CLIENT_VERSION_1140) {
		SPDLOG_ERROR("[Items::loadFromOtb] - "
                     "A newer version of items.otb is required");
		return ERROR_INVALID_FORMAT;
	}

	for (auto & itemNode : root.children) {
		PropStream stream;
		if (!loader.getProps(itemNode, stream)) {
			return ERROR_INVALID_FORMAT;
		}

		uint32_t flags;
		if (!stream.read<uint32_t>(flags)) {
			return ERROR_INVALID_FORMAT;
		}

		uint16_t serverId = 0;
		uint16_t clientId = 0;
		uint16_t speed = 0;
		uint16_t wareId = 0;
		uint8_t lightLevel = 0;
		uint8_t lightColor = 0;
		uint8_t alwaysOnTopOrder = 0;
    bool isPodium = false;

		if (clientId == 35973 || clientId == 35974) {
			  isPodium = true;
		}

		uint8_t attrib;
		while (stream.read<uint8_t>(attrib)) {
			uint16_t datalen;
			if (!stream.read<uint16_t>(datalen)) {
				return ERROR_INVALID_FORMAT;
			}

			switch (attrib) {
				case ITEM_ATTR_SERVERID: {
					if (datalen != sizeof(uint16_t)) {
						return ERROR_INVALID_FORMAT;
					}

					if (!stream.read<uint16_t>(serverId)) {
						return ERROR_INVALID_FORMAT;
					}

					break;
				}

				case ITEM_ATTR_CLIENTID: {
					if (datalen != sizeof(uint16_t)) {
						return ERROR_INVALID_FORMAT;
					}

					if (!stream.read<uint16_t>(clientId)) {
						return ERROR_INVALID_FORMAT;
					}
					break;
				}

				case ITEM_ATTR_SPEED: {
					if (datalen != sizeof(uint16_t)) {
						return ERROR_INVALID_FORMAT;
					}

					if (!stream.read<uint16_t>(speed)) {
						return ERROR_INVALID_FORMAT;
					}
					break;
				}

				case ITEM_ATTR_LIGHT2: {
					if (datalen != sizeof(lightBlock2)) {
						return ERROR_INVALID_FORMAT;
					}

					lightBlock2 lb2;
					if (!stream.read(lb2)) {
						return ERROR_INVALID_FORMAT;
					}

					lightLevel = static_cast<uint8_t>(lb2.lightLevel);
					lightColor = static_cast<uint8_t>(lb2.lightColor);
					break;
				}

				case ITEM_ATTR_TOPORDER: {
					if (datalen != sizeof(uint8_t)) {
						return ERROR_INVALID_FORMAT;
					}

					if (!stream.read<uint8_t>(alwaysOnTopOrder)) {
						return ERROR_INVALID_FORMAT;
					}
					break;
				}

				case ITEM_ATTR_WAREID: {
					if (datalen != sizeof(uint16_t)) {
						return ERROR_INVALID_FORMAT;
					}

					if (!stream.read<uint16_t>(wareId)) {
						return ERROR_INVALID_FORMAT;
					}
					break;
				}

				default: {
					//skip unknown attributes
					if (!stream.skip(datalen)) {
						return ERROR_INVALID_FORMAT;
					}
					break;
				}
			}
		}

		reverseItemMap.emplace(clientId, serverId);

		// store the found item
		if (serverId >= items.size()) {
			items.resize(serverId + 1);
		}
		ItemType& iType = items[serverId];

		iType.group = static_cast<itemgroup_t>(itemNode.type);
		switch (itemNode.type) {
			case ITEM_GROUP_CONTAINER:
				iType.type = ITEM_TYPE_CONTAINER;
				break;
			case ITEM_GROUP_DOOR:
				//not used
				iType.type = ITEM_TYPE_DOOR;
				break;
			case ITEM_GROUP_MAGICFIELD:
				//not used
				iType.type = ITEM_TYPE_MAGICFIELD;
				break;
			case ITEM_GROUP_TELEPORT:
				//not used
				iType.type = ITEM_TYPE_TELEPORT;
				break;
			case ITEM_GROUP_NONE:
			case ITEM_GROUP_GROUND:
			case ITEM_GROUP_SPLASH:
			case ITEM_GROUP_FLUID:
			case ITEM_GROUP_CHARGES:
			case ITEM_GROUP_DEPRECATED:
				break;
			default:
				return ERROR_INVALID_FORMAT;
		}

		iType.blockSolid = hasBitSet(FLAG_BLOCK_SOLID, flags);
		iType.blockProjectile = hasBitSet(FLAG_BLOCK_PROJECTILE, flags);
		iType.blockPathFind = hasBitSet(FLAG_BLOCK_PATHFIND, flags);
		iType.hasHeight = hasBitSet(FLAG_HAS_HEIGHT, flags);
		iType.useable = hasBitSet(FLAG_USEABLE, flags);
		iType.pickupable = hasBitSet(FLAG_PICKUPABLE, flags);
		iType.moveable = hasBitSet(FLAG_MOVEABLE, flags);
		iType.wrapContainer = hasBitSet(FLAG_WRAPCONTAINER, flags);
		iType.stackable = hasBitSet(FLAG_STACKABLE, flags);

		iType.alwaysOnTop = hasBitSet(FLAG_ALWAYSONTOP, flags);
		iType.isVertical = hasBitSet(FLAG_VERTICAL, flags);
		iType.isHorizontal = hasBitSet(FLAG_HORIZONTAL, flags);
		iType.isHangable = hasBitSet(FLAG_HANGABLE, flags);
		iType.allowDistRead = hasBitSet(FLAG_ALLOWDISTREAD, flags);
		iType.rotatable = hasBitSet(FLAG_ROTATABLE, flags);
		iType.canReadText = hasBitSet(FLAG_READABLE, flags);
		iType.lookThrough = hasBitSet(FLAG_LOOKTHROUGH, flags);
		iType.isAnimation = hasBitSet(FLAG_ANIMATION, flags);
		// iType.walkStack = !hasBitSet(FLAG_FULLTILE, flags);
		iType.forceUse = hasBitSet(FLAG_FORCEUSE, flags);

		iType.id = serverId;
		iType.clientId = clientId;
		iType.speed = speed;
		iType.lightLevel = lightLevel;
		iType.lightColor = lightColor;
		iType.wareId = wareId;
		iType.alwaysOnTopOrder = alwaysOnTopOrder;
	}

	items.shrink_to_fit();
	return ERROR_NONE;
}

bool Items::loadFromXml()
{
	pugi::xml_document doc;
	pugi::xml_parse_result result = doc.load_file("data/items/items.xml");
	if (!result) {
		printXMLError("Error - Items::loadFromXml", "data/items/items.xml", result);
		return false;
	}

	for (auto itemNode : doc.child("items").children()) {
		pugi::xml_attribute idAttribute = itemNode.attribute("id");
		if (idAttribute) {
			parseItemNode(itemNode, pugi::cast<uint16_t>(idAttribute.value()));
			continue;
		}

		pugi::xml_attribute fromIdAttribute = itemNode.attribute("fromid");
		if (!fromIdAttribute) {
			if (idAttribute) {
				SPDLOG_WARN("[Items::loadFromXml] - "
                            "No item id: {} found",
                            idAttribute.value());
			} else {
				SPDLOG_WARN("[Items::loadFromXml] - No item id found");
			}
			continue;
		}

		pugi::xml_attribute toIdAttribute = itemNode.attribute("toid");
		if (!toIdAttribute) {
			SPDLOG_WARN("[Items::loadFromXml] - "
                        "tag fromid: {} without toid",
                        fromIdAttribute.value());
			continue;
		}

		uint16_t id = pugi::cast<uint16_t>(fromIdAttribute.value());
		uint16_t toId = pugi::cast<uint16_t>(toIdAttribute.value());
		while (id <= toId) {
			parseItemNode(itemNode, id++);
		}
	}
	return true;
}

void Items::buildInventoryList()
{
	inventory.reserve(items.size());
	for (const auto& type: items) {
		if (type.weaponType != WEAPON_NONE || type.ammoType != AMMO_NONE ||
			type.attack != 0 || type.defense != 0 ||
			type.extraDefense != 0 || type.armor != 0 ||
			type.slotPosition & SLOTP_NECKLACE ||
			type.slotPosition & SLOTP_RING ||
			type.slotPosition & SLOTP_AMMO ||
			type.slotPosition & SLOTP_FEET ||
			type.slotPosition & SLOTP_HEAD ||
			type.slotPosition & SLOTP_ARMOR ||
			type.slotPosition & SLOTP_LEGS)
		{
			inventory.push_back(type.clientId);
		}
	}
	inventory.shrink_to_fit();
	std::sort(inventory.begin(), inventory.end());
}

void Items::parseItemNode(const pugi::xml_node& itemNode, uint16_t id)
{
	if (id >= items.size()) {
		items.resize(id + 1);
	}
	ItemType& iType = items[id];
	iType.id = id;

	ItemType& it = getItemType(id);
	if (it.id == 0) {
		return;
	}

	if (!it.name.empty()) {
		SPDLOG_WARN("[Items::parseItemNode] - Duplicate item with id: {}", id);
		return;
	}

	it.name = itemNode.attribute("name").as_string();

	nameToItems.insert({ asLowerCaseString(it.name), id });

	pugi::xml_attribute articleAttribute = itemNode.attribute("article");
	if (articleAttribute) {
		it.article = articleAttribute.as_string();
	}

	pugi::xml_attribute pluralAttribute = itemNode.attribute("plural");
	if (pluralAttribute) {
		it.pluralName = pluralAttribute.as_string();
	}

	for (auto attributeNode : itemNode.children()) {
		pugi::xml_attribute keyAttribute = attributeNode.attribute("key");
		if (!keyAttribute) {
			continue;
		}

		pugi::xml_attribute valueAttribute = attributeNode.attribute("value");
		if (!valueAttribute) {
			continue;
		}

		std::string tmpStrValue = asLowerCaseString(keyAttribute.as_string());

		// Put here because have many conditions (C1601 - compiler limit: blocks nested too deeply)
		if (tmpStrValue == "type") {
			tmpStrValue = asLowerCaseString(valueAttribute.as_string());
			if (tmpStrValue == "key") {
				it.type = ITEM_TYPE_KEY;
			} else if (tmpStrValue == "magicfield") {
				it.type = ITEM_TYPE_MAGICFIELD;
			} else if (tmpStrValue == "container") {
				it.group = ITEM_GROUP_CONTAINER;
				it.type = ITEM_TYPE_CONTAINER;
			} else if (tmpStrValue == "depot") {
				it.type = ITEM_TYPE_DEPOT;
			} else if (tmpStrValue == "rewardchest") {
				it.type = ITEM_TYPE_REWARDCHEST;
			} else if (tmpStrValue == "carpet") {
				it.type = ITEM_TYPE_CARPET;
			} else if (tmpStrValue == "mailbox") {
				it.type = ITEM_TYPE_MAILBOX;
			} else if (tmpStrValue == "trashholder") {
				it.type = ITEM_TYPE_TRASHHOLDER;
			} else if (tmpStrValue == "teleport") {
				it.type = ITEM_TYPE_TELEPORT;
			} else if (tmpStrValue == "door") {
				it.type = ITEM_TYPE_DOOR;
			} else if (tmpStrValue == "bed") {
				it.type = ITEM_TYPE_BED;
			} else if (tmpStrValue == "rune") {
				it.type = ITEM_TYPE_RUNE;
			} else if (tmpStrValue == "supply") {
				it.type = ITEM_TYPE_SUPPLY;
			} else if (tmpStrValue == "creatureproduct") {
				it.type = ITEM_TYPE_CREATUREPRODUCT;
			} else if (tmpStrValue == "food") {
				it.type = ITEM_TYPE_FOOD;
			} else if (tmpStrValue == "valuable") {
				it.type = ITEM_TYPE_VALUABLE;
			} else if (tmpStrValue == "potion") {
				it.type = ITEM_TYPE_POTION;
			} else {
				SPDLOG_WARN("[Items::parseItemNode] - Unknown type: {}",
                            valueAttribute.as_string());
			}
		} else if (tmpStrValue == "description") {
			it.description = valueAttribute.as_string();
		} else if (tmpStrValue == "runespellname") {
			it.runeSpellName = valueAttribute.as_string();
		} else if (tmpStrValue == "weight") {
			it.weight = pugi::cast<uint32_t>(valueAttribute.value());
		} else if (tmpStrValue == "showcount") {
			it.showCount = valueAttribute.as_bool();
		} else if (tmpStrValue == "armor") {
			it.armor = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "defense") {
			it.defense = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "extradef") {
			it.extraDefense = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "attack") {
			it.attack = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "rotateto") {
			it.rotateTo = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "wrapcontainer") {
			it.wrapContainer = valueAttribute.as_bool();
		} else if (tmpStrValue == "imbuingslots") {
			it.imbuingSlots = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "wrapableto" || tmpStrValue == "unwrapableto") {
			it.wrapableTo = pugi::cast<int32_t>(valueAttribute.value());
			it.wrapable = true;
		} else if (tmpStrValue == "moveable" || tmpStrValue == "movable") {
			it.moveable = valueAttribute.as_bool();
		} else if (tmpStrValue == "ispodium") {
			it.isPodium = valueAttribute.as_bool();
		} else if (tmpStrValue == "blockprojectile") {
			it.blockProjectile = valueAttribute.as_bool();
		} else if (tmpStrValue == "allowpickupable" || tmpStrValue == "pickupable") {
			it.allowPickupable = valueAttribute.as_bool();
		} else if (tmpStrValue == "floorchange") {
			tmpStrValue = asLowerCaseString(valueAttribute.as_string());
			if (tmpStrValue == "down") {
				it.floorChange |= TILESTATE_FLOORCHANGE_DOWN;
			} else if (tmpStrValue == "north") {
				it.floorChange |= TILESTATE_FLOORCHANGE_NORTH;
			} else if (tmpStrValue == "south") {
				it.floorChange |= TILESTATE_FLOORCHANGE_SOUTH;
			} else if (tmpStrValue == "southalt") {
				it.floorChange |= TILESTATE_FLOORCHANGE_SOUTH_ALT;
			} else if (tmpStrValue == "west") {
				it.floorChange |= TILESTATE_FLOORCHANGE_WEST;
			} else if (tmpStrValue == "east") {
				it.floorChange |= TILESTATE_FLOORCHANGE_EAST;
			} else if (tmpStrValue == "eastalt") {
				it.floorChange |= TILESTATE_FLOORCHANGE_EAST_ALT;
			} else {
				SPDLOG_WARN("[Items::parseItemNode] - Unknown floorChange: {}",
                            valueAttribute.as_string());
			}
		} else if (tmpStrValue == "corpsetype") {
			tmpStrValue = asLowerCaseString(valueAttribute.as_string());
			if (tmpStrValue == "venom") {
				it.corpseType = RACE_VENOM;
			} else if (tmpStrValue == "blood") {
				it.corpseType = RACE_BLOOD;
			} else if (tmpStrValue == "undead") {
				it.corpseType = RACE_UNDEAD;
			} else if (tmpStrValue == "fire") {
				it.corpseType = RACE_FIRE;
			} else if (tmpStrValue == "energy") {
				it.corpseType = RACE_ENERGY;
			} else {
				SPDLOG_WARN("[Items::parseItemNode] - Unknown corpseType: {}",
                            valueAttribute.as_string());
			}
		} else if (tmpStrValue == "containersize") {
			it.maxItems = pugi::cast<uint16_t>(valueAttribute.value());
		} else if (tmpStrValue == "fluidsource") {
			tmpStrValue = asLowerCaseString(valueAttribute.as_string());
			if (tmpStrValue == "water") {
				it.fluidSource = FLUID_WATER;
			} else if (tmpStrValue == "blood") {
				it.fluidSource = FLUID_BLOOD;
			} else if (tmpStrValue == "beer") {
				it.fluidSource = FLUID_BEER;
			} else if (tmpStrValue == "slime") {
				it.fluidSource = FLUID_SLIME;
			} else if (tmpStrValue == "lemonade") {
				it.fluidSource = FLUID_LEMONADE;
			} else if (tmpStrValue == "milk") {
				it.fluidSource = FLUID_MILK;
			} else if (tmpStrValue == "mana") {
				it.fluidSource = FLUID_MANA;
			} else if (tmpStrValue == "life") {
				it.fluidSource = FLUID_LIFE;
			} else if (tmpStrValue == "oil") {
				it.fluidSource = FLUID_OIL;
			} else if (tmpStrValue == "urine") {
				it.fluidSource = FLUID_URINE;
			} else if (tmpStrValue == "coconut") {
				it.fluidSource = FLUID_COCONUTMILK;
			} else if (tmpStrValue == "wine") {
				it.fluidSource = FLUID_WINE;
			} else if (tmpStrValue == "mud") {
				it.fluidSource = FLUID_MUD;
			} else if (tmpStrValue == "fruitjuice") {
				it.fluidSource = FLUID_FRUITJUICE;
			} else if (tmpStrValue == "lava") {
				it.fluidSource = FLUID_LAVA;
			} else if (tmpStrValue == "rum") {
				it.fluidSource = FLUID_RUM;
			} else if (tmpStrValue == "swamp") {
				it.fluidSource = FLUID_SWAMP;
			} else if (tmpStrValue == "tea") {
				it.fluidSource = FLUID_TEA;
			} else if (tmpStrValue == "mead") {
				it.fluidSource = FLUID_MEAD;
			} else {
				SPDLOG_WARN("[Items::parseItemNode] - Unknown fluidSource: {}",
                            valueAttribute.as_string());
			}
		} else if (tmpStrValue == "readable") {
			it.canReadText = valueAttribute.as_bool();
		} else if (tmpStrValue == "writeable") {
			it.canWriteText = valueAttribute.as_bool();
			it.canReadText = it.canWriteText;
		} else if (tmpStrValue == "maxtextlen") {
			it.maxTextLen = pugi::cast<uint16_t>(valueAttribute.value());
		} else if (tmpStrValue == "writeonceitemid") {
			it.writeOnceItemId = pugi::cast<uint16_t>(valueAttribute.value());
		} else if (tmpStrValue == "weapontype") {
			tmpStrValue = asLowerCaseString(valueAttribute.as_string());
			if (tmpStrValue == "sword") {
				it.weaponType = WEAPON_SWORD;
			} else if (tmpStrValue == "club") {
				it.weaponType = WEAPON_CLUB;
			} else if (tmpStrValue == "axe") {
				it.weaponType = WEAPON_AXE;
			} else if (tmpStrValue == "shield") {
				it.weaponType = WEAPON_SHIELD;
			} else if (tmpStrValue == "distance") {
				it.weaponType = WEAPON_DISTANCE;
			} else if (tmpStrValue == "wand") {
				it.weaponType = WEAPON_WAND;
			} else if (tmpStrValue == "ammunition") {
				it.weaponType = WEAPON_AMMO;
      } else if (tmpStrValue == "quiver") {
				it.weaponType = WEAPON_QUIVER;
			} else {
				SPDLOG_WARN("[Items::parseItemNode] - Unknown weaponType: {}",
                            valueAttribute.as_string());
			}
		} else if (tmpStrValue == "slottype") {
			tmpStrValue = asLowerCaseString(valueAttribute.as_string());
			if (tmpStrValue == "head") {
				it.slotPosition |= SLOTP_HEAD;
			} else if (tmpStrValue == "body") {
				it.slotPosition |= SLOTP_ARMOR;
			} else if (tmpStrValue == "legs") {
				it.slotPosition |= SLOTP_LEGS;
			} else if (tmpStrValue == "feet") {
				it.slotPosition |= SLOTP_FEET;
			} else if (tmpStrValue == "backpack") {
				it.slotPosition |= SLOTP_BACKPACK;
			} else if (tmpStrValue == "two-handed") {
				it.slotPosition |= SLOTP_TWO_HAND;
			} else if (tmpStrValue == "right-hand") {
				it.slotPosition &= ~SLOTP_LEFT;
			} else if (tmpStrValue == "left-hand") {
				it.slotPosition &= ~SLOTP_RIGHT;
			} else if (tmpStrValue == "necklace") {
				it.slotPosition |= SLOTP_NECKLACE;
			} else if (tmpStrValue == "ring") {
				it.slotPosition |= SLOTP_RING;
			} else if (tmpStrValue == "ammo") {
				it.slotPosition |= SLOTP_AMMO;
			} else if (tmpStrValue == "hand") {
				it.slotPosition |= SLOTP_HAND;
			} else {
				SPDLOG_WARN("[Items::parseItemNode] - Unknown slotType: {}",
                            valueAttribute.as_string());
			}
		} else if (tmpStrValue == "ammotype") {
			it.ammoType = getAmmoType(asLowerCaseString(valueAttribute.as_string()));
			if (it.ammoType == AMMO_NONE) {
				SPDLOG_WARN("[Items::parseItemNode] - Unknown ammoType: {}",
                            valueAttribute.as_string());
			}
		} else if (tmpStrValue == "shoottype") {
			ShootType_t shoot = getShootType(asLowerCaseString(valueAttribute.as_string()));
			if (shoot != CONST_ANI_NONE) {
				it.shootType = shoot;
			} else {
				SPDLOG_WARN("[Items::parseItemNode] - Unknown shootType: {}",
                            valueAttribute.as_string());
			}
		} else if (tmpStrValue == "effect") {
			MagicEffectClasses effect = getMagicEffect(asLowerCaseString(valueAttribute.as_string()));
			if (effect != CONST_ME_NONE) {
				it.magicEffect = effect;
			} else {
				SPDLOG_WARN("[Items::parseItemNode] - Unknown effect: {}",
                            valueAttribute.as_string());
			}
		} else if (tmpStrValue == "loottype") {
			it.type = getLootType(valueAttribute.as_string());
		} else if (tmpStrValue == "range") {
			it.shootRange = pugi::cast<uint16_t>(valueAttribute.value());
		} else if (tmpStrValue == "stopduration") {
			it.stopTime = valueAttribute.as_bool();
		} else if (tmpStrValue == "decayto") {
			it.decayTo = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "transformequipto") {
			it.transformEquipTo = pugi::cast<uint16_t>(valueAttribute.value());
		} else if (tmpStrValue == "transformdeequipto") {
			it.transformDeEquipTo = pugi::cast<uint16_t>(valueAttribute.value());
		} else if (tmpStrValue == "duration") {
			it.decayTime = pugi::cast<uint32_t>(valueAttribute.value());
		} else if (tmpStrValue == "showduration") {
			it.showDuration = valueAttribute.as_bool();
		} else if (tmpStrValue == "charges") {
			it.charges = pugi::cast<uint32_t>(valueAttribute.value());
		} else if (tmpStrValue == "showcharges") {
			it.showCharges = valueAttribute.as_bool();
		} else if (tmpStrValue == "showattributes") {
			it.showAttributes = valueAttribute.as_bool();
		} else if (tmpStrValue == "hitchance") {
			it.hitChance = std::min<int8_t>(100, std::max<int8_t>(-100, pugi::cast<int16_t>(valueAttribute.value())));
		} else if (tmpStrValue == "maxhitchance") {
			it.maxHitChance = std::min<uint32_t>(100, pugi::cast<uint32_t>(valueAttribute.value()));
		} else if (tmpStrValue == "invisible") {
			it.getAbilities().invisible = valueAttribute.as_bool();
		} else if (tmpStrValue == "speed") {
			it.getAbilities().speed = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "healthgain") {
			Abilities& abilities = it.getAbilities();
			abilities.regeneration = true;
			abilities.healthGain = pugi::cast<uint32_t>(valueAttribute.value());
		} else if (tmpStrValue == "healthticks") {
			Abilities& abilities = it.getAbilities();
			abilities.regeneration = true;
			abilities.healthTicks = pugi::cast<uint32_t>(valueAttribute.value());
		} else if (tmpStrValue == "managain") {
			Abilities& abilities = it.getAbilities();
			abilities.regeneration = true;
			abilities.manaGain = pugi::cast<uint32_t>(valueAttribute.value());
		} else if (tmpStrValue == "manaticks") {
			Abilities& abilities = it.getAbilities();
			abilities.regeneration = true;
			abilities.manaTicks = pugi::cast<uint32_t>(valueAttribute.value());
		} else if (tmpStrValue == "manashield") {
			it.getAbilities().manaShield = valueAttribute.as_bool();
		} else if (tmpStrValue == "skillsword") {
			it.getAbilities().skills[SKILL_SWORD] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "skillaxe") {
			it.getAbilities().skills[SKILL_AXE] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "skillclub") {
			it.getAbilities().skills[SKILL_CLUB] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "skilldist") {
			it.getAbilities().skills[SKILL_DISTANCE] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "skillfish") {
			it.getAbilities().skills[SKILL_FISHING] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "skillshield") {
			it.getAbilities().skills[SKILL_SHIELD] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "skillfist") {
			it.getAbilities().skills[SKILL_FIST] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "skillcriticalchance") {
			it.getAbilities().skills[SKILL_CRITICAL_HIT_CHANCE] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "skillcriticaldamage") {
			it.getAbilities().skills[SKILL_CRITICAL_HIT_DAMAGE] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "skilllifechance") {
			it.getAbilities().skills[SKILL_LIFE_LEECH_CHANCE] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "skilllifeamount") {
			it.getAbilities().skills[SKILL_LIFE_LEECH_AMOUNT] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "skillmanachance") {
			it.getAbilities().skills[SKILL_MANA_LEECH_CHANCE] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "skillmanaamount") {
			it.getAbilities().skills[SKILL_MANA_LEECH_AMOUNT] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "maxhitpoints") {
			it.getAbilities().stats[STAT_MAXHITPOINTS] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "maxhitpointspercent") {
			it.getAbilities().statsPercent[STAT_MAXHITPOINTS] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "maxmanapoints") {
			it.getAbilities().stats[STAT_MAXMANAPOINTS] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "maxmanapointspercent") {
			it.getAbilities().statsPercent[STAT_MAXMANAPOINTS] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "magicpoints" || tmpStrValue == "magiclevelpoints") {
			it.getAbilities().stats[STAT_MAGICPOINTS] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "magicpointspercent") {
			it.getAbilities().statsPercent[STAT_MAGICPOINTS] = pugi::cast<int32_t>(valueAttribute.value());
		} else if (tmpStrValue == "fieldabsorbpercentenergy") {
			it.getAbilities().fieldAbsorbPercent[combatTypeToIndex(COMBAT_ENERGYDAMAGE)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "fieldabsorbpercentfire") {
			it.getAbilities().fieldAbsorbPercent[combatTypeToIndex(COMBAT_FIREDAMAGE)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "fieldabsorbpercentpoison" || tmpStrValue == "fieldabsorpercentearth") {
			it.getAbilities().fieldAbsorbPercent[combatTypeToIndex(COMBAT_EARTHDAMAGE)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "absorbpercentall" || tmpStrValue == "absorbpercentallelements") {
			int16_t value = pugi::cast<int16_t>(valueAttribute.value());
			Abilities& abilities = it.getAbilities();
			for (auto& i : abilities.absorbPercent) {
				i += value;
			}
		} else if (tmpStrValue == "absorbpercentelements") {
			int16_t value = pugi::cast<int16_t>(valueAttribute.value());
			Abilities& abilities = it.getAbilities();
			abilities.absorbPercent[combatTypeToIndex(COMBAT_ENERGYDAMAGE)] += value;
			abilities.absorbPercent[combatTypeToIndex(COMBAT_FIREDAMAGE)] += value;
			abilities.absorbPercent[combatTypeToIndex(COMBAT_EARTHDAMAGE)] += value;
			abilities.absorbPercent[combatTypeToIndex(COMBAT_ICEDAMAGE)] += value;
		} else if (tmpStrValue == "absorbpercentmagic") {
			int16_t value = pugi::cast<int16_t>(valueAttribute.value());
			Abilities& abilities = it.getAbilities();
			abilities.absorbPercent[combatTypeToIndex(COMBAT_ENERGYDAMAGE)] += value;
			abilities.absorbPercent[combatTypeToIndex(COMBAT_FIREDAMAGE)] += value;
			abilities.absorbPercent[combatTypeToIndex(COMBAT_EARTHDAMAGE)] += value;
			abilities.absorbPercent[combatTypeToIndex(COMBAT_ICEDAMAGE)] += value;
			abilities.absorbPercent[combatTypeToIndex(COMBAT_HOLYDAMAGE)] += value;
			abilities.absorbPercent[combatTypeToIndex(COMBAT_DEATHDAMAGE)] += value;
		} else if (tmpStrValue == "absorbpercentenergy") {
			it.getAbilities().absorbPercent[combatTypeToIndex(COMBAT_ENERGYDAMAGE)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "absorbpercentfire") {
			it.getAbilities().absorbPercent[combatTypeToIndex(COMBAT_FIREDAMAGE)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "absorbpercentpoison" ||	tmpStrValue == "absorbpercentearth") {
			it.getAbilities().absorbPercent[combatTypeToIndex(COMBAT_EARTHDAMAGE)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "absorbpercentice") {
			it.getAbilities().absorbPercent[combatTypeToIndex(COMBAT_ICEDAMAGE)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "absorbpercentholy") {
			it.getAbilities().absorbPercent[combatTypeToIndex(COMBAT_HOLYDAMAGE)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "absorbpercentdeath") {
			it.getAbilities().absorbPercent[combatTypeToIndex(COMBAT_DEATHDAMAGE)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "absorbpercentlifedrain") {
			it.getAbilities().absorbPercent[combatTypeToIndex(COMBAT_LIFEDRAIN)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "absorbpercentmanadrain") {
			it.getAbilities().absorbPercent[combatTypeToIndex(COMBAT_MANADRAIN)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "absorbpercentdrown") {
			it.getAbilities().absorbPercent[combatTypeToIndex(COMBAT_DROWNDAMAGE)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "absorbpercentphysical") {
			it.getAbilities().absorbPercent[combatTypeToIndex(COMBAT_PHYSICALDAMAGE)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "absorbpercenthealing") {
			it.getAbilities().absorbPercent[combatTypeToIndex(COMBAT_HEALING)] += pugi::cast<int16_t>(valueAttribute.value());
		} else if (tmpStrValue == "suppressdrunk") {
			if (valueAttribute.as_bool()) {
				it.getAbilities().conditionSuppressions |= CONDITION_DRUNK;
			}
		} else if (tmpStrValue == "suppressenergy") {
			if (valueAttribute.as_bool()) {
				it.getAbilities().conditionSuppressions |= CONDITION_ENERGY;
			}
		} else if (tmpStrValue == "suppressfire") {
			if (valueAttribute.as_bool()) {
				it.getAbilities().conditionSuppressions |= CONDITION_FIRE;
			}
		} else if (tmpStrValue == "suppresspoison") {
			if (valueAttribute.as_bool()) {
				it.getAbilities().conditionSuppressions |= CONDITION_POISON;
			}
		} else if (tmpStrValue == "suppressdrown") {
			if (valueAttribute.as_bool()) {
				it.getAbilities().conditionSuppressions |= CONDITION_DROWN;
			}
		} else if (tmpStrValue == "suppressphysical") {
			if (valueAttribute.as_bool()) {
				it.getAbilities().conditionSuppressions |= CONDITION_BLEEDING;
			}
		} else if (tmpStrValue == "suppressfreeze") {
			if (valueAttribute.as_bool()) {
				it.getAbilities().conditionSuppressions |= CONDITION_FREEZING;
			}
		} else if (tmpStrValue == "suppressdazzle") {
			if (valueAttribute.as_bool()) {
				it.getAbilities().conditionSuppressions |= CONDITION_DAZZLED;
			}
		} else if (tmpStrValue == "suppresscurse") {
			if (valueAttribute.as_bool()) {
				it.getAbilities().conditionSuppressions |= CONDITION_CURSED;
			}
		} else if (tmpStrValue == "field") {
			it.group = ITEM_GROUP_MAGICFIELD;
			it.type = ITEM_TYPE_MAGICFIELD;

			CombatType_t combatType = COMBAT_NONE;
			ConditionDamage* conditionDamage = nullptr;

			tmpStrValue = asLowerCaseString(valueAttribute.as_string());
			if (tmpStrValue == "fire") {
				conditionDamage = new ConditionDamage(CONDITIONID_COMBAT, CONDITION_FIRE);
				combatType = COMBAT_FIREDAMAGE;
			} else if (tmpStrValue == "energy") {
				conditionDamage = new ConditionDamage(CONDITIONID_COMBAT, CONDITION_ENERGY);
				combatType = COMBAT_ENERGYDAMAGE;
			} else if (tmpStrValue == "poison") {
				conditionDamage = new ConditionDamage(CONDITIONID_COMBAT, CONDITION_POISON);
				combatType = COMBAT_EARTHDAMAGE;
			} else if (tmpStrValue == "drown") {
				conditionDamage = new ConditionDamage(CONDITIONID_COMBAT, CONDITION_DROWN);
				combatType = COMBAT_DROWNDAMAGE;
			} else if (tmpStrValue == "physical") {
				conditionDamage = new ConditionDamage(CONDITIONID_COMBAT, CONDITION_BLEEDING);
				combatType = COMBAT_PHYSICALDAMAGE;
			} else {
				SPDLOG_WARN("[Items::parseItemNode] Unknown field value: {}",
                            valueAttribute.as_string());
			}

			if (combatType != COMBAT_NONE) {
				it.combatType = combatType;
				it.conditionDamage.reset(conditionDamage);
				uint32_t ticks = 0;
				int32_t damage = 0;
				int32_t start = 0;
				int32_t count = 1;

				for (auto subAttributeNode : attributeNode.children()) {
					pugi::xml_attribute subKeyAttribute = subAttributeNode.attribute("key");
					if (!subKeyAttribute) {
						continue;
					}

					pugi::xml_attribute subValueAttribute = subAttributeNode.attribute("value");
					if (!subValueAttribute) {
						continue;
					}

					tmpStrValue = asLowerCaseString(subKeyAttribute.as_string());
					if (tmpStrValue == "ticks") {
						ticks = pugi::cast<uint32_t>(subValueAttribute.value());
					} else if (tmpStrValue == "count") {
						count = std::max<int32_t>(1, pugi::cast<int32_t>(subValueAttribute.value()));
					} else if (tmpStrValue == "start") {
						start = std::max<int32_t>(0, pugi::cast<int32_t>(subValueAttribute.value()));
					} else if (tmpStrValue == "damage") {
						damage = -pugi::cast<int32_t>(subValueAttribute.value());

						if (start > 0) {
							std::list<int32_t> damageList;
							ConditionDamage::generateDamageList(damage, start, damageList);
							for (int32_t damageValue : damageList) {
								conditionDamage->addDamage(1, ticks, -damageValue);
							}

							start = 0;
						} else {
							conditionDamage->addDamage(count, ticks, damage);
						}
					}
				}

				conditionDamage->setParam(CONDITION_PARAM_FIELD, 1);

				if (conditionDamage->getTotalDamage() > 0) {
					conditionDamage->setParam(CONDITION_PARAM_FORCEUPDATE, 1);
				}
			}
		} else if (tmpStrValue == "replaceable") {
			it.replaceable = valueAttribute.as_bool();
		} else if (tmpStrValue == "partnerdirection") {
			it.bedPartnerDir = getDirection(valueAttribute.as_string());
		} else if (tmpStrValue == "leveldoor") {
			it.levelDoor = pugi::cast<uint32_t>(valueAttribute.value());
		} else if (tmpStrValue == "maletransformto" || tmpStrValue == "malesleeper") {
			uint16_t value = pugi::cast<uint16_t>(valueAttribute.value());
			it.transformToOnUse[PLAYERSEX_MALE] = value;
			ItemType& other = getItemType(value);
			if (other.transformToFree == 0) {
				other.transformToFree = it.id;
			}

			if (it.transformToOnUse[PLAYERSEX_FEMALE] == 0) {
				it.transformToOnUse[PLAYERSEX_FEMALE] = value;
			}
		} else if (tmpStrValue == "femaletransformto" || tmpStrValue == "femalesleeper") {
			uint16_t value = pugi::cast<uint16_t>(valueAttribute.value());
			it.transformToOnUse[PLAYERSEX_FEMALE] = value;

			ItemType& other = getItemType(value);
			if (other.transformToFree == 0) {
				other.transformToFree = it.id;
			}

			if (it.transformToOnUse[PLAYERSEX_MALE] == 0) {
				it.transformToOnUse[PLAYERSEX_MALE] = value;
			}
		} else if (tmpStrValue == "transformto") {
			it.transformToFree = pugi::cast<uint16_t>(valueAttribute.value());
		} else if (tmpStrValue == "destroyto") {
			it.destroyTo = pugi::cast<uint16_t>(valueAttribute.value());
		} else if (tmpStrValue == "elementice") {
			Abilities& abilities = it.getAbilities();
			abilities.elementDamage = pugi::cast<uint16_t>(valueAttribute.value());
			abilities.elementType = COMBAT_ICEDAMAGE;
		} else if (tmpStrValue == "elementearth") {
			Abilities& abilities = it.getAbilities();
			abilities.elementDamage = pugi::cast<uint16_t>(valueAttribute.value());
			abilities.elementType = COMBAT_EARTHDAMAGE;
		} else if (tmpStrValue == "elementfire") {
			Abilities& abilities = it.getAbilities();
			abilities.elementDamage = pugi::cast<uint16_t>(valueAttribute.value());
			abilities.elementType = COMBAT_FIREDAMAGE;
		} else if (tmpStrValue == "elementenergy") {
			Abilities& abilities = it.getAbilities();
			abilities.elementDamage = pugi::cast<uint16_t>(valueAttribute.value());
			abilities.elementType = COMBAT_ENERGYDAMAGE;
		} else if (tmpStrValue == "elementdeath") {
			Abilities& abilities = it.getAbilities();
			abilities.elementDamage = pugi::cast<uint16_t>(valueAttribute.value());
			abilities.elementType = COMBAT_DEATHDAMAGE;
		} else if (tmpStrValue == "elementholy") {
			Abilities& abilities = it.getAbilities();
			abilities.elementDamage = pugi::cast<uint16_t>(valueAttribute.value());
			abilities.elementType = COMBAT_HOLYDAMAGE;
		} else if (tmpStrValue == "walkstack") {
			it.walkStack = valueAttribute.as_bool();
		} else if (tmpStrValue == "blocking") {
			it.blockSolid = valueAttribute.as_bool();
		} else if (tmpStrValue == "allowdistread") {
			it.allowDistRead = booleanString(valueAttribute.as_string());
		} else {
			SPDLOG_WARN("[Items::parseItemNode] - Unknown key value: {}",
                        keyAttribute.as_string());
		}
	}

	//check bed items
	if ((it.transformToFree != 0 || it.transformToOnUse[PLAYERSEX_FEMALE] != 0 || it.transformToOnUse[PLAYERSEX_MALE] != 0) && it.type != ITEM_TYPE_BED) {
		SPDLOG_WARN("[Items::parseItemNode] - Item {} is not set as a bed-type", it.id);
	}
}

ItemType& Items::getItemType(size_t id)
{
	if (id < items.size()) {
		return items[id];
	}
	return items.front();
}

const ItemType& Items::getItemType(size_t id) const
{
	if (id < items.size()) {
		return items[id];
	}
	return items.front();
}

const ItemType& Items::getItemIdByClientId(uint16_t spriteId) const
{
	auto it = reverseItemMap.find(spriteId);
	if (it != reverseItemMap.end()) {
		return getItemType(it->second);
	}
	return items.front();
}

uint16_t Items::getItemIdByName(const std::string& name)
{
	auto result = nameToItems.find(asLowerCaseString(name));

	if (result == nameToItems.end())
		return 0;

	return result->second;
}
