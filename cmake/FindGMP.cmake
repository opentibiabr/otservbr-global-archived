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
    FIND_PACKAGE_HANDLE_STANDARD_ARGS(GMP DEFAULT_MSG GMP_LIBRARIES GMP_LIBRARIES_DIR GMP_LIBRARY_DLL GMP_INCLUDE_DIRS)
    mark_as_advanced(GMP_LIBRARY_DLL)
else()
    FIND_PACKAGE_HANDLE_STANDARD_ARGS(GMP DEFAULT_MSG GMP_LIBRARIES GMP_LIBRARIES_DIR GMP_INCLUDE_DIRS)
endif()