# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(type_safe_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(type_safe_FRAMEWORKS_FOUND_DEBUG "${type_safe_FRAMEWORKS_DEBUG}" "${type_safe_FRAMEWORK_DIRS_DEBUG}")

set(type_safe_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET type_safe_DEPS_TARGET)
    add_library(type_safe_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET type_safe_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${type_safe_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${type_safe_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### type_safe_DEPS_TARGET to all of them
conan_package_library_targets("${type_safe_LIBS_DEBUG}"    # libraries
                              "${type_safe_LIB_DIRS_DEBUG}" # package_libdir
                              "${type_safe_BIN_DIRS_DEBUG}" # package_bindir
                              "${type_safe_LIBRARY_TYPE_DEBUG}"
                              "${type_safe_IS_HOST_WINDOWS_DEBUG}"
                              type_safe_DEPS_TARGET
                              type_safe_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "type_safe"    # package_name
                              "${type_safe_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${type_safe_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET type_safe::type_safe
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${type_safe_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${type_safe_LIBRARIES_TARGETS}>
                 APPEND)

    if("${type_safe_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET type_safe::type_safe
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     type_safe_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET type_safe::type_safe
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${type_safe_LINKER_FLAGS_DEBUG}> APPEND)
    set_property(TARGET type_safe::type_safe
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${type_safe_INCLUDE_DIRS_DEBUG}> APPEND)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET type_safe::type_safe
                 PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${type_safe_LIB_DIRS_DEBUG}> APPEND)
    set_property(TARGET type_safe::type_safe
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${type_safe_COMPILE_DEFINITIONS_DEBUG}> APPEND)
    set_property(TARGET type_safe::type_safe
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${type_safe_COMPILE_OPTIONS_DEBUG}> APPEND)

########## For the modules (FindXXX)
set(type_safe_LIBRARIES_DEBUG type_safe::type_safe)
