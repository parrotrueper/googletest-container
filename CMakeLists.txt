cmake_minimum_required(VERSION 3.13)

project(SampleProject LANGUAGES CXX)

add_subdirectory(googletest)

find_package(PkgConfig REQUIRED)
pkg_search_module(GLIB REQUIRED glib-2.0)

include_directories(${GLIB_INCLUDE_DIRS})
link_directories(${GLIB_LIBRARY_DIRS})

set(HEADERS
    include/debug.h
)
    
set(SOURCES
    src/main.cpp
)

add_compile_definitions(DD_PRINTK_EN=0)
#add_compile_options("--coverage")

add_library(core ${HEADERS} ${SOURCES})

target_include_directories(core
    PUBLIC
    ${PROJECT_SOURCE_DIR}/include
)


add_executable(SampleProject main.cpp)

target_link_libraries(SampleProject
    core
#    gcov
    )

enable_testing()

add_subdirectory(test)
