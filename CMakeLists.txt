cmake_minimum_required(VERSION 3.18)
project(linalg)

set(CMAKE_CXX_STANDARD 20)

add_library(linalg INTERFACE include/linalg/linalg.h)
target_include_directories(linalg INTERFACE include)
