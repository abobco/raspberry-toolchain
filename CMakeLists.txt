cmake_minimum_required(VERSION 3.11) # FetchContent is available in 3.11+

# arm-hardfloat cross compiler toochain file
include(armhf-toolchain.cmake)

project(example)

 # build a debug symbol table for gdb
set(CMAKE_BUILD_TYPE Debug)

add_executable(${PROJECT_NAME} src/main.c)
# link all required libraries to the executable
# target_link_libraries(${PROJECT_NAME} pthread dl websockets)