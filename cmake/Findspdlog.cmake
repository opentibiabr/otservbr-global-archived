# Find the spdlog include directory
# The following variables are set if spdlog is found.
#  spdlog_FOUND        - True when the spdlog include directory is found.
#  spdlog_INCLUDE_DIR  - The path to where the spdlog include files are.
# If spdlog is not found, spdlog_FOUND is set to false.

find_package(PkgConfig)

if(NOT EXISTS "${spdlog_INCLUDE_DIR}")
  find_path(spdlog_INCLUDE_DIR
    NAMES spdlog/spdlog.h
    DOC "spdlog library header files"
    )
endif()

if(EXISTS "${spdlog_INCLUDE_DIR}")
  include(FindPackageHandleStandardArgs)
  mark_as_advanced(spdlog_INCLUDE_DIR)
else()
  include(ExternalProject)
  ExternalProject_Add(spdlog
    GIT_REPOSITORY https://github.com/gabime/spdlog.git
    TIMEOUT 5
    CMAKE_ARGS -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER} -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
    PREFIX "${CMAKE_CURRENT_BINARY_DIR}"
    CONFIGURE_COMMAND "" # Disable configure step
    BUILD_COMMAND "" # Disable build step
    INSTALL_COMMAND "" # Disable install step
    UPDATE_COMMAND "" # Disable update step: clones the project only once
    )
  
  # Specify include dir
  ExternalProject_Get_Property(spdlog source_dir)
  set(spdlog_INCLUDE_DIR ${source_dir}/include)
endif()

if(EXISTS "${spdlog_INCLUDE_DIR}")
  set(spdlog_FOUND 1)
else()
  set(spdlog_FOUND 0)
endif()