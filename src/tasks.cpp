/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2021 Mark Samman <mark.samman@gmail.com>
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

#include "tasks.h"
#include "game.h"

void Dispatcher::threadMain()
{
	io_service.run();
	g_database().disconnect();
}

void Dispatcher::addTask(std::function<void (void)> functor)
{
	#if BOOST_VERSION >= 106600
	boost::asio::post(io_service,
	#else
	io_service.post(
	#endif
	#ifdef __cpp_generic_lambdas
	[this, f = std::move(functor)]() {
		++dispatcherCycle;

		// execute it
		(f)();
	});
	#else
	[this, functor]() {
		++dispatcherCycle;

		// execute it
		(functor)();
	});
	#endif
}

uint64_t Dispatcher::addEvent(uint32_t delay, std::function<void (void)> functor)
{
	if (getState() == THREAD_STATE_TERMINATED) {
		return 0;
	}

	uint64_t eventId = ++lastEventId;
	auto res = eventIds.emplace(std::piecewise_construct, std::forward_as_tuple(eventId), std::forward_as_tuple(io_service));

	boost::asio::deadline_timer& timer = res.first->second;
	timer.expires_from_now(boost::posix_time::milliseconds(delay));
	#ifdef __cpp_generic_lambdas
	timer.async_wait([this, eventId, f = std::move(functor)](const boost::system::error_code& error) {
	#else
	timer.async_wait([this, eventId, functor](const boost::system::error_code& error) {
	#endif
		eventIds.erase(eventId);

		if (error == boost::asio::error::operation_aborted || getState() == THREAD_STATE_TERMINATED) {
			return;
		}

		// execute it
		++dispatcherCycle;
		#ifdef __cpp_generic_lambdas
		(f)();
		#else
		(functor)();
		#endif
	});

	return eventId;
}

void Dispatcher::stopEvent(uint64_t eventId)
{
	auto it = eventIds.find(eventId);
	if (it != eventIds.end()) {
		it->second.cancel();
	}
}

void Dispatcher::shutdown()
{
	setState(THREAD_STATE_TERMINATED);
	#if BOOST_VERSION >= 106600
	boost::asio::post(io_service,
	#else
	io_service.post(
	#endif
	[this]() {
		for (auto& it : eventIds) {
			it.second.cancel();
		}

		work.reset();
	});
}
