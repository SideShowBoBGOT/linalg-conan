# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(linalg_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(linalg_FRAMEWORKS_FOUND_DEBUG "${linalg_FRAMEWORKS_DEBUG}" "${linalg_FRAMEWORK_DIRS_DEBUG}")

set(linalg_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET linalg_DEPS_TARGET)
    add_library(linalg_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET linalg_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${linalg_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${linalg_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:type_safe::type_safe>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### linalg_DEPS_TARGET to all of them
conan_package_library_targets("${linalg_LIBS_DEBUG}"    # libraries
                              "${linalg_LIB_DIRS_DEBUG}" # package_libdir
                              "${linalg_BIN_DIRS_DEBUG}" # package_bindir
                              "${linalg_LIBRARY_TYPE_DEBUG}"
                              "${linalg_IS_HOST_WINDOWS_DEBUG}"
                              linalg_DEPS_TARGET
                              linalg_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "linalg"    # package_name
                              "${linalg_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${linalg_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET linalg::linalg
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${linalg_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${linalg_LIBRARIES_TARGETS}>
                 APPEND)

    if("${linalg_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET linalg::linalg
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     linalg_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET linalg::linalg
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${linalg_LINKER_FLAGS_DEBUG}> APPEND)
    set_property(TARGET linalg::linalg
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${linalg_INCLUDE_DIRS_DEBUG}> APPEND)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET linalg::linalg
                 PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${linalg_LIB_DIRS_DEBUG}> APPEND)
    set_property(TARGET linalg::linalg
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${linalg_COMPILE_DEFINITIONS_DEBUG}> APPEND)
    set_property(TARGET linalg::linalg
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${linalg_COMPILE_OPTIONS_DEBUG}> APPEND)

########## For the modules (FindXXX)
set(linalg_LIBRARIES_DEBUG linalg::linalg)
