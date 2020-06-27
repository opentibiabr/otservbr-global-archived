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

#ifndef FS_OTPCH_H_F00C737DA6CA4C8D90F57430C614367F
#define FS_OTPCH_H_F00C737DA6CA4C8D90F57430C614367F

// Definitions should be global.
#include "definitions.h"

#include <algorithm>
#include <chrono>
#include <cstdint>
#include <forward_list>
#include <functional>
#include <iomanip>
#include <iostream>
#include <list>
#include <map>
#include <memory>
#include <mutex>
#include <sstream>
#include <string>
#include <thread>
#include <unordered_map>
#include <vector>

#include <boost/asio.hpp>

#include <pugixml.hpp>


// Log library
#ifdef DEBUG_LOG
	// DLOG_F(verbosity_name, fmt, ...)
	// DVLOG_F(verbosity, fmt, ...)
	// DLOG_IF_F(verbosity_name, cond, fmt, ...)
	// DVLOG_IF_F(verbosity, cond, fmt, ...)
	// DRAW_LOG_F(verbosity_name, fmt, ...)
	// DRAW_VLOG_F(verbosity, fmt, ...)
	#define LOGURU_DEBUG_LOGGING 1
#endif
// #define LOGURU_WITH_STREAMS 1
#include "loguru.h"

#endif
