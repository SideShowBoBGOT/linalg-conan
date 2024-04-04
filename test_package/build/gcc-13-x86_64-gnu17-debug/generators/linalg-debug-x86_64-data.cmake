########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(linalg_COMPONENT_NAMES "")
list(APPEND linalg_FIND_DEPENDENCY_NAMES type_safe)
list(REMOVE_DUPLICATES linalg_FIND_DEPENDENCY_NAMES)
set(type_safe_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(linalg_PACKAGE_FOLDER_DEBUG "/home/sideshowbobgot/.conan2/p/b/linal8e923ebcca87b/p")
set(linalg_BUILD_MODULES_PATHS_DEBUG )


set(linalg_INCLUDE_DIRS_DEBUG "${linalg_PACKAGE_FOLDER_DEBUG}/include")
set(linalg_RES_DIRS_DEBUG )
set(linalg_DEFINITIONS_DEBUG )
set(linalg_SHARED_LINK_FLAGS_DEBUG )
set(linalg_EXE_LINK_FLAGS_DEBUG )
set(linalg_OBJECTS_DEBUG )
set(linalg_COMPILE_DEFINITIONS_DEBUG )
set(linalg_COMPILE_OPTIONS_C_DEBUG )
set(linalg_COMPILE_OPTIONS_CXX_DEBUG )
set(linalg_LIB_DIRS_DEBUG )
set(linalg_BIN_DIRS_DEBUG )
set(linalg_LIBRARY_TYPE_DEBUG UNKNOWN)
set(linalg_IS_HOST_WINDOWS_DEBUG 0)
set(linalg_LIBS_DEBUG )
set(linalg_SYSTEM_LIBS_DEBUG )
set(linalg_FRAMEWORK_DIRS_DEBUG )
set(linalg_FRAMEWORKS_DEBUG )
set(linalg_BUILD_DIRS_DEBUG )
set(linalg_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(linalg_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${linalg_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${linalg_COMPILE_OPTIONS_C_DEBUG}>")
set(linalg_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${linalg_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${linalg_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${linalg_EXE_LINK_FLAGS_DEBUG}>")


set(linalg_COMPONENTS_DEBUG )