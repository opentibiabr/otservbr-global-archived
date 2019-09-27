/**
 * @file wildcardtree.h
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

#ifndef OT_SRC_WILDCARDTREE_H_
#define OT_SRC_WILDCARDTREE_H_

#include "enums.h"

class WildcardTreeNode
{
	public:
		explicit WildcardTreeNode(bool initBreakpoint) : breakpoint(initBreakpoint) {}
		WildcardTreeNode(WildcardTreeNode&& other) = default;

		// non-copyable
		WildcardTreeNode(const WildcardTreeNode&) = delete;
		WildcardTreeNode& operator=(const WildcardTreeNode&) = delete;

		WildcardTreeNode* getChild(char ch);
		const WildcardTreeNode* getChild(char ch) const;
		WildcardTreeNode* addChild(char ch, bool breakpoint);

		void insert(const std::string& str);
		void remove(const std::string& str);

		ReturnValue findOne(const std::string& query, std::string& result) const;

	private:
		std::map<char, WildcardTreeNode> children;
		bool breakpoint;
};

#endif
