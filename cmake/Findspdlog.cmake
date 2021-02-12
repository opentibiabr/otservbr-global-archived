# Locate Spdlog library
# This module defines
#   SPDLOG_FOUND
#   SPDLOG_INCLUDE_DIR
#   SPDLOG_LIBRARY

find_path(SPDLOG_INCLUDE_DIR NAMES spdlog/spdlog.h)

find_library(SPDLOG_LIBRARY NAMES spdlog spdlog)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(spdlog DEFAULT_MSG SPDLOG_INCLUDE_DIR SPDLOG_LIBRARY)

mark_as_advanced(SPDLOG_INCLUDE_DIR SPDLOG_LIBRARY)

# Add imported target.
if(SPDLOG_FOUND)
    set(SPDLOG_INCLUDE_DIRS "${SPDLOG_INCLUDE_DIR}")

    if(NOT SPDLOG_FIND_QUIETLY)
        message(STATUS "SPDLOG_INCLUDE_DIRS ........... ${SPDLOG_INCLUDE_DIR}")
        message(STATUS "SPDLOG_LIBRARY ................ ${SPDLOG_LIBRARY}")
    endif()

    if(NOT TARGET spdlog::spdlog)
        add_library(spdlog::spdlog UNKNOWN IMPORTED)
        set_target_properties(spdlog::spdlog PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${SPDLOG_INCLUDE_DIRS}")

        set_property(TARGET spdlog::spdlog APPEND PROPERTY
            IMPORTED_LOCATION "${SPDLOG_LIBRARY}")
    endif()
endif()
