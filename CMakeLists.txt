cmake_minimum_required(VERSION 2.8)

# https://gitlab.kitware.com/cmake/cmake/issues/18403
set(CMAKE_DISABLE_SOURCE_CHANGES ON)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)

project(tfs)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# GCC is fairly aggressive about it: enabling strict aliasing will cause it to think that pointers that are "obviously" equivalent to a human (as in, foo *a; bar *b = (bar *) a;) cannot alias, which allows for some very aggressive transformations, but can obviously break non-carefully written code.
if (CMAKE_COMPILER_IS_GNUCXX)
    add_compile_options(-fno-strict-aliasing)
endif()

# default build type
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release")
endif()

# compile flags
# https://kristerw.blogspot.com/2017/09/useful-gcc-warning-options-not-enabled.html
set(WARNING_FLAGS "-Wall -Werror")

set(CMAKE_CXX_FLAGS                     "${WARNING_FLAGS} ${CMAKE_CXX_FLAGS}")

# cmake ..
set(CMAKE_CXX_FLAGS_RELEASE             "${WARNING_FLAGS} -pipe -fvisibility=hidden -march=native -O2")

# cmake -DCMAKE_BUILD_TYPE=Debug ..
set(CMAKE_CXX_FLAGS_DEBUG               "${WARNING_FLAGS} -pipe -O0 -g -Wextra -Wconversion -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wold-style-cast -Wuseless-cast -Wdouble-promotion -Wshadow -Wformat=2 -Wno-error")

# Find packages.
find_package(Cotire REQUIRED)
find_package(LTO REQUIRED)
find_package(CXX11 REQUIRED)
find_package(Crypto++ REQUIRED)
find_package(PugiXML REQUIRED)
find_package(MySQL REQUIRED)
find_package(Threads REQUIRED)
find_package(Spdlog REQUIRED)
find_package(Boost 1.53.0 COMPONENTS system filesystem iostreams REQUIRED)

# Selects LuaJIT if user defines or auto-detected
if(DEFINED USE_LUAJIT AND NOT USE_LUAJIT)
set(FORCE_LUAJIT ${USE_LUAJIT})
else()
find_package(LuaJIT)
set(FORCE_LUAJIT ${LuaJIT_FOUND})
endif()
option(USE_LUAJIT "Use LuaJIT" ${FORCE_LUAJIT})

if(FORCE_LUAJIT)
if(APPLE)
set(CMAKE_EXE_LINKER_FLAGS "-pagezero_size 10000 -image_base 100000000")
endif()
else()
find_package(Lua REQUIRED)
endif()

add_subdirectory(src)
add_executable(tfs ${tfs_SRC})

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
    add_custom_target( doc_ldoc ALL
        COMMAND ${LDOC_EXECUTABLE} .
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Generating API documentation with Ldoc")
  else (LDOC_EXECUTABLE)
    message("Ldoc need to be installed to generate the ldoc documentation")
  endif (LDOC_EXECUTABLE)

endif (BUILD_DOC)

include_directories(SYSTEM ${MYSQL_INCLUDE_DIR} ${LUA_INCLUDE_DIR} ${Boost_INCLUDE_DIRS} ${PUGIXML_INCLUDE_DIR} ${Crypto++_INCLUDE_DIR} ${spdlog_INCLUDE_DIR})

target_link_libraries(tfs ${MYSQL_CLIENT_LIBS} ${LUA_LIBRARIES} ${Boost_LIBRARIES} ${Boost_FILESYSTEM_LIBRARY} ${PUGIXML_LIBRARIES} ${Crypto++_LIBRARIES} ${Spdlog_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})

set_target_properties(tfs PROPERTIES COTIRE_CXX_PREFIX_HEADER_INIT "src/otpch.h")
set_target_properties(tfs PROPERTIES COTIRE_ADD_UNITY_BUILD FALSE)

cotire(tfs)
