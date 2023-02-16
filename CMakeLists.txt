cmake_minimum_required(VERSION 3.4.3)

project(Proj2 VERSION 1.0)

if (DEFINED LLVM_DIR)
    set(ENV{LLVM_DIR} "${LLVM_DIR}")
endif()

if (DEFINED ENV{LLVM_DIR})
    find_package(LLVM REQUIRED CONFIG)

    list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
    include(AddLLVM)

    add_definitions(${LLVM_DEFINITIONS})
    include_directories(${LLVM_INCLUDE_DIRS})
else()
    message(FATAL_ERROR "The LLVM_DIR var was not set")
endif()

add_subdirectory( lib )