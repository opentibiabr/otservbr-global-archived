cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

# CMAKE
# apt install build-essential git
# git clone https://github.com/Kitware/CMake/; cd CMake
# ./bootstrap && make && sudo make install

# VCPKG
# cmake -DCMAKE_TOOLCHAIN_FILE=/opt/workspace/vcpkg/scripts/buildsystems/vcpkg.cmake ..
# ./vcpkg install boost-asio boost-lockfree boost-variant boost-filesystem boost-iostreams boost-system libmariadb pugixml spdlog
set(VCPKG_FEATURE_FLAGS "versions")

# *****************************************************************************
# Project otbr
# *****************************************************************************
project(otbr)


# *****************************************************************************
# Append cmake search path
# *****************************************************************************
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)


# *****************************************************************************
# Include cmake tools
# *****************************************************************************
include(MessageColors)
include(LoggingHelper)


# *****************************************************************************
# Options
# *****************************************************************************
option(OPTIONS_ENABLE_CCACHE "Enable ccache" ON)
option(OPTIONS_ENABLE_IPO "Check and Enable interprocedural optimization (IPO/LTO)" ON)


# *****************************************************************************
# Options Code
# *****************************************************************************

# === CCACHE ===
if(OPTIONS_ENABLE_CCACHE)
    find_program(CCACHE ccache)
    if(CCACHE)
        log_option_enabled("ccache")
        set(CMAKE_CXX_COMPILER_LAUNCHER ${CCACHE})
        else()
        log_option_disabled("ccache")
    endif()
endif()


# === IPO ===
option(OPTIONS_ENABLE_IPO "Check and Enable interprocedural optimization (IPO/LTO)" ON)
if(OPTIONS_ENABLE_IPO)
  log_option_enabled("ipo")

  include(CheckIPOSupported)
  check_ipo_supported(RESULT result OUTPUT output)
  if(result)
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
  else()
    log_war("IPO is not supported: ${output}")
  endif()
else()
  log_option_disabled("ipo")
endif()


# *****************************************************************************
# Add project
# *****************************************************************************
add_subdirectory(src)
