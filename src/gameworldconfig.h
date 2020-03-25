// Original idea and template by Milice, continued and completed by Aurelion5670

#ifndef FS_GAMEWORLDCONFIG_H_8675309REMEMBER0MILICE0COVID2019
#define FS_GAMEWORLDCONFIG_H_8675309REMEMBER0MILICE0COVID2019
	struct GameWorld {
		std::string name;
		std::string ip;

		uint16_t worldid;
		uint16_t port;
	};

	class GameWorldConfig
	{
		public:
			GameWorldConfig();

			bool load();
			bool reload();
			const char* getWorldIp(uint16_t id);
			uint16_t getWorldPort(uint16_t id);
			std::string getWorldName(uint16_t id);
			uint16_t getWorldId();
			void setWorldId(uint16_t id);

			std::vector<GameWorld> getGameworlds() { return gameworlds; }

		private:
			std::vector<GameWorld> gameworlds;
			std::map<uint16_t, const char*> worldIp;
			std::map<uint16_t, std::string> worldName;
			std::map<uint16_t, uint16_t> worldPort;
			uint16_t worldId;
			bool loaded;
	};

#endif