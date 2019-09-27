/**
 * @file mailbox.cpp
 * 
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2019 Mark Samman <mark.samman@gmail.com>
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

#include "mailbox.h"
#include "game.h"
#include "iologindata.h"

extern Game g_game;

ReturnValue Mailbox::queryAdd(int32_t, const Thing& thing, uint32_t, uint32_t, Creature*) const
{
	const Item* item = thing.getItem();
	if (item && Mailbox::canSend(item)) {
		return RETURNVALUE_NOERROR;
	}
	return RETURNVALUE_NOTPOSSIBLE;
}

ReturnValue Mailbox::queryMaxCount(int32_t, const Thing&, uint32_t amount, uint32_t& maxQueryCount, uint32_t) const
{
	maxQueryCount = std::max<uint32_t>(1, amount);
	return RETURNVALUE_NOERROR;
}

ReturnValue Mailbox::queryRemove(const Thing&, uint32_t, uint32_t) const
{
	return RETURNVALUE_NOTPOSSIBLE;
}

Cylinder* Mailbox::queryDestination(int32_t&, const Thing&, Item**, uint32_t&)
{
	return this;
}

void Mailbox::addThing(Thing* thing)
{
	return addThing(0, thing);
}

void Mailbox::addThing(int32_t, Thing* thing)
{
	Item* item = thing->getItem();
	if (item && Mailbox::canSend(item)) {
		sendItem(item);
	}
}

void Mailbox::updateThing(Thing*, uint16_t, uint32_t)
{
	//
}

void Mailbox::replaceThing(uint32_t, Thing*)
{
	//
}

void Mailbox::removeThing(Thing*, uint32_t)
{
	//
}

void Mailbox::postAddNotification(Thing* thing, const Cylinder* oldParent, int32_t index, cylinderlink_t)
{
	getParent()->postAddNotification(thing, oldParent, index, LINK_PARENT);
}

void Mailbox::postRemoveNotification(Thing* thing, const Cylinder* newParent, int32_t index, cylinderlink_t)
{
	getParent()->postRemoveNotification(thing, newParent, index, LINK_PARENT);
}

bool Mailbox::sendItem(Item* item) const
{
	std::string receiver;
	if (!getReceiver(item, receiver)) {
		return false;
	}

	/**No need to continue if its still empty**/
	if (receiver.empty()) {
		return false;
	}

	Player* player = g_game.getPlayerByName(receiver);
	if (player) {
		if (g_game.internalMoveItem(item->getParent(), player->getInbox(), INDEX_WHEREEVER,
									item, item->getItemCount(), nullptr, FLAG_NOLIMIT) == RETURNVALUE_NOERROR) {
			g_game.transformItem(item, item->getID() + 1);
			player->onReceiveMail();
			return true;
		}
	} else {
		Player tmpPlayer(nullptr);
		if (!IOLoginData::loadPlayerByName(&tmpPlayer, receiver)) {
			return false;
		}

		if (g_game.internalMoveItem(item->getParent(), tmpPlayer.getInbox(), INDEX_WHEREEVER,
									item, item->getItemCount(), nullptr, FLAG_NOLIMIT) == RETURNVALUE_NOERROR) {
			g_game.transformItem(item, item->getID() + 1);
			IOLoginData::savePlayer(&tmpPlayer);
			return true;
		}
	}
	return false;
}

bool Mailbox::getReceiver(Item* item, std::string& name) const
{
	const Container* container = item->getContainer();
	if (container) {
		for (Item* containerItem : container->getItemList()) {
			if (containerItem->getID() == ITEM_LABEL && getReceiver(containerItem, name)) {
				return true;
			}
		}
		return false;
	}

	const std::string& text = item->getText();
	if (text.empty()) {
		return false;
	}

	name = getFirstLine(text);
	trimString(name);
	return true;
}

bool Mailbox::canSend(const Item* item)
{
	return item->getID() == ITEM_PARCEL || item->getID() == ITEM_LETTER;
}
