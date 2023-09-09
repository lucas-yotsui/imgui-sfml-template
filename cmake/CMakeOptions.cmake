set(COMPILER_WARNINGS 
    -Wall 
    -Wextra 
    -pedantic 
    -MD 
    -fno-exceptions 
)

set(INCLUDE_DIR ${CMAKE_SOURCE_DIR}/include)

# Use any extension you want bro
file(GLOB_RECURSE SOURCES 
        ${CMAKE_SOURCE_DIR}/source/*.c
        ${CMAKE_SOURCE_DIR}/source/*.C 
        ${CMAKE_SOURCE_DIR}/source/*.cpp
        ${CMAKE_SOURCE_DIR}/source/*.CPP
        ${CMAKE_SOURCE_DIR}/source/*.c++
        ${CMAKE_SOURCE_DIR}/source/*.cxx
        ${CMAKE_SOURCE_DIR}/source/*.cc
        ${CMAKE_SOURCE_DIR}/source/*.cp
        ${CMAKE_SOURCE_DIR}/app/*.c
        ${CMAKE_SOURCE_DIR}/app/*.C
        ${CMAKE_SOURCE_DIR}/app/*.cpp
        ${CMAKE_SOURCE_DIR}/app/*.CPP
        ${CMAKE_SOURCE_DIR}/app/*.c++
        ${CMAKE_SOURCE_DIR}/app/*.cxx
        ${CMAKE_SOURCE_DIR}/app/*.cc
        ${CMAKE_SOURCE_DIR}/app/*.cp
    )
    
# Use any extension you want bro
file(GLOB_RECURSE HEADERS 
        ${INCLUDE_DIR}/*.h 
        ${INCLUDE_DIR}/*.H 
        ${INCLUDE_DIR}/*.hh 
        ${INCLUDE_DIR}/*.hpp
        ${INCLUDE_DIR}/*.h++
        ${INCLUDE_DIR}/*.hxx
    )
    
# Use any extension you want bro
file(GLOB_RECURSE TESTS 
        ${CMAKE_SOURCE_DIR}/test/*.c
        ${CMAKE_SOURCE_DIR}/test/*.C 
        ${CMAKE_SOURCE_DIR}/test/*.cpp
        ${CMAKE_SOURCE_DIR}/test/*.CPP
        ${CMAKE_SOURCE_DIR}/test/*.c++
        ${CMAKE_SOURCE_DIR}/test/*.cxx
        ${CMAKE_SOURCE_DIR}/test/*.cc
        ${CMAKE_SOURCE_DIR}/test/*.cp
    )