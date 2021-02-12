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

#ifndef FS_PROTOCOL_H_D71405071ACF4137A4B1203899DE80E1
#define FS_PROTOCOL_H_D71405071ACF4137A4B1203899DE80E1

#include <zlib.h>

#include "connection.h"

class Protocol : public std::enable_shared_from_this<Protocol>
{
	public:
		explicit Protocol(Connection_ptr connection) : connection(connection) {}
		virtual ~Protocol();

		// non-copyable
		Protocol(const Protocol&) = delete;
		Protocol& operator=(const Protocol&) = delete;

		enum ChecksumMethods_t : uint8_t {
			CHECKSUM_METHOD_NONE,
			CHECKSUM_METHOD_ADLER32,
			CHECKSUM_METHOD_SEQUENCE
		};

		virtual void parsePacket(NetworkMessage&) {}

		virtual void onSendMessage(const OutputMessage_ptr& msg);
		bool onRecvMessage(NetworkMessage& msg);
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
			if (auto connection = getConnection()) {
				connection->send(msg);
			}
		}

	protected:
		void disconnect() const {
			if (auto connection = getConnection()) {
				connection->close();
			}
		}
		void enableXTEAEncryption() {
			encryptionEnabled = true;
		}
		void setXTEAKey(const uint32_t* key) {
			memcpy(this->key, key, sizeof(*key) * 4);
		}
		void setChecksumMethod(ChecksumMethods_t method) {
			checksumMethod = method;
		}
		void enableCompression();

		static bool RSA_decrypt(NetworkMessage& msg);

		void setRawMessages(bool value) {
			rawMessages = value;
		}

		virtual void release() {}

	private:
		void XTEA_encrypt(OutputMessage& msg) const;
		bool XTEA_decrypt(NetworkMessage& msg) const;
		bool compression(OutputMessage& msg);

		friend class Connection;

		OutputMessage_ptr outputBuffer;
		std::unique_ptr<z_stream> defStream;

		const ConnectionWeak_ptr connection;
		uint32_t key[4] = {};
		uint32_t serverSequenceNumber = 0;
		uint32_t clientSequenceNumber = 0;
		std::underlying_type<ChecksumMethods_t>::type checksumMethod = CHECKSUM_METHOD_NONE;
		bool encryptionEnabled = false;
		bool rawMessages = false;
		bool compreesionEnabled = false;
};

#endif
