# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/type_safe-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${type_safe_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${type_safe_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET type_safe::type_safe)
    add_library(type_safe::type_safe INTERFACE IMPORTED)
    message(${type_safe_MESSAGE_MODE} "Conan: Target declared 'type_safe::type_safe'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/type_safe-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()