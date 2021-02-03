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

#ifndef FS_TASKS_H_A66AC384766041E59DCA059DAB6E1976
#define FS_TASKS_H_A66AC384766041E59DCA059DAB6E1976

#include "thread_holder_base.h"
#include "enums.h"

class Dispatcher : public ThreadHolder<Dispatcher> {
	public:
		#if BOOST_VERSION >= 106600
		Dispatcher() : work(boost::asio::make_work_guard(io_service)) {}
		#else
		Dispatcher() : work(std::make_shared<boost::asio::io_service::work>(io_service)) {}
		#endif

		// Singleton - ensures we don't accidentally copy it
		Dispatcher(Dispatcher const&) = delete;
		void operator=(Dispatcher const&) = delete;

		static Dispatcher& getInstance() {
			// Guaranteed to be destroyed
			static Dispatcher instance;
			// Instantiated on first use
			return instance;
		}

		void addTask(std::function<void (void)> functor);
		uint64_t addEvent(uint32_t delay, std::function<void (void)> functor);
		void stopEvent(uint64_t eventId);

		void shutdown();

		uint64_t getDispatcherCycle() const {
			return dispatcherCycle;
		}

		void threadMain();

	private:
		uint64_t lastEventId = 0;
		uint64_t dispatcherCycle = 0;
		std::map<uint64_t, boost::asio::deadline_timer> eventIds;
		boost::asio::io_service io_service;
		#if BOOST_VERSION >= 106600
		boost::asio::executor_work_guard<boost::asio::io_context::executor_type> work;
		#else
		std::shared_ptr<boost::asio::io_service::work> work;
		#endif
};

constexpr auto g_dispatcher = &Dispatcher::getInstance;

#endif
