cmake_minimum_required(VERSION 3.18)
project(linalg)

set(CONAN_EXTERNAL "${CMAKE_CURRENT_SOURCE_DIR}/conan_external")
include(${CONAN_EXTERNAL}/generators/conan_toolchain.cmake)

set(CMAKE_CXX_STANDARD 20)

add_library(linalg INTERFACE include/linalg/linalg.h)
target_include_directories(linalg INTERFACE include)
find_package(type_safe REQUIRED)
target_link_libraries(linalg INTERFACE type_safe::type_safe)


install(TARGETS linalg
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        PUBLIC_HEADER DESTINATION include/hello
)

install(DIRECTORY include/  # Note the slash at the end, which is important
        DESTINATION include  # This is the destination relative to CMAKE_INSTALL_PREFIX
        FILES_MATCHING PATTERN "*.h")


#add_executable(main main.cpp)
#target_link_libraries(main PRIVATE linalg)
