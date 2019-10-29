/**
 * @file protocol.h
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

#ifndef OT_SRC_PROTOCOL_H_
#define OT_SRC_PROTOCOL_H_

#include "connection.h"

class Protocol : public std::enable_shared_from_this<Protocol>
{
	public:
		explicit Protocol(Connection_ptr initConnection) : connection(initConnection) {}
		virtual ~Protocol() = default;

		// non-copyable
		Protocol(const Protocol&) = delete;
		Protocol& operator=(const Protocol&) = delete;

		virtual void parsePacket(NetworkMessage&) {}

		virtual void onSendMessage(const OutputMessage_ptr& msg);
		void onRecvMessage(NetworkMessage& msg);
		virtual void onRecvFirstMessage(NetworkMessage& msg) = 0;
		virtual void onConnect() {}

		bool isConnectionExpired() const {
			return connection.expired();
		}

		Connection_ptr getConnection() const {
			return connection.lock();
		}

		uint32_t getIP() const;

		//Use this function for autosend messages only
		OutputMessage_ptr getOutputBuffer(int32_t size);

		OutputMessage_ptr& getCurrentBuffer() {
			return outputBuffer;
		}

		void send(OutputMessage_ptr msg) const {
			if (auto conn = getConnection()) {
				conn->send(msg);
			}
		}

	protected:
		void disconnect() const {
			if (auto conn = getConnection()) {
				conn->close();
			}
		}
		void enableXTEAEncryption() {
			encryptionEnabled = true;
		}
		void setXTEAKey(const uint32_t* newKey) {
			memcpy(this->key, newKey, sizeof(*newKey) * 4);
		}
		void disableChecksum() {
			checksumEnabled = false;
		}
		void enableCompact() {
			compactCrypt = true;
		}
		bool isCompact() {
			return compactCrypt;
		}

		void XTEA_encrypt(OutputMessage& msg) const;
		bool XTEA_decrypt(NetworkMessage& msg) const;
		static bool RSA_decrypt(NetworkMessage& msg);

		void setRawMessages(bool value) {
			rawMessages = value;
		}

		virtual void release() {}
		friend class Connection;

		OutputMessage_ptr outputBuffer;
	private:
		const ConnectionWeak_ptr connection;
		uint32_t key[4] = {};
		uint32_t sequenceNumber = 0;
		bool encryptionEnabled = false;
		bool checksumEnabled = true;
		bool compactCrypt = false;
		bool rawMessages = false;
};

#endif
