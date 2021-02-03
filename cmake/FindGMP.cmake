# Locate GMP library
# This module defines
#   GMP_FOUND
#   GMP_INCLUDE_DIR
#   GMP_LIBRARIES

find_path(GMP_INCLUDE_DIR NAMES gmp.h)
find_library(GMP_LIBRARIES NAMES gmp libgmp)
find_library(GMPXX_LIBRARIES NAMES gmpxx libgmpxx)

get_filename_component(GMP_LIBRARIES_DIR "${GMP_LIBRARIES}" PATH CACHE)

include(FindPackageHandleStandardArgs)
if(MSVC)
    find_library(GMP_LIBRARIES NAMES mpir mpird
                PATHS
            $ENV{GMP_ROOT}
            $ENV{GMP_ROOT}/lib
            ${GMP_ROOT}
            ${GMP_ROOT}/lib
            ${CMAKE_SOURCE_DIR}/../tools/mpir/lib
            ${CMAKE_SOURCE_DIR}/../tools/mpird/lib
            ${CMAKE_SOURCE_DIR}/../mpir/lib
            ${CMAKE_SOURCE_DIR}/../mpird/lib

            $ENV{PROGRAMFILES}/mpir/lib
            $ENV{PROGRAMFILES}/mpird/lib
            $ENV{HOME}/mpir/lib
            $ENV{HOME}/mpird/lib
            ${CMAKE_INSTALL_PREFIX}/lib
            DOC "Try first the MPIR DLL when in an Windows environment"
    )

    get_filename_component(GMP_LIBRARIES_DIR "${GMP_LIBRARIES}" PATH)

    find_file(GMP_LIBRARY_DLL NAMES mpir.dll mpird.dll
                PATHS
            ${GMP_LIBRARIES_DIR}/../bin
            ${GMP_LIBRARIES_DIR}
)

     find_path(GMP_INCLUDE_DIRS
                NAMES mpir.h mpird.h
                PATHS
            ${GMP_LIBRARIES_DIR}/../include
            ${GMP_LIBRARIES_DIR}
)
else()
    FIND_PACKAGE_HANDLE_STANDARD_ARGS(GMP DEFAULT_MSG GMP_LIBRARIES GMP_LIBRARIES_DIR GMP_INCLUDE_DIR)
endif()
