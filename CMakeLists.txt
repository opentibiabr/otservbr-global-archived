cmake_minimum_required(VERSION 3.5)

# *****************************************************************************
# Features
# *****************************************************************************

# Enable interprocedural optimization for a target.
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# If CMake version is less than 3.15, the if block will be true, and the policy
# will be set to the current CMake version. If CMake is 3.15 or higher, the if
# block will be false, but the new syntax in cmake_minimum_required will be
# respected and this will continue to work properly!
# WARNING: MSVC's CMake server mode originally had a bug in reading this format,
# so if you need to support non-command line Windows builds for older MSVC
# versions, you will want to do this instead:
if(${CMAKE_VERSION} VERSION_LESS 3.15)
  cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
else()
  cmake_policy(VERSION 3.15)
endif()

# Avoid changes by cmake/make on the source tree
# https://gitlab.kitware.com/cmake/cmake/issues/18403
set(CMAKE_DISABLE_SOURCE_CHANGES ON)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)

find_program(CCACHE_PROGRAM ccache)
if(CCACHE_PROGRAM)
    set(CMAKE_CXX_COMPILER_LAUNCHER "${CCACHE_PROGRAM}")
endif()

# Make will print more details
set(CMAKE_VERBOSE_MAKEFILE OFF)

# *****************************************************************************
# Project OTBR
# *****************************************************************************
project(otbr)


# *****************************************************************************
# Packages / Libs
# *****************************************************************************

# Add cmake folder to help find cmake packages
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Find packages.
if (WIN32)
    # On Windows you must use cryptopp-static because the dynamic link library
    # is the FIPS DLL (which is something you should avoid).
    find_package(cryptopp CONFIG REQUIRED)
    set(CRYPTOPP_LIBRARIES "cryptopp-static")
else ()
  find_package(CryptoPP REQUIRED)
endif ()

find_package(PugiXML REQUIRED)
find_package(MySQL REQUIRED)
find_package(Threads REQUIRED)
find_package(Boost 1.53.0 COMPONENTS system filesystem iostreams date_time REQUIRED)
find_package(CURL REQUIRED)
find_package(jsoncpp REQUIRED)

# Selects LuaJIT if user defines or auto-detected
find_package(LuaJIT)
if (APPLE)
  set(CMAKE_EXE_LINKER_FLAGS "-pagezero_size 10000 -image_base 100000000")
endif ()


# *****************************************************************************
# Build Type Release or Debug
# *****************************************************************************

# Set default build type, to change use -DCMAKE_BUILD_TYPE=<Release|Debug>
# E.g: How check build type "if (CMAKE_BUILD_TYPE MATCHES Debug)"
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release")
endif()


# *****************************************************************************
# Options that can be E.g. 'enable cmake -DOPTION ..'
# *****************************************************************************

# cmake -DDEBUG_LOG=ON ..
option(DEBUG_LOG "Enable Debug Log" OFF)
if(DEBUG_LOG)
  add_definitions( -DDEBUG_LOG )
  message("---------- DEBUG log enabled!")
endif()


# *****************************************************************************
# Compile flags and checks
# *****************************************************************************

set(CMAKE_CXX_FLAGS     "${CMAKE_CXX_FLAGS} -std=c++11 -lstdc++ -lpthread -ldl")

# compile flags
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  # using Clang
  # cmake -DCMAKE_BUILD_TYPE=Release ..
  set(CMAKE_CXX_FLAGS_RELEASE   "-pipe -fvisibility=hidden -march=native -O3 -Wno-everything")

  # cmake -DCMAKE_BUILD_TYPE=Debug ..
  set(CMAKE_CXX_FLAGS_DEBUG     "-pipe -O0 -g -Wno-everything")

elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  # using GCC

  #Check GCC version
  if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "5.1")
    message(FATAL_ERROR "Insufficient gcc version. It has to be equal or greater than version 5.X")
  endif()

  # GCC is fairly aggressive about it: enabling strict aliasing will cause it to
  # think that pointers that are "obviously" equivalent to a human (as in,
  # foo *a; bar *b = (bar *) a;) cannot alias, which allows for some very
  # aggressive transformations, but can obviously break non-carefully written
  # code.
  add_compile_options(-fno-strict-aliasing)

  # https://kristerw.blogspot.com/2017/09/useful-gcc-warning-options-not-enabled.html

  # cmake -DCMAKE_BUILD_TYPE=Release ..
  set(CMAKE_CXX_FLAGS_RELEASE   " -Wno-format -pipe -fvisibility=hidden -march=native -O3")

  # cmake -DCMAKE_BUILD_TYPE=Debug ..
  # Ubuntu 16.04
  if(CMAKE_CXX_COMPILER_VERSION STREQUAL "5.4.0" OR CMAKE_CXX_COMPILER_VERSION STREQUAL "5.5.0")
    set(CMAKE_CXX_FLAGS_DEBUG   "-Wall -Wextra -Werror -pipe -O0 -g -Wconversion -Wlogical-op -Wold-style-cast -Wuseless-cast -Wdouble-promotion -Wshadow -Wformat=2 -Wno-error")
  else()
    # Ubuntu 18.04
    set(CMAKE_CXX_FLAGS_DEBUG   "-Wall -Wextra -Werror -pipe -O0 -g -Wconversion -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wold-style-cast -Wuseless-cast -Wdouble-promotion -Wshadow -Wformat=2 -Wno-error")
  endif()

elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  # using Visual Studio C++
  # cmake -DCMAKE_BUILD_TYPE=Release ..
  set(CMAKE_CXX_FLAGS_RELEASE   " /Wall")

  # cmake -DCMAKE_BUILD_TYPE=Debug ..
  set(CMAKE_CXX_FLAGS_DEBUG     " /Wall")
endif()

# *****************************************************************************
# Add Source Directory
# *****************************************************************************
add_subdirectory(src)


# *****************************************************************************
# Library
# *****************************************************************************
add_library(otbr_lib ${otbr_SRC})


# *****************************************************************************
# Executable
# *****************************************************************************
add_executable(otbr ${CMAKE_CURRENT_SOURCE_DIR}/src/otserv.cpp)


# *****************************************************************************
# Doxygen
# *****************************************************************************

# cmake -DBUILD_DOC=ON ..
option(BUILD_DOC "Build documentation" OFF)
if(BUILD_DOC)

  file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/doc)

  find_package(Doxygen)
  if (DOXYGEN_FOUND)
      # set input and output files
      set(DOXYGEN_IN ${CMAKE_CURRENT_SOURCE_DIR}/docs/Doxyfile.in)
      set(DOXYGEN_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

      # request to configure the file
      configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)

      #make doc_doxygen
      add_custom_target( doc_doxygen ALL
          COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
          WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
          COMMENT "Generating API documentation with Doxygen"
          VERBATIM )

  else (DOXYGEN_FOUND)
    message("Doxygen need to be installed to generate the doxygen documentation")
  endif (DOXYGEN_FOUND)

  find_program(LDOC_EXECUTABLE ldoc FALSE)
  if(NOT LDOC_EXECUTABLE)
      find_program(LDOC_EXECUTABLE ldoc.lua FALSE)
  endif()
  if (LDOC_EXECUTABLE)
    # set input and output files
    set(LDOC_IN ${CMAKE_CURRENT_SOURCE_DIR}/docs/config.ld.in)
    set(LDOC_OUT ${CMAKE_CURRENT_BINARY_DIR}/config.ld)

    # request to configure the file
    configure_file(${LDOC_IN} ${LDOC_OUT} @ONLY)
    # execute_process(COMMAND sh -c "${LDOC_EXECUTABLE} .")

    #make doc_ldoc
    add_custom_target( doc_ldoc ALL
        COMMAND ${LDOC_EXECUTABLE} .
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Generating API documentation with Ldoc")
  else (LDOC_EXECUTABLE)
    message("Ldoc need to be installed to generate the ldoc documentation")
  endif (LDOC_EXECUTABLE)

endif (BUILD_DOC)

# *****************************************************************************
# Git Version
# *****************************************************************************

# Define the two required variables before including
# the source code for watching a git repository.
set(PRE_CONFIGURE_FILE "cmake/gitmetadata.h.in")
set(POST_CONFIGURE_FILE "${CMAKE_CURRENT_BINARY_DIR}/gitmetadata.h")
include(git_watcher)
if (Git_FOUND)
    message("-- Git Found")
    add_dependencies(otbr check_git)
    target_include_directories(otbr PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
endif()

# *****************************************************************************
# Tests
# *****************************************************************************

option(PACKAGE_TESTS "Build the tests" OFF)
if(PACKAGE_TESTS)
    enable_testing()
    add_subdirectory(tests)
    target_compile_definitions(otbr_lib PRIVATE UNIT_TESTING=1)
endif()

# *****************************************************************************
# Includes & Libraries
# *****************************************************************************
include_directories(SYSTEM ${MYSQL_INCLUDE_DIR} ${LUA_INCLUDE_DIR}
                    ${Boost_INCLUDE_DIRS} ${PUGIXML_INCLUDE_DIR}
                    ${CRYPTOPP_INCLUDE_DIR} ${CURL_INCLUDE_DIRS} $<TARGET_PROPERTY:jsoncpp_lib,INTERFACE_INCLUDE_DIRECTORIES>)

target_link_libraries(otbr otbr_lib ${MYSQL_CLIENT_LIBS} ${LUA_LIBRARIES}
                      ${Boost_LIBRARIES} ${Boost_FILESYSTEM_LIBRARY}
                      ${PUGIXML_LIBRARIES} ${CRYPTOPP_LIBRARIES}
                      ${CMAKE_THREAD_LIBS_INIT} ${CURL_LIBRARIES} jsoncpp_lib)
