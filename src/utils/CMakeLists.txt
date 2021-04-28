add_library(utils
    const.h
    definitions.h
    enums.h
    lockfree.h
    pugicast.h
    thread_holder_base.h
    tools.cpp
    wildcardtree.cpp
)

target_include_directories(utils PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(utils
    PRIVATE
    Boost::boost
    Boost::date_time
    Boost::filesystem
    Boost::iostreams
    Boost::system
    cryptopp-static
    CURL::libcurl
    jsoncpp_static
    libmariadb mariadbclient
    pugixml::pugixml
    spdlog::spdlog
    Threads::Threads
    ${LUA_LIBRARIES}
)