# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/linalg-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${linalg_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${linalg_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET linalg::linalg)
    add_library(linalg::linalg INTERFACE IMPORTED)
    message(${linalg_MESSAGE_MODE} "Conan: Target declared 'linalg::linalg'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/linalg-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()