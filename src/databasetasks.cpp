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

#include "databasetasks.h"
#include "tasks.h"

void DatabaseTasks::threadMain()
{
	std::unique_lock<std::mutex> taskLockUnique(taskLock, std::defer_lock);
	db.connect();

	while (getState() != THREAD_STATE_TERMINATED) {
		taskLockUnique.lock();
		if (tasks.empty()) {
			if (flushTasks) {
				flushSignal.notify_one();
			}
			taskSignal.wait(taskLockUnique);
		}

		if (!tasks.empty()) {
			DatabaseTask task = std::move(tasks.front());
			tasks.pop_front();
			taskLockUnique.unlock();
			runTask(task);
		} else {
			taskLockUnique.unlock();
		}
	}

	db.disconnect();
}

void DatabaseTasks::addTask(std::string query, std::function<void(DBResult_ptr, bool)> callback/* = nullptr*/, bool store/* = false*/)
{
	bool signal = false;
	taskLock.lock();
	if (getState() == THREAD_STATE_RUNNING) {
		signal = tasks.empty();
		tasks.emplace_back(std::move(query), std::move(callback), store);
	}
	taskLock.unlock();

	if (signal) {
		taskSignal.notify_one();
	}
}

void DatabaseTasks::runTask(const DatabaseTask& task)
{
	bool success;
	DBResult_ptr result;
	if (task.store) {
		result = db.storeQuery(task.query);
		success = true;
	} else {
		result = nullptr;
		success = db.executeQuery(task.query);
	}

	if (task.callback) {
		g_dispatcher().addTask(std::bind(task.callback, result, success));
	}
}

void DatabaseTasks::flush()
{
	std::unique_lock<std::mutex> guard{ taskLock };
	if (!tasks.empty()) {
		flushTasks = true;
		flushSignal.wait(guard);
		flushTasks = false;
	}
}

void DatabaseTasks::shutdown()
{
	flush();
	setState(THREAD_STATE_TERMINATED);
	taskSignal.notify_one();
}
