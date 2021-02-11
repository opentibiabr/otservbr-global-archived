# Find the spdlog include directory
#
# This module supports requiring a minimum version, e.g. you can do
#   find_package(Spdlog 1.2.3)
# to require version 1.2.3 or newer of spdlog.
#
# The following variables are set if spdlog is found.
#    Spdlog_FOUND        - True when the spdlog include directory is found.
#    Spdlog_INCLUDE_DIR  - The path to where the spdlog include files are.
#    Spdlog_VERSION      - The version of spdlog version
#
# Further the following import target will be created, if Spdlog_FOUND is true
#     spdlog::spdlog_header_only - The header-only spdlog library
#
# This module reads hints about search locations from
# the following environment variables:
#
# Spdlog_ROOT
# Spdlog_ROOT_DIR
#
# as well as in the following subdirectories
#
# include
# thirdparty
# ThirdParty
# external
#
#

# function to check version of spdlog
macro(_spdlog_check_version)
  file(READ "${Spdlog_INCLUDE_DIR}/include/spdlog/version.h" _spdlog_version_header)

  string(REGEX MATCH "define[ \t]+SPDLOG_VER_MAJOR[ \t]+([0-9]+)" _spdlog_major_version_match "${_spdlog_version_header}")
  set(SPDLOG_MAJOR_VERSION "${CMAKE_MATCH_1}")

  string(REGEX MATCH "define[ \t]+SPDLOG_VER_MINOR[ \t]+([0-9]+)" _spdlog_minor_version_match "${_spdlog_version_header}")
  set(SPDLOG_MINOR_VERSION "${CMAKE_MATCH_1}")

  string(REGEX MATCH "define[ \t]+SPDLOG_VER_PATCH[ \t]+([0-9]+)" _spdlog_patch_version_match "${_spdlog_version_header}")
  set(SPDLOG_PATCH_VERSION "${CMAKE_MATCH_1}")

  set(Spdlog_VERSION ${SPDLOG_MAJOR_VERSION}.${SPDLOG_MINOR_VERSION}.${SPDLOG_PATCH_VERSION})
  if(${Spdlog_VERSION} VERSION_LESS ${Spdlog_FIND_VERSION})
    set(Spdlog_VERSION_OK FALSE)
  else(${Spdlog_VERSION} VERSION_LESS ${Spdlog_FIND_VERSION})
    set(Spdlog_VERSION_OK TRUE)
  endif(${Spdlog_VERSION} VERSION_LESS ${Spdlog_FIND_VERSION})

  if(NOT Spdlog_VERSION_OK)

    message(STATUS "spdlog version ${Spdlog_VERSION} found in ${Spdlog_INCLUDE_DIR}, but at least version ${Spdlog_FIND_VERSION} is required")
  endif(NOT Spdlog_VERSION_OK)
endmacro(_spdlog_check_version)

# if no version is given, we just fall back to version 1.3.0
if(NOT Spdlog_FIND_VERSION)
  if(NOT SPDLOG_MAJOR_VERSION)
    set(SPDLOG_MAJOR_VERSION 1)
  endif(NOT SPDLOG_MAJOR_VERSION)
  if(NOT SPDLOG_MINOR_VERSION)
    set(SPDLOG_MINOR_VERSION 3)
  endif(NOT SPDLOG_MINOR_VERSION)
  if(NOT SPDLOG_PATCH_VERSION)
    set(SPDLOG_PATCH_VERSION 0)
  endif(NOT SPDLOG_PATCH_VERSION)

  set(Spdlog_FIND_VERSION "${SPDLOG_MAJOR_VERSION}.${SPDLOG_MINOR_VERSION}.${SPDLOG_PATCH_VERSION}")
endif(NOT Spdlog_FIND_VERSION)

if(EXISTS "${Spdlog_INCLUDE_DIR}")
  _spdlog_check_version()
  set(Spdlog_FOUND ${Spdlog_VERSION_OK})

else(EXISTS "${Spdlog_INCLUDE_DIR}")
  # search first if an SpdlogConfig.cmake is available in the system,
  # if successful this would set Spdlog_INCLUDE_DIR and the rest of
  # the script will work as usual
  find_package(Spdlog ${Spdlog_FIND_VERSION} NO_MODULE QUIET)

  if(NOT Spdlog_INCLUDE_DIR)
    find_path(Spdlog_INCLUDE_DIR
            NAMES include/spdlog/spdlog.h
            HINTS
                ENV SPDLOG_ROOT
                ENV SPDLOG_ROOT_DIR
                include
                thirdparty
                ThirdParty
                external
            DOC "spdlog library header files"
            PATH_SUFFIXES spdlog
            )
  endif(NOT Spdlog_INCLUDE_DIR)

  if(Spdlog_INCLUDE_DIR)
    _spdlog_check_version()
  endif(Spdlog_INCLUDE_DIR)

  set(Spdlog_FOUND 0)
endif(EXISTS "${Spdlog_INCLUDE_DIR}")

if(NOT Spdlog_FOUND)
  message(STATUS "spdlog could not be found")
endif(NOT Spdlog_FOUND)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Spdlog DEFAULT_MSG Spdlog_INCLUDE_DIR Spdlog_VERSION_OK)
mark_as_advanced(Spdlog_INCLUDE_DIR)

if(Spdlog_FOUND AND NOT TARGET spdlog::spdlog_header_only)
  add_library(spdlog::spdlog_header_only INTERFACE IMPORTED)
  set_target_properties(spdlog::spdlog_header_only PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${Spdlog_INCLUDE_DIR}/include")
endif(Spdlog_FOUND AND NOT TARGET spdlog::spdlog_header_only)
