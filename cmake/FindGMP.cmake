# Try to find the GMP library and set the following variables.
#
#  GMP_FOUND - system has GMP library
#  GMP_INCLUDE_DIR - the GMP include directory
#  GMP_LIBRARIES - GMP library used for linking

if(GMP_INCLUDE_DIR AND GMP_LIBRARIES)
  # Already in cache, be silent
  set(GMP_FIND_QUIETLY TRUE)
endif(GMP_INCLUDE_DIR AND GMP_LIBRARIES)

find_path(GMP_INCLUDE_DIR NAMES gmp.h)
# Check if path is correct
if(GMP_INCLUDE_DIR)
  if(NOT EXISTS ${GMP_INCLUDE_DIR}/gmp.h)
    message(FATAL_ERROR "GMP include directory ${GMP_INCLUDE_DIR} does not seem to be correct.")
  endif(NOT EXISTS ${GMP_INCLUDE_DIR}/gmp.h)
endif(GMP_INCLUDE_DIR)

find_library(GMP_LIBRARIES NAMES gmp libgmp)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GMP "Could NOT find GMP. Please check variables GMP_INCLUDE_DIR and GMP_LIBRARIES." GMP_INCLUDE_DIR GMP_LIBRARIES)

mark_as_advanced(GMP_INCLUDE_DIR GMP_LIBRARIES)
