// Original idea and template by Milice, continued and completed by Aurelion5670

#include "otpch.h"
#include "tools.h"
#include "gameworldconfig.h"
#include "pugicast.h"

GameWorldConfig::GameWorldConfig()
{
	loaded = false;
}

bool GameWorldConfig::load()
{
	pugi::xml_document doc;
	pugi::xml_parse_result result = doc.load_file("data/XML/gameworlds.xml");
	if (!result) {
		printXMLError("Error - GameWorldConfig::load", "gameworlds.xml", result);
		return false;
	}

	gameworlds.clear();

	for (auto catNode : doc.child("worlds").children()) {
		GameWorld gw;

		// Normal handling values
		gw.name = catNode.attribute("name").as_string();
		gw.ip = catNode.attribute("ip").as_string();
		gw.port = pugi::cast<uint16_t>(catNode.attribute("port").value());
		gw.worldid = pugi::cast<uint16_t>(catNode.attribute("id").value());

		// Stored values to use later
		std::string oldIp = gw.ip;
		const char * serverIp = oldIp.c_str();
		worldIp[gw.worldid] = serverIp;
		worldPort[gw.worldid] = gw.port;
		worldName[gw.worldid] = gw.name;

		gameworlds.push_back(gw);
	}

	loaded = true;
	return true;
}

const char* GameWorldConfig::getWorldIp(uint16_t id)
{
	return worldIp[id];
}

uint16_t GameWorldConfig::getWorldPort(uint16_t id)
{
	return worldPort[id];
}

std::string GameWorldConfig::getWorldName(uint16_t id)
{
	return worldName[id];
}

void GameWorldConfig::setWorldId(uint16_t id)
{
	worldId = id;
}

uint16_t GameWorldConfig::getWorldId()
{
	return worldId;
}

bool GameWorldConfig::reload()
{
	bool result = load();
	return result;
}