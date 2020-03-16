#ifndef FS_GAMESERVERCONFIG_H_894F156B2E12DD15618EFFB512180EA0
#define FS_GAMESERVERCONFIG_H_894F156B2E12DD15618EFFB512180EA0
	struct GameServer {
		std::string name;
		std::string ip;

		uint16_t worldid;
		uint16_t port;
	};

	class GameserverConfig
	{
		public:
			GameserverConfig();

			bool load();
			bool reload();
			const char* getServerIp(uint16_t id);
			uint16_t getServerPort(uint16_t id);
			std::string getServerName(uint16_t id);
			uint16_t getWorldId();
			void setWorldId(uint16_t id);

			std::vector<GameServer> getGameservers() { return gameservers; }

		private:
			std::vector<GameServer> gameservers;
			std::map<uint16_t, const char*> serverIp;
			std::map<uint16_t, std::string> serverName;
			std::map<uint16_t, uint16_t> serverPort;
			uint16_t worldId;
			bool loaded;
	};

#endif
