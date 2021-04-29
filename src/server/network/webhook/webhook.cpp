#include "otpch.h"

#include "webhook.h"

#include <curl/curl.h>
#include <json/json.h>

#include <ctime>
#include <iostream>
#include <memory>

#include "configmanager.h"

extern ConfigManager g_config;

// Tread no further, adventurer!
// Go back while you still can.

static bool init = false;
static curl_slist *headers = NULL;

void webhook_init() {
	if (curl_global_init(CURL_GLOBAL_ALL) != 0) {
		SPDLOG_ERROR("Failed to init curl, no webhook messages may be sent");
		return;
	}

	headers = curl_slist_append(headers, "content-type: application/json");
	headers = curl_slist_append(headers, "accept: application/json");
	if (headers == NULL) {
		SPDLOG_ERROR("Failed to init curl, appending request headers failed");
		return;
	}

	init = true;
}

static int webhook_send_message_(const char *url, const char *payload, std::string *response_body);
static std::string get_payload(std::string title, std::string message, int color);

void webhook_send_message(std::string title, std::string message, int color) {
	std::string url = g_config.getString(ConfigManager::DISCORD_WEBHOOK_URL);
	if (url.empty()) {
		return;
	}

	if (!init) {
		SPDLOG_ERROR("Failed to send webhook message; Did not (successfully) init");
		return;
	}

	if (title.empty() || message.empty()) {
		SPDLOG_ERROR("Failed to send webhook message; "
                     "title or message to send was empty");
		return;
	}

	std::string payload = get_payload(title, message, color);
	std::string response_body = "";
	int response_code = webhook_send_message_(url.c_str(), payload.c_str(), &response_body);

	if (response_code != 204 && response_code != -1) {
		SPDLOG_ERROR("Failed to send webhook message; "
                     "HTTP request failed with code: {}"
                     "response body: {} request body: {}",
                     response_code, response_body, payload);
	}
}

static std::string get_payload(std::string title, std::string message, int color) {
	time_t now;
	time(&now);
	struct tm tm;

#ifdef _MSC_VER
  gmtime_s(&tm, &now);
#else
  gmtime_r(&now, &tm);
#endif

	char time_buf[sizeof "00:00"];
	strftime(time_buf, sizeof time_buf, "%R", &tm);

	std::stringstream footer_text;
	footer_text
			<< g_config.getString(ConfigManager::IP) << ":"
			<< g_config.getNumber(ConfigManager::GAME_PORT) << " | "
			<< time_buf << " UTC";

	Json::Value footer(Json::objectValue);
	footer["text"] = Json::Value(footer_text.str());

	Json::Value embed(Json::objectValue);
	embed["title"] = Json::Value(title);
	embed["description"] = Json::Value(message);
	embed["footer"] = footer;
	if (color >= 0) {
		embed["color"] = color;
	}

	Json::Value embeds(Json::arrayValue);
	embeds.append(embed);

	Json::Value payload(Json::objectValue);
	payload["embeds"] = embeds;

	Json::StreamWriterBuilder builder;
	builder["commentSyle"] = "None";
	builder["indentation"] = "";

	std::unique_ptr<Json::StreamWriter> writer(builder.newStreamWriter());
	std::stringstream out;
	writer->write(payload, &out);
	return out.str();
}

// Can't labmda this for some reason
static size_t write_data(void *ptr, size_t size, size_t nmemb, void *userdata) {
	(*static_cast<std::string *>(userdata)).append(static_cast<char *>(ptr), size * nmemb);
	return size * nmemb;
}

static int webhook_send_message_(const char *url, const char *payload, std::string *response_body) {
	CURL *curl = curl_easy_init();
	if (!curl) {
		SPDLOG_ERROR("Failed to send webhook message; curl_easy_init failed");
		return -1;
	}

	curl_easy_setopt(curl, CURLOPT_URL, url);
	curl_easy_setopt(curl, CURLOPT_POST, 1L);
	curl_easy_setopt(curl, CURLOPT_POSTFIELDS, payload);

	curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, &write_data);
	curl_easy_setopt(curl, CURLOPT_WRITEDATA, reinterpret_cast<void *>(&response_body));

	curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
	curl_easy_setopt(curl, CURLOPT_USERAGENT, "otservbr-global (https://github.com/Hydractify/otservbr-global)");

	CURLcode res = curl_easy_perform(curl);

	int response_code = -1;
	if (res == CURLE_OK) {
		curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &response_code);
	} else {
		SPDLOG_ERROR("Failed to send webhook message with the error: {}",
                     curl_easy_strerror(res));
	}

	curl_easy_cleanup(curl);

	return response_code;
}
