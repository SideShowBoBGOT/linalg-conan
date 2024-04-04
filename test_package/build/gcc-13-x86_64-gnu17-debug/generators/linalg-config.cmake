########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(linalg_FIND_QUIETLY)
    set(linalg_MESSAGE_MODE VERBOSE)
else()
    set(linalg_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/linalgTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${linalg_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(linalg_VERSION_STRING "1.0.3")
set(linalg_INCLUDE_DIRS ${linalg_INCLUDE_DIRS_DEBUG} )
set(linalg_INCLUDE_DIR ${linalg_INCLUDE_DIRS_DEBUG} )
set(linalg_LIBRARIES ${linalg_LIBRARIES_DEBUG} )
set(linalg_DEFINITIONS ${linalg_DEFINITIONS_DEBUG} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${linalg_BUILD_MODULES_PATHS_DEBUG} )
    message(${linalg_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


