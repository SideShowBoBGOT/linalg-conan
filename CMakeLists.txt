cmake_minimum_required(VERSION 3.18)
project(linalg)

set(CMAKE_CXX_STANDARD 20)

add_library(linalg INTERFACE include/linalg/linalg.h)
target_include_directories(linalg INTERFACE include)

install(TARGETS linalg
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        PUBLIC_HEADER DESTINATION include/hello
)

install(DIRECTORY include/  # Note the slash at the end, which is important
        DESTINATION include  # This is the destination relative to CMAKE_INSTALL_PREFIX
        FILES_MATCHING PATTERN "*.h")
