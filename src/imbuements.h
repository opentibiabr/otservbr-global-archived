/**
* Credits: Yamaken
* Credits: Cjaker
* Rewrite: LucasCPrazeres
*/

#ifndef FS_IMBUEMENT_H
#define FS_IMBUEMENT_H

#include "player.h"
#include "enums.h"
#include "tools.h"

class Player;
class Item;

class Imbuement;

struct BaseImbue {
	BaseImbue(uint16_t id, std::string name, uint32_t protection, uint32_t price, uint32_t removecust, int32_t duration, uint16_t percent) :
		id(id), name(std::move(name)), protection(protection), price(price), removecust(removecust), duration(duration), percent(percent) {}

	uint16_t id;
	std::string name;
	uint32_t protection;
	uint32_t price;
	uint32_t removecust;
	int32_t duration;
	uint16_t percent;
};

struct Category {
	Category(uint16_t id, std::string name) :
		id(id), name(std::move(name)) {}

	uint16_t id;
	std::string name;
};

class Imbuements {
	public:
		bool loadFromXml(bool reloading = false);
		bool reload();

		Imbuement* getImbuement(uint16_t id);

		BaseImbue* getBaseByID(uint16_t id);
		Category* getCategoryByID(uint16_t id);
		std::vector<Imbuement*> getImbuements(Player* player, Item* item);

	protected:
		friend class Imbuement;

		std::map<uint32_t, Imbuement> imbues;
		std::vector<BaseImbue> bases;
		std::vector<Category> categories;

		bool loaded = false;

	private:
		uint32_t runningid = 0;

};

class Imbuement
{
	public:
		Imbuement(uint16_t id, uint16_t baseid) : 
				id(id), baseid(baseid) {}

		uint16_t getId() const {
			return id;
		}

		uint16_t getBaseID() const {
			return baseid;
		}

		bool isPremium() {
			return premium;
		}
		std::string getName() const {
			return name;
		}
		std::string getDescription() const {
			return description;
		}

		std::string getSubGroup() const {
			return subgroup;
		}

		uint16_t getCategory() const {
			return category;
		}

		const std::vector<std::pair<uint16_t, uint16_t>>& getItems() const {
			return items;
		}

		uint16_t getIconID() {
			return icon + (baseid - 1);
		}

		uint16_t icon = 1;
		int32_t stats[STAT_LAST + 1] = {};
		int32_t skills[SKILL_LAST + 1] = {};
		int32_t speed = 0;
		uint32_t capacity = 0;
		int16_t absorbPercent[COMBAT_COUNT] = {};
		int16_t elementDamage = 0;

		CombatType_t combatType = COMBAT_NONE;

	protected:
		friend class Imbuements;
		friend class Item;

	private:
		bool premium = false;
		uint16_t id, baseid, category = 0;
		std::string name, description, subgroup = "";

		std::vector<std::pair<uint16_t, uint16_t>> items;
};

#endif
