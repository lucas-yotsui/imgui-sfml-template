# ------------------------------------ Project definitions ------------------------------------ #
cmake_minimum_required(VERSION 3.24)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)

include(${CMAKE_SOURCE_DIR}/cmake/CMakeOptions.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/dependencies.cmake)
# --------------------------------------------------------------------------------------------- #


# --------------------------------------- Build section --------------------------------------- #
project(
    imgui_project
    VERSION 0.1
    DESCRIPTION "Primeira tentativa de uso da biblioteca DearImGUI"
)

include_directories(BEFORE ${INCLUDE_DIR})

add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS})

target_compile_options(${PROJECT_NAME} PRIVATE ${COMPILER_WARNINGS})

fetchDependencies()

copyAssets()
# --------------------------------------------------------------------------------------------- #


# -------------------------------------- Testing section -------------------------------------- #
enable_testing()

add_executable(${PROJECT_NAME}_test ${TESTS})

fetchGoogleTest()

include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME}_test)
# --------------------------------------------------------------------------------------------- #