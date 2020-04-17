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

#include "trashholder.h"
#include "game.h"

extern Game g_game;

ReturnValue TrashHolder::queryAdd(int32_t /*index*/, const Thing& /*thing*/, uint32_t /*count*/, uint32_t /*flags*/, Creature* /*actor*/) const
{
	return RETURNVALUE_NOERROR;
}

ReturnValue TrashHolder::queryMaxCount(int32_t /*index*/, const Thing& /*thing*/, uint32_t queryCount, uint32_t& maxQueryCount, uint32_t /*flags*/) const
{
	maxQueryCount = std::max<uint32_t>(1, queryCount);
	return RETURNVALUE_NOERROR;
}

ReturnValue TrashHolder::queryRemove(const Thing& /*thing*/, uint32_t /*count*/, uint32_t /*flags*/) const
{
	return RETURNVALUE_NOTPOSSIBLE;
}

Cylinder* TrashHolder::queryDestination(int32_t& /*index*/, const Thing& /*thing*/, Item** /*destItem*/, uint32_t& /*flags*/)
{
	return this;
}

void TrashHolder::addThing(Thing* thing)
{
	return addThing(0, thing);
}

void TrashHolder::addThing(int32_t /*index*/, Thing* thing)
{
	Item* item = thing->getItem();
	if (item == nullptr) {
		return;
	}

	if (item == this || !item->hasProperty(CONST_PROP_MOVEABLE)) {
		return;
	}

	const ItemType& it = Item::items[id];
	if (item->isHangable() && it.isGroundTile()) {
		Tile* tile = dynamic_cast<Tile*>(getParent());
		if ((tile != nullptr) && tile->hasFlag(TILESTATE_SUPPORTS_HANGABLE)) {
			return;
		}
	}

	g_game.internalRemoveItem(item);

	if (it.magicEffect != CONST_ME_NONE) {
		g_game.addMagicEffect(getPosition(), it.magicEffect);
	}
}

void TrashHolder::updateThing(Thing* /*thing*/, uint16_t /*itemId*/, uint32_t /*count*/)
{
	//
}

void TrashHolder::replaceThing(uint32_t /*index*/, Thing* /*thing*/)
{
	//
}

void TrashHolder::removeThing(Thing* /*thing*/, uint32_t /*count*/)
{
	//
}

void TrashHolder::postAddNotification(Thing* thing, const Cylinder* oldParent, int32_t index, cylinderlink_t /*link*/)
{
	getParent()->postAddNotification(thing, oldParent, index, LINK_PARENT);
}

void TrashHolder::postRemoveNotification(Thing* thing, const Cylinder* newParent, int32_t index, cylinderlink_t /*link*/)
{
	getParent()->postRemoveNotification(thing, newParent, index, LINK_PARENT);
}
