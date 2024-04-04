cmake_minimum_required(VERSION 3.5)
project(PackageTest CXX)

set(CMAKE_CXX_STANDARD 20)

find_package(linalg CONFIG REQUIRED)

add_executable(example src/example.cpp)
target_link_libraries(example PUBLIC linalg::linalg)
