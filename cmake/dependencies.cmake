include(FetchContent)

function(fetchDependencies)
    set(BUILD_SHARED_LIBS OFF)

    message(STATUS " --------------------------------------------------------------- ")
    message(STATUS "|         Fetching sfml and adding it to the project.           |")
    message(STATUS " --------------------------------------------------------------- ")
    FetchContent_Declare(
        sfml
        GIT_REPOSITORY https://github.com/SFML/SFML
        GIT_TAG 2.6.x
        SYSTEM
    )
    set(SFML_STATIC ON)    
    set(SFML_BUILD_EXAMPLES OFF)
    set(SFML_BUILD_DOC OFF)
    set(SFML_BUILD_NETWORK OFF)
    set(SFML_BUILD_AUDIO OFF)
    set(SFML_BUILD_GRAPHICS ON)
    set(SFML_BUILD_WINDOW ON)
    FetchContent_MakeAvailable(sfml)
    list(APPEND REMOTE_LIBS 
        sfml-system
        sfml-window
        sfml-graphics
    )

    message(STATUS " --------------------------------------------------------------- ")
    message(STATUS "|         Fetching imgui and adding it to the project.          |")
    message(STATUS " --------------------------------------------------------------- ")
    FetchContent_Declare(
        imgui
        GIT_REPOSITORY https://github.com/ocornut/imgui.git
        SYSTEM
    )
    FetchContent_MakeAvailable(imgui)

    message(STATUS " --------------------------------------------------------------- ")
    message(STATUS "|       Fetching imgui-sfml and adding it to the project.       |")
    message(STATUS " --------------------------------------------------------------- ")
    FetchContent_Declare(
        imgui-sfml
        GIT_REPOSITORY https://github.com/SFML/imgui-sfml
        GIT_TAG v2.6
        SYSTEM
    )
    set(IMGUI_DIR ${imgui_SOURCE_DIR})
    set(SFML_DIR ${SFML_BINARY_DIR})
    set(IMGUI_SFML_FIND_SFML OFF)
    set(IMGUI_SFML_IMGUI_DEMO ON) 
    FetchContent_MakeAvailable(imgui-sfml)
    list(APPEND REMOTE_LIBS ImGui-SFML::ImGui-SFML)
        
    target_link_libraries(${CMAKE_PROJECT_NAME} ${REMOTE_LIBS})
endfunction()

function(fetchGoogleTest)
    message(STATUS " --------------------------------------------------------------- ")
    message(STATUS "|       Fetching googletest and adding it to the project.       |")
    message(STATUS " --------------------------------------------------------------- ")
    FetchContent_Declare(
        googletest
        URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
    )
    FetchContent_MakeAvailable(googletest)

    target_link_libraries(${CMAKE_PROJECT_NAME}_test
        ${REMOTE_LIBS}
        GTest::gtest_main
        GTest::gmock_main
    )
endfunction()


function(copyAssets)
    add_custom_target(copy_assets
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_LIST_DIR}/assets ${CMAKE_CURRENT_BINARY_DIR}/assets)
    add_dependencies(${PROJECT_NAME} copy_assets)
endfunction()