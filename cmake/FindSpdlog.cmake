# Locate Spdlog library
# This module defines
#   Spdlog_FOUND
#   Spdlog_INCLUDE_DIR
#   Spdlog_LIBRARIES

find_path(Spdlog_INCLUDE_DIR NAMES cryptopp/cryptlib.h)
find_library(Spdlog_LIBRARIES NAMES cryptopp libcryptopp)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(Spdlog DEFAULT_MSG Spdlog_INCLUDE_DIR Spdlog_LIBRARIES)

mark_as_advanced(Spdlog_INCLUDE_DIR Spdlog_LIBRARIES)
